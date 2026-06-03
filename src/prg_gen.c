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
#include "filebrowse.h"

// Viewer data addess. Align with the address of the view struct in view.c
#define VIEW 0x1c80
#define BASICSTART 0x1c01
#define MEMSTART 0x4600
#define MEMMAX 0xbfff


// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdcse2prg, 0x1c80, 0xc000, , , {code, data, bss, heap, stack} )
#pragma heapsize(4096)

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

    if (res < 2 ||
        !isdigit((unsigned char)DOSstatus[0]) ||
        !isdigit((unsigned char)DOSstatus[1]))
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
    unsigned char idx = strlen(str);
    unsigned char len;
    unsigned char scan;

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
                for (scan = idx; 1; ++scan)
                {
                    char b = str[scan + 1];
                    str[scan] = b;

                    vdc_printc(xpos + scan, ypos, b ? pet2screen(b) : CH_SPACE, mc_menupopup);
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
            len = strlen(str);
            if (len < size && len > 0 && idx < len)
            {
                vdcwin_cursor_toggle(&fullscreen);
                while (1)
                {
                    str[len + 1] = str[len];
                    if (len == idx)
                    {
                        break;
                    }
                    --len;
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
            if (isprint((unsigned char)c) && idx < size)
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
                    str[idx] = 0;
                }
                break;
            }
            break;
        }
    }
    return 0;
}

// Filepicker functions

void prg_exit()
// Routine to exit to BASIC
{
    vdcwin_printline(&interface, "Press key to exit.");
    vdcwin_getch();
    vdc_exit();
    bnk_exit();
    exit(1);
}
void error_message()
// Show message for file error encountered
{
    vdcwin_printline(&interface, "File error!\n\r");
    sprintf(linebuffer, "Error nr.: %2X\n\r", krnio_pstatus[1]);
    vdcwin_printline(&interface, "File error!\n\r");
    prg_exit();
}

void too_big()
// Show error message for when project is too big
{
    vdcwin_printline(&interface, "Project to big.");
    prg_exit();
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
    vdcwin_printline(&interface,"");

    // Check if outtput file already exists
    sprintf(linebuffer, "r0:%s=%s", filedest, filedest);
    error = cmd(targetdevice, linebuffer);

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
            vdcwin_printline(&interface, "Deleting old file.");
            sprintf(buffer, "s:%s", filedest);
            cmd(targetdevice, buffer);
        }
        else
        {
            prg_exit();
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
    charsetchanged[0] = projbuffer[0] ? 1 : 0;
    charsetchanged[1] = projbuffer[1] ? 1 : 0;
    view.width = ((unsigned char)projbuffer[4] << 8) | (unsigned char)projbuffer[5];
    view.height = ((unsigned char)projbuffer[6] << 8) | (unsigned char)projbuffer[7];
    view.background = (unsigned char)projbuffer[10];
    view.mode = (unsigned char)projbuffer[22];
    view.screensize = SCREENMAP_DATA_BYTES(view.width, view.height);
    totalscreensize = SCREENMAP_STORAGE_BYTES(view.width, view.height);

    if (!view.width ||
        !view.height ||
        totalscreensize > ((unsigned long)MEMMAX - (unsigned long)MEMSTART + 1UL) ||
        view.mode > VDC_TEXT_80x60_NTSC)
    {
        error_message();
    }

    // Strip .proj extension
    filename[strlen(filename) - 5] = 0;

    // Calculate screen address
    address = (char *)MEMSTART;
    if ((unsigned long)address + totalscreensize > (unsigned long)MEMMAX + 1UL)
    {
        too_big();
    }
    view.screen = address;
    address += totalscreensize;

    // Calculate std charset address if needed
    if (charsetchanged[0])
    {
        if ((unsigned long)address + 0x0800UL > (unsigned long)MEMMAX + 1UL)
        {
            too_big();
        }
        view.charstd = address;
        address += 0x0800;
    }

    // Calculate alt charset address if needed
    if (charsetchanged[1])
    {
        if ((unsigned long)address + 0x0800UL > (unsigned long)MEMMAX + 1UL)
        {
            too_big();
        }
        view.charalt = address;
        address += 0x0800;
    }

    // Load viewer code
    sprintf(linebuffer, "Loading viewer code to address $%4x.", BASICSTART);
    vdcwin_printline(&interface, linebuffer);
    if (!bnk_load(bootdevice, 1, (char *)BASICSTART, "vdcse2prgvwc"))
    {
        error_message();
    }

    // Copy viewer data
    sprintf(linebuffer, "Copy viewer data to address $%4x.", VIEW);
    vdcwin_printline(&interface, linebuffer);
    bnk_memcpy(BNK_1_FULL, (char *)VIEW, BNK_DEFAULT, (char*)&view, sizeof(view));

    // Load screen data
    sprintf(linebuffer, "Load screen data to address $%4x.", view.screen);
    vdcwin_printline(&interface, linebuffer);
    sprintf(linebuffer, "%s.scrn", filename);
    if (!bnk_load(targetdevice, 1, view.screen, linebuffer))
    {
        error_message();
    }

    // Load std charset data
    if (charsetchanged[0])
    {
        sprintf(linebuffer, "Load std charset to address $%4x.", view.charstd);
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
        sprintf(linebuffer, "Load alt charset to address $%4x.", view.charalt);
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