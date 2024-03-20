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
#include <c64/kernalio.h>
#include <c64/cia.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "vdc_core.h"
#include "peekpoke.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_menu.h"
#include "main.h"
#include "overlay3.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl3, 4)
#pragma section(codeovl3, 0)
#pragma section(dataovl3, 0)
#pragma section(bssovl3, 0)
#pragma region(ovl3, OVERLAYLOAD, 0xC000, , 4, { codeovl3, dataovl3,bssovl3 } )

#pragma code(codeovl3)
#pragma data(dataovl3)
#pragma bss(bssovl3)

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

static const char progressBar[4] = {0xA5, 0xA1, 0xA7, ' '};
static const char progressRev[4] = {0, 0, 1, 1};
char disk_id_buf[5];

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
struct DirElement direlement_size;
struct DirElement *previous;
struct DirElement *current;
struct DirElement *next;

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
struct Directory cwd;

const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];
char linebuffer2[81];

void freeDir()
{
    if (!cwd.name[0])
        return;

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

    // Set name for directory
    krnio_setbnk(0, 0);
    krnio_setnam("$");

    // Open the directory
    if (krnio_open(lfn, device, 0))
    {
        // Switch input to file
        if (krnio_chkin(lfn))
        {
            // Skip BASIC load address
            krnio_chrin();
            krnio_chrin();

            if (krnio_pstatus[lfn])
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
    return krnio_pstatus[lfn];
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
    if (krnio_pstatus[lfn])
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
        if (krnio_pstatus[lfn])
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

char readDir(char device, char filter)
// Read the directory
{
    char cnt = 0xff;
    char ret, i;

    previous = (struct DirElement *)0;

    vdc_state.text_attr = mc_menupopup;

    if (cwd.name[0])
    {
        freeDir();
    }

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);

    if (dir_open(15, device))
    {
        return 0;
    }

    while (1)
    {
        current = calloc(1, sizeof(direlement_size));

        if (!current)
        {
            break;
        }

        if (dir_readentry(15, &(current->dirent)))
        {
            free(current);
            break;
        }

        // print progress bar
        if ((cnt >> 2) >= 36)
        {
            cnt = 0;
            vdc_clear(DIRX, DIRY + 3, CH_SPACE, DIRW, 1);
            sprintf(linebuffer, "[%02u]", device);
            vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, DIRX + 4 + (cnt >> 2), DIRY + 3);
            vdc_reverse(!progressRev[cnt & 3]);
            vdcwin_put_char(&canvas.view, progressBar[cnt & 3]);
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
        }
        else
        {
            if (current->dirent.type == CBM_T_FREE)
            {
                // blocks free entry
                cwd.free = current->dirent.size;
                break;
            }
            else if (cwd.firstelement == 0)
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
    }
    dir_close(15);
    vdc_reverse(1);

    if (cwd.firstelement)
    {
        cwd.selected = cwd.firstelement;
        cwd.firstprinted = cwd.firstelement;
    }
    return 1;
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

void drawDirFrame(char device)
{
    vdc_clear(DIRX, DIRY + 3, CH_SPACE, 40, DIRH + 2);
    sprintf(linebuffer, "[%02u] %.20s", device, cwd.name);
    vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
    sprintf(linebuffer, "%u bl. free", cwd.free);
    vdc_prints(DIRX + 1, DIRY + DIRH + 4, linebuffer);
}

void printElementPriv(const char ypos)
{
    vdc_state.text_attr = mc_pd_normal;
    if ((current == cwd.selected))
    {
        vdc_state.text_attr = mc_pd_select;
    }

    vdcwin_cursor_move(&canvas.view, DIRX + 2, ypos);
    strcpy(linebuffer, current->dirent.name);
    sprintf(linebuffer2, (current->dirent.size < 10000) ? "%4u %-16s " : "%u %-15s ", current->dirent.size, linebuffer);
    vdcwin_put_string(&canvas.view, linebuffer2);

    // if blocks are >= 10000 shorten the file type to 2 characters
    strcpy(linebuffer2, fileTypeToStr(current->dirent.type));
    if (current->dirent.size >= 10000 && strlen(current->dirent.name) == 16)
    {
        linebuffer2[0] = linebuffer2[1];
        linebuffer2[1] = linebuffer2[2];
        linebuffer2[2] = 0;
    }
    vdcwin_put_string(&canvas.view, linebuffer2);
    vdc_state.text_attr = mc_menupopup;
}

void printDir(char device)
{
    unsigned idx = 0;

    if (!cwd.firstelement)
    {
        vdcwin_clear(&canvas.view);
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
    readDir(device, filter);
    cwd.selected = cwd.firstelement;
    printDir(device);
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

char *filepicker(char filter)
// Function to select a file from the directory list
{
    unsigned pos = 0;
    char lastpage = 0;
    char nextpage = 0;
    unsigned ypos, yoff;
    char count;
    char device = bootdevice;

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, DIRX, DIRY, DIRW, DIRH + 6);

    vdc_underline(1);
    vdc_prints(DIRX + 1, DIRY + 1, "Select the file to load");
    vdc_underline(0);

    refreshDir(device, filter);
    updateMenu();
    getch();

    vdcwin_win_free();
}

void loadscreenmap()
{
    filepicker(0);
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)