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
#include "overlay1.h"
#include "overlay2.h"
#include "overlay3.h"
#include "overlay4.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdcse, 0x1c80, 0xc000 - OVERLAYSIZE, , , {code, data, bss, heap, stack} )

// Undo data
char undoenabled = 0;
unsigned undoaddress;
char undonumber;
char undo_undopossible;
char undo_redopossible;
struct UndoStruct Undo[41];

// Global variables
char bootdevice;
char DOSstatus[40];
char charsetchanged[2];
char appexit;
char targetdevice;
char filename[21];
char programmode[11];
char showbar;

unsigned screen_col;
unsigned screen_row;
struct VDCViewport canvas;
unsigned screentotal;
char screenbackground;
char plotscreencode;
char plotcolor;
char plotreverse;
char plotunderline;
char plotblink;
char plotaltchar;
unsigned select_startx, select_starty, select_endx, select_endy, select_width, select_height, select_accept;
unsigned rowsel = 0;
unsigned colsel = 0;
char palettechar;
char visualmap = 0;
char favourites[10][2];

char buffer[81];
char version[22];

// Generic routines
char dosCommand(const char lfn, const char drive, const char sec_addr, const char *cmd)
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

unsigned cmd(const char device, const char *cmd)
// Set DOS Command - simplified
{
    // Prepare DOS command
    // based on version DraCopy 1.0e, then modified.
    // Created 2009 by Sascha Bader.

    return dosCommand(15, device, 15, cmd);
}

signed int textInput(char xpos, char ypos, char *str, char width, char lines)
// Textinput from window. Returns length of input, or -1 on ESC or STOP
{
    struct VDCWin inputwin;
    char returncode;

    vdcwin_init(&inputwin, xpos, ypos, width+1, lines);
    vdcwin_put_string(&inputwin, str);
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
void printcentered(const char *text, char xpos, char ypos, char width)
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

char VDC_Attribute(char textcolor, char blink, char underline, char reverse, char alternate)
{
    // Function to calculate attribute code from color and other attribute bits
    // Input: Color code 0-15 and flags for blink, underline, reverse and alternate charset

    return textcolor + (blink * 16) + (underline * 32) + (reverse * 64) + (alternate * 128);
}

/* Overlay functions */

void initoverlay()
{
    // Load all overlays into memory if possible

    char x;
    unsigned address = OVERLAYBANK0;
    char destbank = BNK_0_FULL;

    for (x = 0; x < OVERLAYNUMBER; x++)
    {
        // Update load status message
        sprintf(buffer, "Memory overlay %u", x + 1);
        printcentered(buffer, 29, 24, 22);

        // Compose filename
        sprintf(buffer, "vdcseovl%u", x + 1);

        // Load overlay file, exit if not found
        load_overlay(buffer);

        // Copy to overlay storage memory location
        overlaydata[x].bank = destbank;

        if (destbank)
        {
            // Load overlay file, exit if not found

            // Copy to overlay storage memory location
            overlaydata[x].bank = destbank;
            bnk_memcpy(destbank, (char *)address, BNK_0_FULL, (char *)OVERLAYLOAD, OVERLAYSIZE);
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

void loadoverlay(char overlay_select)
{
    // Load memory overlay with given number

    // Returns if overlay allready active
    if (overlay_select != overlay_active)
    {
        overlay_active = overlay_select;
        if (overlaydata[overlay_select - 1].bank)
        {
            bnk_memcpy(BNK_DEFAULT, (char *)OVERLAYLOAD, overlaydata[overlay_select - 1].bank, (char *)overlaydata[overlay_select - 1].address, OVERLAYSIZE);
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
char getmaxy()
// Return the maximum y coordinate: either screen height or, if less, canvas height
{
    if (canvas.sourceheight < vdc_state.height)
    {
        return canvas.sourceheight - 1;
    }
    else
    {
        return vdc_state.height - 1;
    }
}

char getmaxx()
// Return the maximum x coordinate: either screen width or, if less, canvas width
{
    if (canvas.sourcewidth < vdc_state.width)
    {
        return canvas.sourcewidth - 1;
    }
    else
    {
        return vdc_state.width - 1;
    }
}

void printstatusbar()
{
    char ypos = vdc_state.height - 1;

    if (screen_row == ypos)
    {
        return;
    }

    vdc_state.text_attr = mc_menupopup;

    sprintf(buffer, "%-10s", programmode);
    vdc_prints(6, ypos, buffer);
    sprintf(buffer, "%3u,%3u", screen_col + canvas.sourcexoffset, screen_row + canvas.sourceyoffset);
    vdc_prints(22, ypos, buffer);
    if (plotaltchar)
    {
        vdc_printc(36, ypos, plotscreencode, mc_menupopup);
    }
    else
    {
        vdc_printc(36, ypos, plotscreencode, mc_menupopup - VDC_A_ALTCHAR);
    }
    sprintf(buffer, "%2X", plotscreencode);
    vdc_prints(38, ypos, buffer);
    vdc_printc(48, ypos, CH_SPACE, plotcolor + VDC_A_REVERSE);
    sprintf(buffer, "%2u", plotcolor);
    vdc_prints(50, ypos, buffer);
    if (plotreverse)
    {
        vdc_prints(54, ypos, "REV");
    }
    else
    {
        vdc_prints(54, ypos, "   ");
    }
    if (plotunderline)
    {
        vdc_prints(58, ypos, "UND");
    }
    else
    {
        vdc_prints(58, ypos, "   ");
    }
    if (plotblink)
    {
        vdc_prints(62, ypos, "BLI");
    }
    else
    {
        vdc_prints(62, ypos, "   ");
    }
    if (plotaltchar)
    {
        vdc_prints(66, ypos, "ALT");
    }
    else
    {
        vdc_prints(66, ypos, "   ");
    }
}

void initstatusbar()
{
    char ypos = vdc_state.height - 1;

    if (screen_row == ypos)
    {
        return;
    }

    vdc_state.text_attr = mc_menupopup;

    vdc_clear(0, ypos, CH_SPACE, 80, 1);
    vdc_prints(0, ypos, "Mode:");
    vdc_prints(17, ypos, "X,Y:");
    vdc_prints(31, ypos, "Char:");
    vdc_prints(41, ypos, "Color:");
    vdc_prints(73, ypos, "F8=Help");
    printstatusbar();
}

void hidestatusbar()
{
    vdcwin_cpy_viewport(&canvas);
}

void togglestatusbar()
{
    char ypos = vdc_state.height - 1;

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

char *screenmap_screenaddr(unsigned row, unsigned col, unsigned width)
{
    return (char *)(SCREENMAPBASE + (row * width) + col);
}

char *screenmap_attraddr(unsigned row, unsigned col, unsigned width, unsigned height)
{
    // Function to calculate screenmap address for the attribute space
    // Input: row, col, width and height for screenmap
    return (char *)(SCREENMAPBASE + (row * width) + col + (width * height) + 48);
}

void screenmapplot(char row, char col, char screencode, char attribute)
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
    char x;
    char *address = (char *)(SCREENMAPBASE + (canvas.sourcewidth * canvas.sourceheight));

    sprintf(versiontext, "VDC Screen Editor %s X.Mol ", VERSION);

    for (x = 0; x < strlen(versiontext); x++)
    {
        bnk_writeb(BNK_1_FULL, address + x, versiontext[x]);
    }
}

void screenmapfill(char screencode, char attribute)
{
    // Function to fill screen with the screencode and attribute code provided as input

    unsigned address = SCREENMAPBASE;

    bnk_memset(BNK_1_FULL, (char *)address, screencode, screentotal + 48);
    placesignature();
    address += screentotal + 48;
    bnk_memset(BNK_1_FULL, (char *)address, attribute, screentotal);
}

void cursormove(char left, char right, char up, char down)
{
    // Move cursor and scroll screen if needed
    // Input: flags to enable (1) or disable (0) move in the different directions

    if (left == 1)
    {
        if (screen_col == 0)
        {
            if (canvas.sourcexoffset > 0)
            {
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_viewportscroll(&canvas, SCROLL_LEFT);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, --screen_col, screen_row);
        }
    }
    if (right == 1)
    {
        if (screen_col == getmaxx())
        {
            if (canvas.sourcexoffset + screen_col < canvas.sourcewidth - 1)
            {
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_viewportscroll(&canvas, SCROLL_RIGHT);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, ++screen_col, screen_row);
        }
    }
    if (up == 1)
    {
        if (screen_row == 0)
        {
            if (canvas.sourceyoffset > 0)
            {
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_viewportscroll(&canvas, SCROLL_UP);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, screen_col, --screen_row);
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
        if (screen_row == getmaxy())
        {
            if (canvas.sourceyoffset + screen_row < canvas.sourceheight - 1)
            {
                vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
                vdcwin_viewportscroll(&canvas, SCROLL_DOWN);
                initstatusbar();
            }
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, screen_col, ++screen_row);
        }
    }
}

void plotcursor()
// Plot cursor at present position
{
    vdc_printc(screen_col, screen_row, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
    vdcwin_cursor_show(&canvas.view);
}

void hidecursor()
// Hide the cursor
{
    vdc_printc(screen_col, screen_row, bnk_readb(BNK_1_FULL, screenmap_screenaddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth, canvas.sourceheight)));
}

void resetcursor()
// Reset cursor after window
{
    vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
    plotcursor();
}

// Functions for undo system

void undo_new(char row, char col, char width, char height)
{
    // Function to create a new undo buffer position

    char y;
    char redoroompresent = 1;

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

    char y, row, col, width, height;

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
    plotcursor();
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
    plotcursor();
}

void undo_performredo()
{
    // Function to perform an redo if a filled redo slot is present

    char y, row, col, width, height;

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
    plotcursor();
}

// Help screens
void helpscreen_load(char screennumber)
{
    char oldmode = vdc_state.mode;

    // Function to show selected help screen
    // Input: screennumber: 1-Main mode, 2-Character editor, 3-SelectMoveLinebox, 4-Write/colorwrite mode

    hidecursor();

    // Load system charset if needed
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETSYSTEM, 256);
    }

    // Set background color to black and switch cursor off
    vdc_bgcolor(VDC_BLACK);

    // Set standard text mode if needed
    if (oldmode)
    {
        vdc_set_mode(0);
    }

    // Load selected help screen
    sprintf(buffer, "vdcsehsc%u", screennumber);

    if (bnk_load(bootdevice, 1, (char *)WINDOWBASEADDRESS, buffer))
    {
        bnk_cpytovdc(vdc_state.base_text, BNK_1_FULL, (char *)WINDOWBASEADDRESS, 4048);
    }
    else
    {
        menu_messagepopup("Insert application disk to view help.");
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
        resetcursor();
    }

    // Restore custom charset if needed
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETALTERNATE, 256);
    }
}

// Application routines

void loadsyscharset()
// Load system charset if needed
{
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETSYSTEM, 256);
    }
}

void restorealtcharset()
// Restore custom charset if needed
{
    if (charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETALTERNATE, 256);
    }
}

void plotmove(char direction)
// Drive cursor move
// Input: ASCII code of cursor key pressed
{
    vdc_printc(screen_col, screen_row, bnk_readb(BNK_1_FULL, screenmap_screenaddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth, canvas.sourceheight)));

    switch (direction)
    {
    case CH_CURS_LEFT:
        cursormove(1, 0, 0, 0);
        break;

    case CH_CURS_RIGHT:
        cursormove(0, 1, 0, 0);
        break;

    case CH_CURS_UP:
        cursormove(0, 0, 1, 0);
        break;

    case CH_CURS_DOWN:
        cursormove(0, 0, 0, 1);
        break;

    default:
        break;
    }

    plotcursor();
}

void change_plotcolor(char newval)
// Change the current color to plot in
{
    plotcolor = newval;
    vdc_textcolor(newval);
    plotcursor();
}

void showchareditfield(char stdoralt)
// Function to draw char editor background field
// Input: Flag for which charset is edited, standard (0) or alternate (1)
{
    vdc_state.text_attr = mc_menupopup - (VDC_A_ALTCHAR * stdoralt);
    vdcwin_win_new(0, 67, 0, 13, 12);
}

unsigned charaddress(char screencode, char stdoralt, char vdcormem)
// Function to calculate address of character to edit
// Input:   screencode to edit, flag for standard (0) or alternate (1) charset,
//          flag for VDC (0) or bank 1 (1) memory address
{
    unsigned address;

    if (vdcormem == 0)
    {
        address = (stdoralt == 0) ? vdc_state.char_std : vdc_state.char_alt;
        address += screencode * 16;
    }
    else
    {
        address = (stdoralt == 0) ? CHARSETNORMAL : CHARSETALTERNATE;
        address += screencode * 8;
    }
    return address;
}

void showchareditgrid(unsigned screencode, char stdoralt)
// Function to draw grid with present char to edit
{
    char x, y, char_byte, colorbase, colorbit;
    unsigned address;

    address = charaddress(screencode, stdoralt, 0);

    colorbase = mc_menupopup - (VDC_A_ALTCHAR * stdoralt);
    vdc_state.text_attr = colorbase;

    sprintf(buffer, "Char %2X %s", screencode, (stdoralt == 0) ? "Std" : "Alt");

    vdc_prints(68, 1, buffer);

    for (y = 0; y < 8; y++)
    {
        char_byte = vdc_mem_read_at(address + y);
        sprintf(buffer, "%2X", char_byte);
        vdc_prints(68, y + 3, buffer);
        for (x = 0; x < 8; x++)
        {
            if (char_byte & (1 << (7 - x)))
            {
                colorbit = colorbase;
            }
            else
            {
                colorbit = colorbase - VDC_A_REVERSE;
            }
            vdc_printc(x + 71, y + 3, CH_SPACE, colorbit);
        }
    }
}

void updatecanvas()
// Update the menu with the proper screen setting values
{
    sprintf(pulldown_titles[0][0], "Width:   %5u ", canvas.sourcewidth);
    sprintf(pulldown_titles[0][1], "Height:  %5u ", canvas.sourceheight);
    sprintf(pulldown_titles[0][2], "Background: %2u ", screenbackground);
    sprintf(pulldown_titles[0][3], "Screenmode: %2u ", vdc_state.mode);
    vdcwin_viewport_init(&canvas, BNK_1_FULL, (char *)SCREENMAPBASE, canvas.sourcewidth, canvas.sourceheight, getmaxx() + 1, getmaxy() + 1, 0, 0);
    screentotal = canvas.sourcewidth * canvas.sourceheight;
}

void mainmenuloop()
{
    // Function for main menu selection loop

    char menuchoice;

    hidecursor();
    vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
    loadsyscharset();

    do
    {
        menuchoice = menu_main();

        switch (menuchoice)
        {
        case 11:
            loadoverlay(1);
            resizewidth();
            break;

        case 12:
            loadoverlay(1);
            resizeheight();
            break;

        case 13:
            loadoverlay(2);
            changebackgroundcolor();
            break;

        case 14:
            loadoverlay(2);
            selectscreenmode();
            break;

        case 15:
            if (undoenabled == 1)
            {
                undo_new(0, 0, canvas.sourcewidth, canvas.sourceheight);
            }
            screenmapfill(CH_SPACE, VDC_WHITE);
            vdcwin_win_free();
            vdcwin_cpy_viewport(&canvas);
            vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
            menu_placebar(0);
            if (showbar)
            {
                initstatusbar();
            }
            break;

        case 16:
            if (undoenabled == 1)
            {
                undo_new(0, 0, canvas.sourcewidth, canvas.sourceheight);
            }
            screenmapfill(plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
            vdcwin_win_free();
            vdcwin_cpy_viewport(&canvas);
            vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
            menu_placebar(0);
            if (showbar)
            {
                initstatusbar();
            }
            break;

        case 21:
            // loadoverlay(3);
            // savescreenmap();
            break;

        case 22:
            loadoverlay(3);
            loadscreenmap();
            break;

        case 23:
            // loadoverlay(3);
            // saveproject();
            break;

        case 24:
            // loadoverlay(3);
            // loadproject();
            break;

        case 25:
            break;

        case 31:
            // loadoverlay(3);
            // loadcharset(0);
            break;

        case 32:
            // loadoverlay(3);
            // loadcharset(1);
            break;

        case 33:
            // loadoverlay(3);
            // savecharset(0);
            break;

        case 34:
            // loadoverlay(3);
            // savecharset(1);
            break;

        case 41:
            loadoverlay(4);
            versioninfo();
            break;

        case 42:
            appexit = 1;
            menuchoice = 99;
            break;

        case 43:
            undoenabled = (undoenabled == 0) ? 1 : 0;
            sprintf(pulldown_titles[3][2], "Undo: %s", (undoenabled == 1) ? "Enabled  " : "Disabled ");
            undoaddress = vdc_state.extended; // Reset undo address
            undonumber = 0;                   // Reset undo number
            undo_undopossible = 0;            // Reset undo possible flag
            undo_redopossible = 0;
            break;

        default:
            break;
        }
    } while (menuchoice < 99);

    vdcwin_win_free();
    restorealtcharset();
    resetcursor();
}

// Main loop

int main(void)
{
    // Main application initialization, loop and exit

    char key, newval;

    // Initialize memory settings for backing up windows backgrounds
    vdcwin_winstorage_init(BNK_1_FULL, (char *)WINDOWBASEADDRESS, WIN_MEMORY);

    // Init low memory
    bnk_init();

    // Reset startvalues global variables
    charsetchanged[0] = 0;
    charsetchanged[1] = 0;
    appexit = 0;
    screen_col = 0;
    screen_row = 0;
    screenbackground = 0;
    plotscreencode = 0;
    plotcolor = VDC_WHITE;
    plotreverse = 0;
    plotunderline = 0;
    plotblink = 0;
    plotaltchar = 0;

    // Obtain device number the application was started from
    bootdevice = getcurrentdevice();
    targetdevice = bootdevice;

    // Init screen and banking functions, start with default 80x25 text mode
    vdc_init(VDC_TEXT_80x25_PAL, 1);
    vdcwin_viewport_init(&canvas, BNK_1_FULL, (char *)SCREENMAPBASE, 80, 25, 80, 25, 0, 0);
    updatecanvas();

    // Detect VDC memory size and set VDC memory config size to 64K if present
    if (vdc_state.memsize == 64)
    {
        strcpy(pulldown_titles[3][2], "Undo: Enabled  "); // Enable undo menuoption
        pulldown_options[3] = 3;                          // Enable undo menupotion
        undoenabled = 1;                                  // Set undo enabled flag
        undoaddress = vdc_state.extended;                 // Reset undo address
        undonumber = 0;                                   // Reset undo number
        undo_undopossible = 0;                            // Reset undo possible flag
        undo_redopossible = 0;                            // Reset redo possible flag
    }

    // Load and show title screen
    printcentered("Load title screen", 29, 24, 22);
    if (bnk_load(bootdevice, 1, (char *)SCREENMAPBASE, "vdcsetscr"))
    {
        bnk_cpytovdc(vdc_state.base_text, BNK_1_FULL, (char *)SCREENMAPBASE, 4048);
    }
    else
    {
        menu_fileerrormessage();
        exit(1);
    }

    // Init overlays
    initoverlay();

    // Load visual PETSCII map mapping data
    printcentered("Load visual PETSCII", 29, 24, 22);
    if (!bnk_load(bootdevice, BNK_DEFAULT, (char *)PETSCIIMAP, "vdcsepetv"))
    {
        menu_fileerrormessage();
        exit(1);
    }

    // Load default charsets to bank 1
    printcentered("Load charsets", 29, 24, 22);
    if (!bnk_load(bootdevice, 1, (char *)CHARSETSYSTEM, "vdcsefalt"))
    {
        menu_fileerrormessage();
        exit(1);
    }
    if (!bnk_load(bootdevice, 1, (char *)CHARSETNORMAL, "vdcsefstd"))
    {
        menu_fileerrormessage();
        exit(1);
    }
    bnk_memcpy(BNK_1_FULL, (char *)CHARSETALTERNATE, BNK_1_FULL, (char *)CHARSETSYSTEM, 2048);

    // Clear screen map in bank 1 with spaces in text color white
    screenmapfill(CH_SPACE, VDC_WHITE);

    // Wait for key press to start application
    printcentered("Press key to start.", 29, 24, 22);
    getch();

    // Clear viewport of titlescreen
    vdc_cls();

    // Main program loop
    plotcursor();
    strcpy(programmode, "Main");
    showbar = 1;
    initstatusbar();

    do
    {
        if (showbar)
        {
            printstatusbar();
        }
        key = vdcwin_getch();

        switch (key)
        {
        // Cursor move
        case CH_CURS_LEFT:
        case CH_CURS_RIGHT:
        case CH_CURS_UP:
        case CH_CURS_DOWN:
            plotmove(key);
            break;

        // Increase screencode
        case '+':
            plotscreencode++;
            plotcursor();
            break;

        // Decrease screencode
        case '-':
            plotscreencode--;
            plotcursor();
            break;

        // Decrease color
        case ',':
            if (plotcolor == 0)
            {
                newval = 15;
            }
            else
            {
                newval = plotcolor - 1;
            }
            if (newval == screenbackground)
            {
                if (newval == 0)
                {
                    newval = 15;
                }
                else
                {
                    newval--;
                }
            }
            change_plotcolor(newval);
            break;

        // Increase color
        case '.':
            if (plotcolor == 15)
            {
                newval = 0;
            }
            else
            {
                newval = plotcolor + 1;
            }
            if (newval == screenbackground)
            {
                if (newval == 15)
                {
                    newval = 0;
                }
                else
                {
                    newval++;
                }
            }
            change_plotcolor(newval);
            break;

        // Toggle underline
        case 'u':
            plotunderline = (plotunderline == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle blink
        case 'b':
            plotblink = (plotblink == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle reverse
        case 'r':
            plotreverse = (plotreverse == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle alternate character set
        case 'a':
            plotaltchar = (plotaltchar == 0) ? 1 : 0;
            plotcursor();
            break;

        // Character eddit mode
        case 'e':
            loadoverlay(4);
            chareditor();
            break;

        // Palette for character selection
        case 'p':
            loadoverlay(1);
            palette();
            break;

        // Grab underlying character and attributes
        case 'g':
            plotscreencode = bnk_readb(BNK_1_FULL, screenmap_screenaddr(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, canvas.sourcewidth));
            newval = bnk_readb(BNK_1_FULL, screenmap_attraddr(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, canvas.sourcewidth, canvas.sourceheight));
            if (newval > 128)
            {
                plotaltchar = 1;
                newval -= 128;
            }
            else
            {
                plotaltchar = 0;
            }
            if (newval > 64)
            {
                plotreverse = 1;
                newval -= 64;
            }
            else
            {
                plotreverse = 0;
            }
            if (newval > 32)
            {
                plotunderline = 1;
                newval -= 32;
            }
            else
            {
                plotunderline = 0;
            }
            if (newval > 16)
            {
                plotblink = 1;
                newval -= 16;
            }
            else
            {
                plotblink = 0;
            }
            plotcolor = newval;
            vdc_state.text_attr = plotcolor;
            plotcursor();
            break;

        // Write mode: type in screencodes
        case 'w':
            loadoverlay(1);
            writemode();
            break;

        // Color mode: type colors
        case 'c':
            loadoverlay(1);
            colorwrite();
            break;

        // Line and box mode
        case 'l':
            loadoverlay(2);
            lineandbox(1);
            break;

        // Move mode
        case 'm':
            loadoverlay(2);
            movemode();
            break;

        // Select mode
        case 's':
            loadoverlay(2);
            selectmode();
            break;

        // Undo
        case 'z':
            if (undoenabled == 1 && undo_undopossible > 0)
            {
                undo_performundo();
            }
            break;

        // Redo
        case 'y':
            if (undoenabled == 1 && undo_redopossible > 0)
            {
                undo_performredo();
            }
            break;

        // Try
        case 't':
            loadoverlay(2);
            plot_try();
            break;

        // Increase/decrease plot screencode by 128 (toggle 'RVS ON' and 'RVS OFF')
        case 'i':
            plotscreencode += 128; // Will increase 128 if <128 and decrease by 128 if >128 by overflow
            plotcursor();
            break;

        // Plot present screencode and attribute
        case CH_SPACE:
            if (undoenabled == 1)
            {
                undo_new(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, 1, 1);
            }
            screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
            break;

        // Delete present screencode and attributes
        case CH_DEL:
            if (undoenabled == 1)
            {
                undo_new(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, 1, 1);
            }
            screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, CH_SPACE, VDC_WHITE);
            break;

        // Go to upper left corner
        case CH_HOME:
            screen_row = 0;
            screen_col = 0;
            canvas.sourceyoffset = 0;
            canvas.sourcexoffset = 0;
            vdcwin_cpy_viewport(&canvas);
            if (showbar)
            {
                initstatusbar();
            }
            vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
            plotcursor();
            break;

        // Go to menu
        case CH_F1:
            vdcwin_cursor_show(&canvas.view);
            mainmenuloop();
            plotcursor();
            vdc_state.text_attr = plotcolor;
            break;

        // Toggle statusbar
        case CH_F6:
            togglestatusbar();
            plotcursor();
            break;

        // Help screen
        case CH_F8:
            helpscreen_load(1);
            break;

        default:
            // 0-9: Favourites select
            if (key > 47 && key < 58)
            {
                plotscreencode = favourites[key - 48][0];
                plotaltchar = favourites[key - 48][1];
                plotcursor();
            }
            // Shift 1-9 or *: Store present character in favourites slot
            if (key > 32 && key < 43)
            {
                favourites[key - 33][0] = plotscreencode;
                favourites[key - 33][1] = plotaltchar;
            }
            break;
        }
    } while (appexit == 0);

    vdc_exit();

    return 0;
}