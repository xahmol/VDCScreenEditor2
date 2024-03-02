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
#include "defines.h"
#include "vdc_core.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_menu.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdcse, 0x1c80, 0xc000 - OVERLAYSIZE, , , {code, data, bss, heap, stack} )

// Undo data
unsigned char vdcmemory;
unsigned char undoenabled = 0;
unsigned int undoaddress;
unsigned char undonumber;
unsigned char undo_undopossible;
unsigned char undo_redopossible;
struct UndoStruct Undo[41];

// Menucolors
unsigned char mc_mb_normal = VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR;
unsigned char mc_mb_select = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
unsigned char mc_pd_normal = VDC_DCYAN + VDC_A_REVERSE + VDC_A_ALTCHAR;
unsigned char mc_pd_select = VDC_LYELLOW + VDC_A_REVERSE + VDC_A_ALTCHAR;
unsigned char mc_menupopup = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;

// Global variables
unsigned char bootdevice;
char DOSstatus[40];
unsigned char charsetchanged[2];
unsigned char appexit;
unsigned char targetdevice;
char filename[21];
char programmode[11];
unsigned char showbar;

unsigned char screen_col;
unsigned char screen_row;
// unsigned int xoffset;
// unsigned int yoffset;
// unsigned int screenwidth;
// unsigned int screenheight;
unsigned int screentotal;
unsigned char screenbackground;
unsigned char plotscreencode;
unsigned char plotcolor;
unsigned char plotreverse;
unsigned char plotunderline;
unsigned char plotblink;
unsigned char plotaltchar;
unsigned int select_startx, select_starty, select_endx, select_endy, select_width, select_height, select_accept;
unsigned char rowsel = 0;
unsigned char colsel = 0;
unsigned char palettechar;
unsigned char visualmap = 0;
unsigned char favourites[10][2];

char buffer[81];
char version[22];

// Generic routines
unsigned char dosCommand(const unsigned char lfn, const unsigned char drive, const unsigned char sec_addr, const char *cmd)
// Send DOS command - extended
{
    // Send DOS command
    // based on version DraCopy 1.0e, then modified.
    // Created 2009 by Sascha Bader.

    int res;
    krnio_setnam(cmd);
    if (krnio_open(lfn, drive, sec_addr) != 0)
    {
        krnio_close(lfn);
        return krnio_pstatus[lfn];
    }

    if (lfn != 15)
    {
        krnio_setnam("");
        if (krnio_open(15, drive, 15) != 0)
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

    if (res < 1)
    {
        return krnio_pstatus[lfn];
    }

    return (DOSstatus[0] - 48) * 10 + DOSstatus[1] - 48;
}

unsigned int cmd(const unsigned char device, const char *cmd)
// Set DOS Command - simplified
{
    // Prepare DOS command
    // based on version DraCopy 1.0e, then modified.
    // Created 2009 by Sascha Bader.

    return dosCommand(15, device, 15, cmd);
}

signed int textInput(unsigned char xpos, unsigned char ypos, char *str, unsigned char width, unsigned char lines)
// Textinput from window. Returns length of input, or -1 on ESC or STOP
{
    struct VDCWin inputwin;
    unsigned char returncode;

    vdcwin_init(&inputwin, xpos, ypos, width, lines);
    returncode = vdcwin_edit(&inputwin);
    if (returncode == CH_ENTER)
    {
        vdcwin_get_rect(&inputwin, 0, 0, width, lines, BNK_DEFAULT, str);
        return strlen(str);
    }
    else
    {
        return -1;
    }
}

/* General screen functions */
void printcentered(char *text, unsigned char xpos, unsigned char ypos, unsigned char width)
{
    /* Function to print a text centered
       Input:
       - Text:  Text to be printed
       - Color: Color for text to be printed
       - Width: Width of window to align to    */

    vdc_clear(xpos, ypos, CH_SPACE, width, 1);

    if (strlen(text) < width)
    {
        xpos += (width - strlen(text)) / 2 - 1;
    }
    vdc_prints(xpos, ypos, text);
}

/* Overlay functions */

void initoverlay()
{
    // Load all overlays into memory if possible

    unsigned char x;
    unsigned int address = OVERLAYBANK0;
    unsigned char destbank = BNK_0_FULL;

    for (x = 0; x < OVERLAYNUMBER; x++)
    {
        // Update load status message
        sprintf(buffer, "Memory overlay %u", x + 1);
        printcentered(buffer, 29, 24, 22);

        // Compose filename
        sprintf(buffer, "vdcseovl%u", x + 1);

        if (destbank)
        {
            // Load overlay file, exit if not found

            // Copy to overlay storage memory location
            overlaydata[x].bank = destbank;
            bnk_memcpy(BNK_0_FULL, OVERLAYLOAD, destbank, address, OVERLAYSIZE);
            overlaydata[x].address = address;
            address += OVERLAYSIZE;

            if (destbank == BNK_0_FULL)
            {
                if (address + OVERLAYSIZE < OVERLAYBANK0 || address + OVERLAYSIZE > 0xEFFF)
                {
                    address = OVERLAYBANK1;
                    destbank = BNK_1_FULL;
                }
            }
            else
            {
                if (address + OVERLAYSIZE < OVERLAYBANK1 || address + OVERLAYSIZE > 0xEFFF)
                {
                    destbank = 0;
                }
            }
        }
    }
}

void loadoverlay(unsigned char overlay_select)
{
    // Load memory overlay with given number

    // Returns if overlay allready active
    if (overlay_select != overlay_active)
    {
        overlay_active = overlay_select;
        if (overlaydata[overlay_select - 1].bank)
        {
            bnk_memcpy(overlaydata[overlay_select - 1].bank, overlaydata[overlay_select - 1].address, BNK_DEFAULT, OVERLAYLOAD, OVERLAYSIZE);
        }
        else
        {
            // Compose filename
            sprintf(buffer, "vdcseovl%u", overlay_select);

            // Load overlay file, exit if not found
            load_overlay(buffer);
        }
    }
}

// Generic screen map routines

void printstatusbar()
{
    unsigned char ypos = vdc_state.height - 1;

    if (screen_row == ypos)
    {
        return;
    }

    vdc_state.text_attr = mc_menupopup;

    sprintf(buffer, "%-10s", programmode);
    vdc_prints(ypos, 6, buffer);
    sprintf(buffer, "%3u,%3u", screen_col + canvas.sourcexoffset, screen_row + canvas.sourceyoffset);
    vdc_prints(ypos, 22, buffer);
    if (plotaltchar)
    {
        vdc_printc(ypos, 36, plotscreencode, mc_menupopup);
    }
    else
    {
        vdc_printc(ypos, 36, plotscreencode, mc_menupopup - VDC_A_ALTCHAR);
    }
    sprintf(buffer, "%2X", plotscreencode);
    vdc_prints(ypos, 38, buffer);
    vdc_printc(ypos, 48, CH_SPACE, plotcolor + VDC_A_REVERSE);
    sprintf(buffer, "%2u", plotcolor);
    vdc_prints(ypos, 50, buffer);
    if (plotreverse)
    {
        vdc_prints(ypos, 54, "REV");
    }
    else
    {
        vdc_prints(ypos, 54, "   ");
    }
    if (plotunderline)
    {
        vdc_prints(ypos, 58, "UND");
    }
    else
    {
        vdc_prints(ypos, 58, "   ");
    }
    if (plotblink)
    {
        vdc_prints(ypos, 62, "BLI");
    }
    else
    {
        vdc_prints(ypos, 62, "   ");
    }
    if (plotaltchar)
    {
        vdc_prints(ypos, 66, "ALT");
    }
    else
    {
        vdc_prints(ypos, 66, "   ");
    }
}

void initstatusbar()
{
    unsigned char ypos = vdc_state.height - 1;

    if (screen_row == ypos)
    {
        return;
    }

    vdc_state.text_attr = mc_menupopup;

    vdc_clear(ypos, 0, CH_SPACE, 80, 1);
    vdc_prints(ypos, 0, "Mode:");
    vdc_prints(ypos, 17, "X,Y:");
    vdc_prints(ypos, 31, "Char:");
    vdc_prints(ypos, 41, "Color:");
    vdc_prints(ypos, 73, "F8=Help");
    printstatusbar();
}

void hidestatusbar()
{
    vdcwin_cpy_viewport(&canvas);
}

void togglestatusbar()
{
    unsigned char ypos = vdc_state.height - 1;

    if (screen_row == ypos)
    {
        return;
    }

    if (showbar)
    {
        showbar = 0;
        hidestatusbar();
    }
    else
    {
        showbar = 1;
        initstatusbar();
    }
}

unsigned int screenmap_screenaddr(unsigned char row, unsigned char col, unsigned int width)
{
    return SCREENMAPBASE + (row * width) + col;
}

unsigned int screenmap_attraddr(unsigned char row, unsigned char col, unsigned int width, unsigned int height)
{
    // Function to calculate screenmap address for the attribute space
    // Input: row, col, width and height for screenmap
    return SCREENMAPBASE + (row * width) + col + (width * height) + 48;
}

void screenmapplot(unsigned char row, unsigned char col, unsigned char screencode, unsigned char attribute)
{
    // Function to plot a screencodes at bank 1 memory screen map
    // Input: row and column, screencode to plot, attribute code

    bnk_writeb(BNK_1_FULL, screenmap_screenaddr(row, col, canvas.sourcewidth), screencode);
    bnk_writeb(BNK_1_FULL, screenmap_attraddr(row, col, canvas.sourcewidth, canvas.sourceheight), attribute);
}

void placesignature()
{
    // Place signature in screenmap with program version

    char versiontext[49] = "";
    unsigned char x;
    unsigned int address = SCREENMAPBASE + (canvas.sourcewidth * canvas.sourceheight);

    sprintf(versiontext, "VDC Screen Editor %s X.Mol ", VERSION);

    for (x = 0; x < strlen(versiontext); x++)
    {
        bnk_writeb(BNK_1_FULL, address + x, versiontext[x]);
    }
}

void screenmapfill(unsigned char screencode, unsigned char attribute)
{
    // Function to fill screen with the screencode and attribute code provided as input

    unsigned int address = SCREENMAPBASE;

    bnk_memset(BNK_1_FULL, address, screencode, screentotal + 48);
    placesignature();
    address += screentotal + 48;
    bnk_memset(BNK_1_FULL, address, attribute, screentotal);
}

void cursormove(unsigned char left, unsigned char right, unsigned char up, unsigned char down)
{
    // Move cursor and scroll screen if needed
    // Input: flags to enable (1) or disable (0) move in the different directions

    if (left == 1)
    {
        if (screen_col == 0)
        {
            if (canvas.sourcexoffset > 0)
            {
                vdcwin_cursor_show(&canvas.view,0);
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_cursor_show(&canvas.view,1);
                vdcwin_viewportscroll(&canvas, SCROLL_LEFT);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_show(&canvas.view,0);
            vdcwin_cursor_move(&canvas.view, --screen_col, screen_row);
            vdcwin_cursor_show(&canvas.view,1);
        }
    }
    if (right == 1)
    {
        if (screen_col == 79)
        {
            if (canvas.sourcexoffset + screen_col < canvas.sourcewidth - 1)
            {
                vdcwin_cursor_show(&canvas.view,0);
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_cursor_show(&canvas.view,1);
                vdcwin_viewportscroll(&canvas, SCROLL_RIGHT);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_show(&canvas.view,0);
            vdcwin_cursor_move(&canvas.view, ++screen_col, screen_row);
            vdcwin_cursor_show(&canvas.view,1);
        }
    }
    if (up == 1)
    {
        if (screen_row == 0)
        {
            if (canvas.sourceyoffset > 0)
            {
                vdcwin_cursor_show(&canvas.view,0);
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_cursor_show(&canvas.view,1);
                vdcwin_viewportscroll(&canvas, SCROLL_UP);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_show(&canvas.view,0);
            vdcwin_cursor_move(&canvas.view, screen_col, --screen_row);
            vdcwin_cursor_show(&canvas.view,1);
            if (showbar && screen_row == vdc_state.height - 2)
            {
                initstatusbar();
            }
        }
    }
    if (down == 1)
    {
        if (screen_row == vdc_state.height - 2)
        {
            hidestatusbar();
        }
        if (screen_row == vdc_state.height - 1)
        {
            if (canvas.sourceyoffset + screen_row < canvas.sourceheight - 1)
            {
                vdcwin_cursor_show(&canvas.view,0);
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_cursor_show(&canvas.view,1);
                vdcwin_viewportscroll(&canvas, SCROLL_DOWN);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_show(&canvas.view,0);
            vdcwin_cursor_move(&canvas.view, screen_col, ++screen_row);
            vdcwin_cursor_show(&canvas.view,1);
        }
    }
}

// Functions for undo system

void undo_new(unsigned char row, unsigned char col, unsigned char width, unsigned char height)
{
    // Function to create a new undo buffer position

    unsigned char y;
    unsigned char redoroompresent = 1;

    if (undo_redopossible > 0)
    {
        undo_undopossible = 1;
        undo_redopossible = 0;
    }
    else
    {
        undo_undopossible++;
    }
    undonumber++;
    if (undonumber > 40)
    {
        undonumber = 1;
    }
    if (undoaddress + (width * height * 4) < undoaddress)
    {
        undonumber = 1;
        undoaddress = vdc_state.extended;
    }
    if (undoaddress + (width * height * 4) > (0xffff - vdc_state.extended))
    {
        redoroompresent = 0;
    }
    for (y = 0; y < height; y++)
    {
        bnk_cpytovdc(undoaddress + (y * width), BNK_1_FULL, screenmap_screenaddr(row + y, col, canvas.sourcewidth), width);
        bnk_cpytovdc(undoaddress + (width * height) + (y * width), BNK_1_FULL, screenmap_attraddr(row + y, col, canvas.sourcewidth, canvas.sourceheight), width);
    }
    Undo[undonumber - 1].address = undoaddress;
    if (undonumber < 40)
    {
        Undo[undonumber].address = 0;
    }
    else
    {
        Undo[0].address = 0;
    }
    Undo[undonumber - 1].xstart = col;
    Undo[undonumber - 1].ystart = row;
    Undo[undonumber - 1].width = width;
    Undo[undonumber - 1].height = height;
    Undo[undonumber - 1].redopresent = redoroompresent;
    undoaddress += width * height * (2 + (2 * redoroompresent));
}

void undo_performundo()
{
    // Function to perform an undo if a filled undo slot is present

    unsigned char y, row, col, width, height;

    if (undo_undopossible > 0)
    {
        row = Undo[undonumber - 1].ystart;
        col = Undo[undonumber - 1].xstart;
        width = Undo[undonumber - 1].width;
        height = Undo[undonumber - 1].height;
        for (y = 0; y < height; y++)
        {
            if (Undo[undonumber - 1].redopresent > 0)
            {
                bnk_cpytovdc(Undo[undonumber - 1].address + (width * height * 2) + (y * width), BNK_1_FULL, screenmap_screenaddr(row + y, col, canvas.sourcewidth), width);
                bnk_cpytovdc(Undo[undonumber - 1].address + (width * height * 3) + (y * width), BNK_1_FULL, screenmap_attraddr(row + y, col, canvas.sourcewidth, canvas.sourceheight), width);
            }
            bnk_cpyfromvdc(BNK_1_FULL, screenmap_screenaddr(row + y, col, canvas.sourcewidth), Undo[undonumber - 1].address + (y * width), width);
            bnk_cpyfromvdc(BNK_1_FULL, screenmap_attraddr(row + y, col, canvas.sourcewidth, canvas.sourceheight), Undo[undonumber - 1].address + (width * height) + (y * width), width);
        }
        vdcwin_cpy_viewport(&canvas);
        if (showbar)
        {
            initstatusbar();
        }
        if (Undo[undonumber - 1].redopresent > 0)
        {
            Undo[undonumber - 1].redopresent = 2;
            undo_redopossible++;
        }
        undoaddress = Undo[undonumber - 1].address;
        undonumber--;
        if (undonumber == 0)
        {
            if (Undo[39].address > 0)
            {
                undonumber = 40;
            }
        }
        undo_undopossible--;
        if (undonumber > 0 && Undo[undonumber - 1].address == 0)
        {
            undo_undopossible = 0;
        }
        if (undonumber == 0 && Undo[39].address == 0)
        {
            undo_undopossible = 0;
        }
    }
}

void undo_escapeundo()
{
    // Function to cancel an undo slot after escape is pressed in selectmode or movemode

    Undo[undonumber].address = 0;
    undonumber--;
    if (undonumber == 0)
    {
        if (Undo[39].address > 0)
        {
            undonumber = 40;
        }
    }
}

void undo_performredo()
{
    // Function to perform an redo if a filled redo slot is present

    unsigned char y, row, col, width, height;

    if (undo_redopossible > 0)
    {
        if (undonumber < 39)
        {
            undonumber++;
        }
        else
        {
            undonumber = 1;
        }
        row = Undo[undonumber - 1].ystart;
        col = Undo[undonumber - 1].xstart;
        width = Undo[undonumber - 1].width;
        height = Undo[undonumber - 1].height;
        for (y = 0; y < height; y++)
        {
            bnk_cpyfromvdc(BNK_1_FULL, screenmap_screenaddr(row + y, col, canvas.sourcewidth), Undo[undonumber - 1].address + (width * height * 2) + (y * width), width);
            bnk_cpyfromvdc(BNK_1_FULL, screenmap_attraddr(row + y, col, canvas.sourcewidth, canvas.sourceheight), Undo[undonumber - 1].address + (width * height * 3) + (y * width), width);
        }
        vdcwin_cpy_viewport(&canvas);
        if (showbar)
        {
            initstatusbar();
        }
        undoaddress = Undo[undonumber - 1].address;
        undo_undopossible++;
        undo_redopossible--;
        if (undonumber < 39 && Undo[undonumber].redopresent == 0)
        {
            undo_redopossible = 0;
        }
        if (undonumber == 39 && Undo[0].redopresent == 0)
        {
            undo_redopossible = 0;
        }
    }
}

// Help screens
void helpscreen_load(unsigned char screennumber)
{
    unsigned char oldmode = vdc_state.mode;

    // Function to show selected help screen
    // Input: screennumber: 1-Main mode, 2-Character editor, 3-SelectMoveLinebox, 4-Write/colorwrite mode

    // Load system charset if needed
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, CHARSETSYSTEM, 256);
    }

    // Set background color to black and switch cursor off
    vdc_bgcolor(VDC_BLACK);

    // Set standard text mode if needed
    if (oldmode)
    {
        vdc_set_mode(0);
    }

    // Load selected help screen
    sprintf(buffer, "vdcse.hsc%u", screennumber);

    if (bnk_load(bootdevice, BNK_1_FULL, WINDOWBASEADDRESS, buffer))
    {
        bnk_cpytovdc(vdc_state.base_text, WINDOWBASEADDRESS, 1, 4048);
    }
    else
    {
        messagepopup("Insert application disk to view help.", 0);
    }

    getch();

    // Restore screen
    if (oldmode)
    {
        vdc_set_mode(oldmode);
    }
    vdc_bgcolor(screenbackground);
    vdcwin_cpy_viewport(&canvas);
    if (showbar)
    {
        initstatusbar();
    }
    if (screennumber != 2)
    {
        vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
        vdc_printc(screen_row, screen_col, plotscreencode, vdc_state.text_attr);
    }
    vdcwin_cursor_show(&canvas.view,1);

    // Restore custom charset if needed
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, CHARSETALTERNATE, 256);
    }
}
