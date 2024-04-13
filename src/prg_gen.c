/*
VDC Screen Editor
Screen editor for the C128 80 column mode
Written in 2021 by Xander Mol

https://github.com/xahmol/VDCScreenEdit
https://www.idreamtin8bits.com/

Code and resources from others used:

-   Oscar64 cross compiler

    https://github.com/drmortalwombat/oscar64

    Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   C128 Programmers Reference Guide: For the basic VDC register routines and VDC code inspiration
    http://www.zimmers.net/anonftp/pub/cbm/manuals/c128/C128_Programmers_Reference_Guide.pdf

-   Scott Hutter - VDC Core functions inspiration:
    https://github.com/Commodore64128/vdc_gui/blob/master/src/vdc_core.c
    (used as starting point, but changed to inline assembler for core functions, added VDC wait statements and expanded)

-   Francesco Sblendorio - Screen Utility: used for inspiration:
    https://github.com/xlar54/ultimateii-dos-lib/blob/master/src/samples/screen_utility.c

-   DevDef: Commodore 128 Assembly - Part 3: The 80-column (8563) chip
    https://devdef.blogspot.com/2018/03/commodore-128-assembly-part-3-80-column.html

-   Tips and Tricks for C128: VDC
    http://commodore128.mirkosoft.sk/vdc.html

-   6502.org: Practical Memory Move Routines: Starting point for memory move routines
    http://6502.org/source/general/memory_move.html

-   DraBrowse source code for DOS Command and text input routine
    DraBrowse (db*) is a simple file browser.
    Originally created 2009 by Sascha Bader.
    Used version adapted by Dirk Jagdmann (doj)
    https://github.com/doj/dracopy

-   Bart van Leeuwen: For inspiration and advice while coding.
    Also for providing the excellent Device Manager ROM to make testing on real hardware very easy

-   jab / Artline Designs (Jaakko Luoto) for inspiration for Palette mode and PETSCII visual mode

-   Original windowing system code on Commodore 128 by unknown author.

-   Tested using real hardware (C128D and C128DCR) plus VICE.

The code can be used freely as long as you retain
a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL,
BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
*/

// Includes
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <conio.h>
#include <petscii.h>
#include <ctype.h>
#include <c64/kernalio.h>
#include <c64/cia.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "defines.h"
#include "vdc_nobnk.h"
#include "vdcwin_nobnk.h"
#include "bank_minimal.h"

// Viewer data addess. Align with the address of the view struct in view.c
#define VIEW 0x36dd
#define BASICSTART 0x1c01
#define MEMSTART 0x4000
#define MEMMAX 0xbfff

// Kernal defines for IEC statis detection
#define STATUS 0x90 // Kernal I/O completion status
#define SECOND 0xFF93
#define UNLSN 0xFFAE
#define LISTEN 0xFFB1

#define X(a, b, c) linebuffer[len - 3] == a &&linebuffer[len - 2] == b &&linebuffer[len - 1] == c

#define CBM_T_REG 0x10 /* Bit set for regular files */
#define CBM_T_SEQ 0x10
#define CBM_T_PRG 0x11
#define CBM_T_USR 0x12
#define CBM_T_REL 0x13
#define CBM_T_VRP 0x14 /* Vorpal fast-loadable format */
#define CBM_T_DEL 0x00
#define CBM_T_CBM 0x01    /* 1581 sub-partition */
#define CBM_T_DIR 0x02    /* IDE64 and CMD sub-directory */
#define CBM_T_LNK 0x03    /* IDE64 soft-link */
#define CBM_T_OTHER 0x04  /* File-type not recognized */
#define CBM_T_HEADER 0x05 /* Disk header / title */
#define CBM_T_FREE 100
#define DISK_ID_LEN 5
#define CBM_A_RO 1 /* Read only   */
#define CBM_A_WO 2 /* Write only  */
#define CBM_A_RW 3 /* Read, Write */

// File picker defines
#define DIRH 14
#define DIRY 2
#define DIRX 10
#define DIRW 60
#define MAXDEVID 30

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdcse2prg, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )

// Global variables
struct VIEWDATA
{
    char *screen;
    char *charstd;
    char *charalt;
    unsigned width;
    unsigned height;
    unsigned screensize;
    char mode;
    char background;
};
struct VIEWDATA view;
struct DirEntry
{
    char name[17]; /* File name in PetSCII, limited to 16 chars */
    unsigned size; /* Size, in 254-/256-byte blocks */
    char type;
    char access;
};
struct DirElement
{
    struct DirEntry dirent;
    struct DirElement *next;
    struct DirElement *prev;
};
struct Directory
{
    /// 16 characters name
    /// 1 comma
    /// 5 characters ID
    /// NUL
    char name[16 + 1 + 5 + 1];
    struct DirElement *firstelement;
    struct DirElement *selected;
    struct DirElement *firstprinted;
    /// current cursor position
    unsigned int pos;
    /// number of free blocks
    unsigned int free;
};
const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];
char linebuffer2[81];
const char progressBar[4] = {0xA5, 0xA1, 0xA7, ' '};
const char progressRev[4] = {0, 0, 1, 1};
char disk_id_buf[5];
struct DirElement direlement_size;
struct DirElement *previous;
struct DirElement *current;
struct DirElement *next;
struct Directory cwd;
char DOSstatus[40];
char charsetchanged[2];
char targetdevice;
char filename[21];
char filedest[21] = "";
struct VDCWin fullscreen;
char buffer[81];
struct VDCWin interface;

// Menucolors
char mc_mb_normal = VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_mb_select = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_pd_normal = VDC_DCYAN + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_pd_select = VDC_LYELLOW + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_menupopup = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_default = VDC_LYELLOW + VDC_A_ALTCHAR;

// Generic routines
char dosCommand(const char lfn, const char drive, const char sec_addr, const char *cmd)
// Send DOS command - extended
{
    // Send DOS command
    // based on version DraCopy 1.0e, then modified.
    // Created 2009 by Sascha Bader.

    int res;
    krnio_setbnk(0, 0);
    krnio_setnam(cmd);
    if (!krnio_open(lfn, drive, sec_addr))
    {
        krnio_close(lfn);
        return krnio_status();
    }

    if (lfn != 15)
    {
        krnio_setnam("");
        if (!krnio_open(15, drive, 15))
        {
            krnio_close(lfn);
            krnio_close(15);
            return krnio_pstatus[15];
        }
    }

    DOSstatus[0] = 0;
    res = krnio_read(15, DOSstatus, sizeof(DOSstatus));

    if (lfn != 15)
    {
        krnio_close(15);
    }
    krnio_close(lfn);

    if (!res)
    {
        return krnio_status();
    }

    return (DOSstatus[0] - 48) * 10 + DOSstatus[1] - 48;
}

unsigned cmd(const char device, const char *cmd)
// Set DOS Command - simplified
{
    // Prepare DOS command
    // based on version DraCopy 1.0e, then modified.
    // Created 2009 by Sascha Bader.

    return dosCommand(15, device, 15, cmd);
}

signed textInput(char xpos, char ypos, char *str, unsigned char size)
/**
 * input/modify a string.
 * based on version DraCopy 1.0e, then modified.
 * Created 2009 by Sascha Bader.
 * @param[in] xpos screen x where input starts.
 * @param[in] ypos screen y where input starts.
 * @param[in,out] str string that is edited, it can have content and must have at least @p size + 1 bytes. Maximum size     if 255 bytes.
 * @param[in] size maximum length of @p str in bytes.
 * @return -1 if input was aborted.
 * @return >= 0 length of edited string @p str.
 */
{

    char c;
    char idx = strlen(str);

    if (idx)
    {
        vdc_prints(xpos, ypos, str);
    }
    vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
    vdcwin_cursor_toggle(&fullscreen);

    while (1)
    {
        c = vdcwin_getch();
        switch (c)
        {
        case CH_ESC:
        case CH_STOP:
            vdcwin_cursor_toggle(&fullscreen);
            return -1;

        case CH_ENTER:
            idx = strlen(str);
            str[idx] = 0;
            vdcwin_cursor_toggle(&fullscreen);
            return idx;

        case CH_DEL:
            if (idx)
            {
                vdcwin_cursor_toggle(&fullscreen);
                --idx;
                vdc_printc(xpos + idx, ypos, CH_SPACE, mc_menupopup);
                for (c = idx; 1; ++c)
                {
                    char b = str[c + 1];
                    str[c] = b;

                    vdc_printc(xpos + c, ypos, b ? pet2screen(b) : CH_SPACE, mc_menupopup);
                    if (b == 0)
                    {
                        break;
                    }
                }
                vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
                vdcwin_cursor_toggle(&fullscreen);
            }
            break;

        case CH_INS:
            c = strlen(str);
            if (c < size && c > 0 && idx < c)
            {
                vdcwin_cursor_toggle(&fullscreen);
                ++c;
                while (c >= idx)
                {
                    str[c + 1] = str[c];
                    if (c == 0)
                    {
                        break;
                    }
                    --c;
                }
                str[idx] = ' ';
                vdc_prints(xpos, ypos, str);
                vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
                vdcwin_cursor_toggle(&fullscreen);
            }
            break;

        case CH_CURS_LEFT:
            if (idx)
            {
                vdcwin_cursor_toggle(&fullscreen);
                --idx;
                vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
                vdcwin_cursor_toggle(&fullscreen);
            }
            break;

        case CH_CURS_RIGHT:
            if (idx < strlen(str) && idx < size)
            {
                vdcwin_cursor_toggle(&fullscreen);
                ++idx;
                vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
                vdcwin_cursor_toggle(&fullscreen);
            }
            break;

        default:
            if (isprint(c) && idx < size)
            {
                char flag = (str[idx] == 0);
                str[idx] = c;
                vdcwin_cursor_toggle(&fullscreen);
                vdc_printc(xpos + idx, ypos, pet2screen(c), mc_menupopup);
                ++idx;
                vdcwin_cursor_move(&fullscreen, xpos + idx, ypos);
                vdcwin_cursor_toggle(&fullscreen);
                if (flag)
                {
                    str[idx + 1] = 0;
                }
                break;
            }
            break;
        }
    }
    return 0;
}

// Filepicker functions

void freeDir()
{
    if (!cwd.name[0])
    {
        return;
    }

    current = cwd.firstelement;
    while (current)
    {
        next = current->next;
        free(current);
        current = next;
    }

    cwd.name[0] = 0;
}

void dir_close(char lfn)
// Closse a directory opened for reading
{
    // Reset channels
    krnio_clrchn();

    // Close file
    krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device)
// Open a directory for reading
{
    char status = 0;
    char error = 0;

    // Set name for directory
    krnio_setbnk(0, 0);
    krnio_setnam("$");

    status = krnio_open(lfn, device, 0);
    error = krnio_status();

    if (status && error)
    {
        dir_close(lfn);
    }

    // Open the directory
    if (status && !error)
    {
        // Switch input to file
        status = krnio_chkin(lfn);
        error = krnio_status();

        if (status && !error)
        {
            // Skip BASIC load address
            krnio_chrin();
            krnio_chrin();

            error = krnio_status();

            if (error)
            {
                dir_close(lfn);
            }
        }
        else
        {
            dir_close(lfn);
        }
    }

    // Return error code or 0 on succcess
    return error;
}

char dir_readentry(const char lfn, struct DirEntry *l_dirent)
// Read the next directory entry
{
    char b, len;
    char i = 0;

    // check that device is ready
    b = krnio_chrin();
    if (!b)
    {
        // No entry found
        return 1;
    }
    if (krnio_status())
    {
        return 7;
    }

    // Skip second basic link byte
    krnio_chrin();

    // read file size
    l_dirent->size = krnio_chrin();
    l_dirent->size |= (krnio_chrin()) << 8;

    // read line into linebuffer
    memset(linebuffer, 0, sizeof(linebuffer));
    while (1)
    {
        // read byte
        b = krnio_chrin();
        // EOL?
        if (b == 0)
        {
            break;
        }
        // append to linebuffer
        if (i < sizeof(linebuffer))
        {
            linebuffer[i++] = b;
        }
        // return if reading had error
        if (krnio_status())
        {
            krnio_clrchn();
            return 2;
        }
    }

    // handle "B" BLOCKS FREE
    if (linebuffer[0] == 'b')
    {
        l_dirent->type = CBM_T_FREE;
        return 0;
    }

    // check that we have a minimum amount of characters to work with
    if (i < 5)
    {
        return 3;
    }

    // strip whitespace from right part of line
    for (len = i; len > 0; --len)
    {
        b = linebuffer[len];
        if (b == 0 ||
            b == ' ' ||
            b == 0xA0)
        {
            linebuffer[len] = 0;
            continue;
        }
        ++len;
        break;
    }

    // parse file name

    // skip until first "
    for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
    {
        // do nothing
    }

    // copy filename, until " or max size
    b = 0;
    for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < 16; ++i)
    {
        l_dirent->name[b++] = linebuffer[i];
    }

    // check file type
    if (X('p', 'r', 'g'))
    {
        l_dirent->type = CBM_T_PRG;
    }
    else if (X('s', 'e', 'q'))
    {
        l_dirent->type = CBM_T_SEQ;
    }
    else if (X('u', 's', 'r'))
    {
        l_dirent->type = CBM_T_USR;
    }
    else if (X('d', 'e', 'l'))
    {
        l_dirent->type = CBM_T_DEL;
    }
    else if (X('r', 'e', 'l'))
    {
        l_dirent->type = CBM_T_REL;
    }
    else if (X('c', 'b', 'm'))
    {
        l_dirent->type = CBM_T_CBM;
    }
    else if (X('d', 'i', 'r'))
    {
        l_dirent->type = CBM_T_DIR;
    }
    else if (X('v', 'r', 'p'))
    {
        l_dirent->type = CBM_T_VRP;
    }
    else if (X('l', 'n', 'k'))
    {
        l_dirent->type = CBM_T_LNK;
    }
    else
    {
        // parse header
        l_dirent->type = CBM_T_HEADER;

        // skip one character which should be "
        if (linebuffer[i] == '"')
        {
            ++i;
        }
        // skip one character which should be space
        if (linebuffer[i] == ' ')
        {
            ++i;
        }

        // copy disk ID
        for (b = 0; b < DISK_ID_LEN; ++b)
        {
            if (linebuffer[i])
            {
                disk_id_buf[b] = linebuffer[i];
            }
            i++;
        }
        disk_id_buf[b] = 0;

        // strip disk name
        for (b = 15; b > 0; --b)
        {
            if (l_dirent->name[b] == 0 ||
                l_dirent->name[b] == ' ' ||
                l_dirent->name[b] == 0xA0)
            {
                l_dirent->name[b] = 0;
                continue;
            }
            break;
        }

        return 0;
    }

    // parse read-only
    l_dirent->access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;

    return 0;
}

const char *fileTypeToStr(char ft)
// Convert file type from value to string
{
    if (ft & CBM_T_REG)
    {
        ft &= ~CBM_T_REG;
        if (ft <= 4)
            return reg_types[ft];
    }
    else
    {
        if (ft <= 5)
            return oth_types[ft];
    }
    bad_type[0] = '?';
    bad_type[1] = value2hex[ft >> 4];
    bad_type[2] = value2hex[ft & 15];
    bad_type[3] = 0;
    return bad_type;
}

char dir_validentry(char filter)
// Is current dir entry a valid entry to show given filetype and filter
// Filter value is 0 for all PRG, 1 for project files, 2 for SEQ files
{
    char len = strlen(current->dirent.name);
    char extension[6];

    // If it is not a PRG file and filter is not 2, return with zero value
    if (current->dirent.type != CBM_T_PRG && filter < 2)
    {
        return 0;
    }

    // If it is not a SEQ file and filter is 2, return with zero value
    if (current->dirent.type != CBM_T_SEQ && filter == 2)
    {
        return 0;
    }

    // Filter set at 1 for project files? Then check for extension
    if (filter == 1)
    {
        // Is file name long enough to have an extension?
        if (len > 5)
        {
            memset(extension, 0, 6);
            for (char i = 0; i < 5; i++)
            {
                extension[i] = current->dirent.name[len - 5 + i];
            }
            if (!strcmp(extension, ".proj"))
            {
                return 1;
            }
        }
        return 0;
    }
    return 1;
}

char readDir(char device, char filter)
// Read the directory
{
    char cnt = 0xff;
    char ret, i;

    previous = (struct DirElement *)0;

    vdc_state.text_attr = mc_menupopup;

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);

    if (dir_open(2, device))
    {
        return 0;
    }

    while (1)
    {
        current = calloc(1, sizeof(direlement_size));

        if (!current)
        {
            dir_close(2);
            vdc_reverse(1);
            return 0;
        }

        if (dir_readentry(2, &(current->dirent)))
        {
            free(current);
            break;
        }

        // print progress bar
        if ((cnt >> 2) >= 36)
        {
            cnt = 0;
            vdc_reverse(1);
            vdc_clear(DIRX, DIRY + 3, CH_SPACE, DIRW, 1);
            sprintf(linebuffer, "[%02u]", device);
            vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
        }
        else
        {
            vdcwin_cursor_move(&fullscreen, DIRX + 4 + (cnt >> 2), DIRY + 3);
            vdc_reverse(!progressRev[cnt & 3]);
            vdcwin_put_char(&fullscreen, progressBar[cnt & 3]);
            ++cnt;
        }

        if (!cwd.name[0])
        {
            // initialize directory
            if (current->dirent.type == CBM_T_HEADER)
            {
                for (i = 0; current->dirent.name[i]; ++i)
                {
                    cwd.name[i] = current->dirent.name[i];
                }
                cwd.name[i++] = ',';
                memcpy(&cwd.name[i], disk_id_buf, DISK_ID_LEN);
            }
            else
            {
                strcpy(cwd.name, "Unknown type");
            }
            free(current);
        }
        else
        {
            if (current->dirent.type == CBM_T_FREE)
            {
                // blocks free entry
                cwd.free = current->dirent.size;
                free(current);
            }
            else
            {
                if (dir_validentry(filter))
                {
                    if (cwd.firstelement == 0)
                    {
                        // first element
                        cwd.firstelement = current;
                        previous = current;
                    }
                    else
                    {
                        // all other elements
                        current->prev = previous;
                        previous->next = current;
                        previous = current;
                    }
                }
                else
                {
                    free(current);
                }
            }
        }
    }
    dir_close(2);
    vdc_reverse(1);

    // Are there valid entries read?
    if (cwd.firstelement)
    {
        cwd.selected = cwd.firstelement;
        cwd.firstprinted = cwd.firstelement;
        return 1;
    }
    // No valid entries
    else
    {
        return 0;
    }
}

void drawDirFrame(char device)
{
    vdc_clear(DIRX, DIRY + 3, CH_SPACE, 40, DIRH + 2);
    sprintf(linebuffer, "[%02u] %.20s", device, cwd.name);
    vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
    sprintf(linebuffer, "%u blocks free", cwd.free);
    vdc_prints(DIRX + 1, DIRY + DIRH + 4, linebuffer);
}

void printElementPriv(const char ypos)
{
    vdc_state.text_attr = mc_pd_normal;
    if ((current == cwd.selected))
    {
        vdc_state.text_attr = mc_pd_select;
    }

    vdcwin_cursor_move(&fullscreen, DIRX + 2, ypos);
    strcpy(linebuffer, current->dirent.name);
    sprintf(linebuffer2, (current->dirent.size < 10000) ? "%4u %-16s " : "%u %-15s ", current->dirent.size, linebuffer);
    vdcwin_put_string(&fullscreen, linebuffer2);

    // if blocks are >= 10000 shorten the file type to 2 characters
    strcpy(linebuffer2, fileTypeToStr(current->dirent.type));
    if (current->dirent.size >= 10000 && strlen(current->dirent.name) == 16)
    {
        linebuffer2[0] = linebuffer2[1];
        linebuffer2[1] = linebuffer2[2];
        linebuffer2[2] = 0;
    }
    vdcwin_put_string(&fullscreen, linebuffer2);
    vdc_state.text_attr = mc_menupopup;
}

void printDir(char device)
{
    unsigned idx = 0;

    if (!cwd.firstelement)
    {
        vdcwin_clear(&fullscreen);
        return;
    }

    drawDirFrame(device);

    current = cwd.firstprinted;

    for (idx = 0; (current != 0) && (idx < DIRH); ++idx)
    {
        printElementPriv(idx + DIRY + 4);
        current = current->next;
    }

    // clear empty lines
    for (; idx < DIRH; ++idx)
    {
        vdc_clear(DIRX, idx + DIRY + 4, CH_SPACE, 40, 1);
    }
}

void refreshDir(char device, char filter)
{
    if (readDir(device, filter))
    {
        cwd.selected = cwd.firstelement;
        printDir(device);
    }
    else
    {
        drawDirFrame(device);
        vdc_prints(DIRX + 1, DIRY + 4, "No valid directory entries found.");
    }
}

void updateMenu(void)
{
    char menuy = DIRY + 2;

    vdc_state.text_attr = mc_menupopup;
    vdc_clear(DIRX + DIRW - 15, DIRY + 2, CH_SPACE, 14, 10);

    vdc_prints(DIRX + DIRW - 15, ++menuy, " F1 Dir refr.");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "+/- Device");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "RET Select");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "  T Top");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "  E End");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "P/U Page up/do");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "Cur Navigate");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "ESC Cancel");
}

char filepicker(char filter)
// Function to select a file from the directory list
{
    unsigned pos = 0;
    char lastpage = 0;
    char nextpage = 0;
    unsigned ypos, yoff;
    char count;
    char selected = 0;

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);
    memset(&filename, 0, sizeof(filename));

    vdc_state.text_attr = mc_menupopup;
    vdc_clear(DIRX, DIRY, CH_SPACE, DIRW, DIRH + 6);

    vdc_underline(1);
    vdc_prints(DIRX + 1, DIRY + 1, "Select the file to load");
    vdc_underline(0);

    refreshDir(targetdevice, filter);
    updateMenu();

    do
    {
        current = cwd.selected;
        pos = cwd.pos;
        lastpage = pos / DIRH;
        yoff = pos - (lastpage * DIRH);
        ypos = yoff + 6;

        switch (vdcwin_getch())
        {
        case CH_F1:
            refreshDir(targetdevice, filter);
            break;

        case '2':
        case CH_F2:
        case '+':
            if (++targetdevice > MAXDEVID)
            {
                targetdevice = 8;
            }
            memset(&cwd, 0, sizeof(cwd));
            refreshDir(targetdevice, filter);
            break;

        case '-':
            if (--targetdevice < 8)
            {
                targetdevice = MAXDEVID;
            }
            memset(&cwd, 0, sizeof(cwd));
            refreshDir(targetdevice, filter);
            break;

        case 't':
        case CH_HOME:
            if (cwd.firstelement)
            {
                cwd.selected = cwd.firstelement;
                cwd.firstprinted = cwd.firstelement;
                cwd.pos = 0;
                printDir(targetdevice);
            }
            break;

        case 'e':
            if (cwd.firstelement)
            {
                current = cwd.firstelement;
                pos = 0;
                while (1)
                {
                    if (current->next != 0)
                    {
                        current = current->next;
                        lastpage = pos / DIRH;
                        pos++;
                        nextpage = pos / DIRH;
                        if (lastpage != nextpage)
                        {
                            cwd.firstprinted = current;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                cwd.selected = current;
                cwd.pos = pos;
                printDir(targetdevice);
            }
            break;

        case CH_ESC:
        case CH_STOP:
            selected = 2;
            break;

        case CH_CURS_DOWN:
            if (cwd.firstelement && cwd.selected && current->next)
            {
                current = current->next;
                cwd.selected = current;
                nextpage = (pos + 1) / DIRH;
                cwd.pos++;
                if (lastpage != nextpage)
                {
                    cwd.firstprinted = current;
                    printDir(targetdevice);
                }
                else
                {
                    current = current->prev;
                    printElementPriv(ypos);
                    yoff++;
                    ypos = yoff + 6;
                    current = current->next;
                    printElementPriv(ypos);
                }
            }
            break;

        case CH_CURS_UP:
            if (cwd.firstelement && cwd.selected && current->prev)
            {
                current = current->prev;
                cwd.selected = current;
                nextpage = (pos - 1) / DIRH;
                cwd.pos--;
                if (lastpage != nextpage)
                {
                    for (count = 0; count < DIRH - 1; count++)
                    {
                        if (current->prev != 0)
                        {
                            current = current->prev;
                        }
                    }
                    cwd.firstprinted = current;
                    printDir(targetdevice);
                }
                else
                {
                    current = current->next;
                    printElementPriv(ypos);
                    yoff--;
                    ypos = yoff + 6;
                    current = current->prev;
                    printElementPriv(ypos);
                }
            }
            break;

        // Select file
        case CH_ENTER:
            if (cwd.firstelement && cwd.selected)
            {
                selected = 1;
                strcpy(filename, current->dirent.name);
            }
            break;

        // Page down
        case 'p':
            // Check if not already last item? If no, page down
            if (cwd.firstelement && current->next)
            {
                cwd.selected = (struct DirElement *)0;
                printElementPriv(ypos);
                for (count = 0; count < DIRH; count++)
                {
                    if (current->next)
                    {
                        current = current->next;
                        cwd.pos++;
                        cwd.selected = current;
                        cwd.firstprinted = current;
                    }
                }
                pos = cwd.pos;
                yoff = pos - (lastpage * DIRH);
                ypos = yoff + 6;
                printDir(targetdevice);
            }
            break;

        // Page up
        case 'u':
            // Check if not already first item? If no, page up
            if (cwd.firstelement && current->prev)
            {
                cwd.selected = (struct DirElement *)0;
                printElementPriv(ypos);
                for (count = 0; count < DIRH; count++)
                {
                    if (current->prev)
                    {
                        current = current->prev;
                        cwd.pos--;
                        cwd.selected = current;
                        cwd.firstprinted = current;
                    }
                }
                pos = cwd.pos;
                yoff = pos - (lastpage * DIRH);
                ypos = yoff + 6;
                printDir(targetdevice);
            }
            break;
        }
    } while (!selected);

    if (cwd.name[0])
    {
        freeDir();
    }

    vdc_clear(DIRX, DIRY, CH_SPACE, DIRW, DIRH + 6);
    if (selected == 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void error_message()
// Show message for file error encountered
{
    vdc_exit();
    bnk_exit();
    printf("File error!\n\r");
    printf("Error nr.: %2X\n\r", krnio_pstatus[1]);
    exit(1);
}

void too_big()
// Show error message for when project is too big
{
    vdcwin_printline(&interface, "Project to big.");
    vdcwin_printline(&interface, "Press key to exit.");
    vdcwin_getch();
    vdc_exit();
    bnk_exit();
    exit(1);
}

// Main loop

int main(void)
{
    // Main application initialization, loop and exit
    char key, error;
    char yc = DIRY + 1;
    char valid = 0;
    unsigned length;
    unsigned totalscreensize;
    char *address;
    char projbuffer[23];
    char *ptrend;

    // Reset startvalues global variables
    charsetchanged[0] = 0;
    charsetchanged[1] = 0;
    memset(&filename, 0, sizeof(filename));
    memset(&view, 0, sizeof(view));

    // Load banking overlay
    bnk_init();

    // Obtain device number the application was started from
    targetdevice = bootdevice;

    // Init screen and banking functions, start with default 80x25 text mode
    vdc_init(VDC_TEXT_80x25_PAL, 0);
    vdcwin_init(&fullscreen, 0, 0, 80, 25);
    vdcwin_init(&interface, DIRX + 1, DIRY + 1, DIRW - 2, DIRH + 4);

    // Print title
    vdc_state.text_attr = VDC_LGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE;
    vdc_clear(0, 0, CH_SPACE, 80, 1);
    vdc_prints(0, 0, "VDCSE - PRG Generator.");
    vdc_state.text_attr = VDC_DGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE;
    vdc_clear(0, 1, CH_SPACE, 80, 1);
    sprintf(linebuffer, "Written in 2024 by Xander Mol, version %s", VERSION);
    vdc_prints(0, 1, linebuffer);
    vdc_state.text_attr = mc_default;

    // Pick a project file
    filepicker(1);
    sprintf(linebuffer, "[%2u] %s", targetdevice, filename);
    vdcwin_cursor_move(&interface, 0, 0);
    vdcwin_printline(&interface, "File selected:");
    vdcwin_printline(&interface, linebuffer);

    // Input destination filename
    vdcwin_printline(&interface, "Choose filename of generated program:");
    textInput(interface.sx, interface.sy + interface.cy, filedest, 20);

    // Check if outtput file already exists
    sprintf(linebuffer, "r0:%s=%s", filedest, filedest);
    error = cmd(targetdevice, buffer);

    if (error == 63)
    {
        vdcwin_put_string(&interface, "Output file exists. Are you sure? Y/N ");
        do
        {
            key = vdcwin_getch();
        } while (key != 'y' && key != 'n');
        vdcwin_put_char(&interface, key);
        vdcwin_printline(&interface, "");
        if (key == 'y')
        {
            // Scratch old files
            sprintf(buffer, "s:%s", filedest);
            cmd(targetdevice, buffer);
        }
        else
        {
            error_message();
        }
    }
    else
    {
        if (error && error != 62)
        {
            error_message();
        }
    }

    // Load project variables
    vdcwin_printline(&interface, "Loading project meta data.");
    if (!bnk_load(targetdevice, 0, projbuffer, filename))
    {
        error_message();
    }
    charsetchanged[0] = projbuffer[0];
    charsetchanged[1] = projbuffer[1];
    view.width = projbuffer[4] * 256 + projbuffer[5];
    view.height = projbuffer[6] * 256 + projbuffer[7];
    view.background = projbuffer[10];
    view.mode = projbuffer[22];
    view.screensize = view.width * view.height;
    totalscreensize = (view.screensize * 2) + 48;

    // Strip .proj extension
    filename[strlen(filename) - 5] = 0;

    // Calculate screen address
    address = (char *)MEMSTART;
    if (address + totalscreensize > (char *)MEMMAX)
    {
        too_big();
    }
    view.screen = address;
    address += totalscreensize;

    // Calculate std charset address if needed
    if (charsetchanged[0])
    {
        if (address + 0x0800 > (char *)MEMMAX)
        {
            too_big();
        }
        view.charstd = address;
        address += 0x0800;
    }

    // Calculate alt charset address if needed
    if (charsetchanged[1])
    {
        if (address + 0x0800 > (char *)MEMMAX)
        {
            too_big();
        }
        view.charalt = address;
        address += 0x0800;
    }

    // Load viewer code
    sprintf(linebuffer, "Loading viewer code to address %4x.", BASICSTART);
    vdcwin_printline(&interface, linebuffer);
    if (!bnk_load(bootdevice, 1, (char *)BASICSTART, "vdcse2prgvwc"))
    {
        error_message();
    }

    // Copy viewer data
    sprintf(linebuffer, "Copy viewer data to address %4x.", VIEW);
    vdcwin_printline(&interface, linebuffer);
    bnk_memcpy(BNK_1_FULL, (char *)VIEW, BNK_DEFAULT, (char*)&view, sizeof(view));

    // Load screen data
    sprintf(linebuffer, "Load screen data to address %4x.", view.screen);
    vdcwin_printline(&interface, linebuffer);
    sprintf(linebuffer, "%s.scrn", filename);
    if (!bnk_load(targetdevice, 1, view.screen, linebuffer))
    {
        error_message();
    }

    // Load std charset data
    if (charsetchanged[0])
    {
        sprintf(linebuffer, "Load std charset to address %4x.", view.charstd);
        vdcwin_printline(&interface, linebuffer);
        sprintf(linebuffer, "%s.chrs", filename);
        if (!bnk_load(targetdevice, 1, view.charstd, linebuffer))
        {
            error_message();
        }
    }

    // Load alt charset data
    if (charsetchanged[1])
    {
        sprintf(linebuffer, "Load alt charset to address %4x.", view.charalt);
        vdcwin_printline(&interface, linebuffer);
        sprintf(linebuffer, "%s.chra", filename);
        if (!bnk_load(targetdevice, 1, view.charalt, linebuffer))
        {
            error_message();
        }
    }

    // Saving resulting file
    sprintf(linebuffer, "Saving %u bytes to %s.", address - (char *)MEMSTART, filedest);
    vdcwin_printline(&interface, linebuffer);
    if (!bnk_save(targetdevice, 1, (char *)0x1c01, address, filedest))
    {
        error_message();
    }
    vdcwin_printline(&interface, "Finished! Press key to exit.");

    getch();
    vdc_exit();
    bnk_exit();

    return 0;
}