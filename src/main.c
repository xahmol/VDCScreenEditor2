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
#include "vdc_core.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_menu.h"
#include "overlay1.h"
#include "overlay2.h"
#include "overlay3.h"
#include "overlay4.h"
#include "overlay5.h"
#include "overlay6.h"
#include "visualpetscii.h"

// Memory region for code, data etc. from 0x1c80 to 0xbfff
#pragma region( vdcse, 0x1c80, 0xc000 - OVERLAYSIZE, , , {code, data, bss, heap, stack} )

// Overlay data
struct OverlayStruct overlaydata[OVERLAYNUMBER];
char overlay_active;

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
    vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
    vdcwin_cursor_toggle(&canvas.view);

    while (1)
    {
        c = vdcwin_getch();
        switch (c)
        {
        case CH_ESC:
        case CH_STOP:
            vdcwin_cursor_toggle(&canvas.view);
            return -1;

        case CH_ENTER:
            idx = strlen(str);
            str[idx] = 0;
            vdcwin_cursor_toggle(&canvas.view);
            return idx;

        case CH_DEL:
            if (idx)
            {
                vdcwin_cursor_toggle(&canvas.view);
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
                vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
                vdcwin_cursor_toggle(&canvas.view);
            }
            break;

        case CH_INS:
            c = strlen(str);
            if (c < size && c > 0 && idx < c)
            {
                vdcwin_cursor_toggle(&canvas.view);
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
                vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
                vdcwin_cursor_toggle(&canvas.view);
            }
            break;

        case CH_CURS_LEFT:
            if (idx)
            {
                vdcwin_cursor_toggle(&canvas.view);
                --idx;
                vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
                vdcwin_cursor_toggle(&canvas.view);
            }
            break;

        case CH_CURS_RIGHT:
            if (idx < strlen(str) && idx < size)
            {
                vdcwin_cursor_toggle(&canvas.view);
                ++idx;
                vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
                vdcwin_cursor_toggle(&canvas.view);
            }
            break;

        default:
            if (isprint(c) && idx < size)
            {
                char flag = (str[idx] == 0);
                str[idx] = c;
                vdcwin_cursor_toggle(&canvas.view);
                vdc_printc(xpos + idx, ypos, pet2screen(c), mc_menupopup);
                ++idx;
                vdcwin_cursor_move(&canvas.view, xpos + idx, ypos);
                vdcwin_cursor_toggle(&canvas.view);
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

        // Copy to overlay storage memory location
        overlaydata[x].bank = destbank;

        if (destbank)
        {
            // Load overlay file, exit if not found
            load_overlay(buffer);

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
    vdcwin_cursor_toggle(&canvas.view);
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
    vdcwin_win_new(VDC_POPUP_BORDER, DIRX, DIRY, DIRW, DIRH + 6);

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

    vdcwin_win_free();
    if (selected == 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

char choosedeviceid(char ypos)
// Choose device ID dialogue
{
    char key;

    vdc_prints(21, ypos, "Choose drive ID:");
    vdc_prints(21, ypos + 2, "Change with + / - key, RET to select.");
    vdc_state.text_attr = mc_pd_select;

    do
    {
        sprintf(linebuffer, "%2u", targetdevice);
        vdc_prints(21, ypos + 1, linebuffer);

        key = vdcwin_getch();

        switch (key)
        {
        case '+':
            if (++targetdevice > MAXDEVID)
            {
                targetdevice = 8;
            }
            while (!bnk_iec_active(targetdevice))
            {
                if (++targetdevice > MAXDEVID)
                {
                    targetdevice = 8;
                }
            }
            break;

        case '-':
            if (--targetdevice < 8)
            {
                targetdevice = MAXDEVID;
            }
            while (!bnk_iec_active(targetdevice))
            {
                if (--targetdevice < 8)
                {
                    targetdevice = MAXDEVID;
                }
            }
            break;

        default:
            break;
        }

    } while (key != CH_ENTER && key != CH_STOP && key != CH_ESC);

    vdc_state.text_attr = mc_menupopup;
    vdc_prints(21, ypos + 1, linebuffer);
    vdc_clear(20, ypos + 2, CH_SPACE, 40, 1);
    if (key == CH_ESC || key == CH_STOP)
    {
        return 0;
    }
    return 1;
}

signed chooseidandfilename(const char *headertext, char maxlen)
// Function to present dialogue to enter device id and filename
// Input: Headertext to print, maximum length of filename input string
{
    int valid = 0;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, headertext);
    vdc_underline(0);

    if (!choosedeviceid(8))
    {
        return -1;
    }

    vdc_prints(21, 10, "Choose filename:");
    return textInput(21, 11, filename, maxlen);
}

char checkiffileexists(char *filetocheck, unsigned char id)
// Check if file exists and, if yes, ask confirmation of overwrite
{
    unsigned char proceed = 1;
    unsigned char yesno;
    unsigned char error;

    sprintf(buffer, "r0:%s=%s", filetocheck, filetocheck);
    error = cmd(id, buffer);

    if (error == 63)
    {
        yesno = menu_areyousure("File exists.");
        if (yesno == 2)
        {
            proceed = 0;
        }
        else
        {
            proceed = 2;
        }
    }
    else
    {
        if (error && error != 62)
        {
            menu_fileerrormessage();
            proceed = 0;
        }
    }

    return proceed;
}

char import_dialogue(char mode, const char *message)
// Dialogue for import functions. Mode 0 = PRG, mode 2 = SEQ
{
    unsigned newwidth, newheight, y;
    unsigned maxsize = MEMORYLIMIT - SCREENMAPBASE;
    char *ptrend;
    char yc = 8;

    memset(&importvars, 0, sizeof(importvars));
    importvars.xpos = screen_col + canvas.sourcexoffset;
    importvars.ypos = screen_row + canvas.sourceyoffset;
    importvars.offset = 48;

    // Pick file to import
    if (!filepicker(mode))
    {
        return 0;
    }

    // Create popup window
    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 14);

    vdc_underline(1);
    vdc_prints(21, 6, message);
    vdc_underline(0);

    // Ask to inout import parameters
    vdc_prints(21, yc++, "Enter import width:");
    sprintf(buffer, "%u", canvas.sourcewidth);
    textInput(21, yc++, buffer, 3);
    importvars.width = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, yc++, "Enter import height:");
    sprintf(buffer, "%u", canvas.sourceheight);
    textInput(21, yc++, buffer, 3);
    importvars.height = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, yc++, "Enter target X coord:");
    sprintf(buffer, "%u", importvars.xpos);
    textInput(21, yc++, buffer, 3);
    importvars.xpos = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, yc++, "Enter target Y coord:");
    sprintf(buffer, "%u", importvars.ypos);
    textInput(21, yc++, buffer, 3);
    importvars.ypos = (unsigned)strtol(buffer, &ptrend, 10);

    // See if for import canvas dimensions should be enlarged and check if this fits
    newwidth = importvars.xpos + importvars.width;
    newheight = importvars.ypos + importvars.height;

    if ((newwidth * newheight * 2) + 48 > maxsize)
    {
        vdc_prints(21, yc, "New size unsupported. Press key.");
        getch();
        vdcwin_win_free();
        return 0;
    }
    else
    {
        // Enlarge canvas width if needed
        if (newwidth > canvas.sourcewidth)
        {
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth);
                bnk_cpyfromvdc(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, newwidth, canvas.sourceheight), vdc_state.swap_text, canvas.sourcewidth);
                bnk_memset(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, canvas.sourcewidth, newwidth, canvas.sourceheight), VDC_WHITE, newwidth - canvas.sourcewidth);
            }
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth), canvas.sourcewidth);
                bnk_cpyfromvdc(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, 0, newwidth), vdc_state.swap_text, canvas.sourcewidth);
                bnk_memset(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, canvas.sourcewidth, newwidth), CH_SPACE, newwidth - canvas.sourcewidth);
            }
            canvas.sourcewidth = newwidth;
            canvas.sourcexoffset = 0;
            updatecanvas();
        }

        // Enlarge canvas height if needed
        if (newheight > canvas.sourceheight)
        {
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_memcpy(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, newheight), BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth);
            }
            bnk_memset(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight, 0, canvas.sourcewidth, newheight), VDC_WHITE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            bnk_memset(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight, 0, canvas.sourcewidth), CH_SPACE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            canvas.sourceheight = newheight;
            canvas.sourceyoffset = 0;
            updatecanvas();
        }

        // Ask for additional import parameters
        vdc_clear(20, 8, CH_SPACE, 40, 10);
        yc = 8;

        if (!mode)
        {
            vdc_prints(21, yc++, "Includes load addres at first 2 bytes?");
            importvars.loadaddr = menu_pulldown(25, yc, VDC_MENU_YESNO, 0);
            vdc_prints(21, yc++, pulldown_titles[VDC_MENU_YESNO][importvars.loadaddr - 1]);

            vdc_prints(21, yc++, "Import chars, color or both?");
            importvars.content = menu_pulldown(25, 11, 6, 0);
            vdc_prints(21, yc++, pulldown_titles[6][importvars.content - 1]);
        }

        if (mode == 2)
        {
            vdc_prints(21, yc++, "Ignore CLS / Clear?");
            importvars.cls = menu_pulldown(25, yc, VDC_MENU_YESNO, 0);
            vdc_prints(21, yc++, pulldown_titles[VDC_MENU_YESNO][importvars.cls - 1]);
        }

        if (importvars.content != 2 || mode == 2)
        {
            vdc_prints(21, yc++, "Convert VIC colours?");
            importvars.convert = menu_pulldown(25, yc, VDC_MENU_YESNO, 0);
            vdc_prints(21, yc++, pulldown_titles[VDC_MENU_YESNO][importvars.convert - 1]);
        }

        if (importvars.content == 2 || importvars.convert == 1)
        {
            vdc_prints(21, yc++, "Uppercase charset?   ");
            importvars.uppercase = menu_pulldown(25, yc, VDC_MENU_YESNO, 0);
            vdc_prints(21, yc++, pulldown_titles[VDC_MENU_YESNO][importvars.uppercase - 1]);
        }

        if (importvars.content == 1)
        {
            vdc_prints(21, yc++, "Enter offset char to color:");
            sprintf(buffer, "%u", importvars.offset);
            textInput(21, yc, buffer, 6);
            importvars.offset = strtol(buffer, &ptrend, 10);
        }
    }
    return 1;
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
            if (charsetchanged[0])
            {
                bnk_redef_charset(vdc_state.char_std, BNK_1_FULL, (char *)CHARSETNORMAL, 256);
            }
            if (charsetchanged[1])
            {
                bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETALTERNATE, 256);
            }
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
            loadoverlay(3);
            savescreenmap();
            break;

        case 22:
            loadoverlay(3);
            loadscreenmap();
            break;

        case 23:
            loadoverlay(3);
            saveproject();
            break;

        case 24:
            loadoverlay(3);
            loadproject();
            break;

        case 31:
            loadoverlay(3);
            loadcharset(0);
            break;

        case 32:
            loadoverlay(3);
            loadcharset(1);
            break;

        case 33:
            loadoverlay(3);
            savecharset(0);
            break;

        case 34:
            loadoverlay(3);
            savecharset(1);
            break;

        case 35:
            vdc_restore_charsets();
            bnk_memcpy(BNK_1_FULL, (char *)CHARSETNORMAL, BNK_CHARROM, (char *)0xd000, 0x1000);
            charsetchanged[0] = 0;
            charsetchanged[1] = 0;
            break;

        case 41:
            loadoverlay(5);
            import_prg();
            break;

        case 42:
            loadoverlay(6);
            import_seq();
            break;

        case 43:
            loadoverlay(6);
            export_seq();
            break;

        case 51:
            loadoverlay(4);
            versioninfo();
            break;

        case 52:
            appexit = 1;
            menuchoice = 99;
            break;

        case 53:
            undoenabled = (undoenabled == 0) ? 1 : 0;
            sprintf(pulldown_titles[4][2], "Undo: %s", (undoenabled == 1) ? "Enabled  " : "Disabled ");
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
    memset(&filename, 0, sizeof(filename));

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
        strcpy(pulldown_titles[4][2], "Undo: Enabled  "); // Enable undo menuoption
        pulldown_options[4] = 3;                          // Enable undo menupotion
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
    if (!bnk_load(bootdevice, 0, (char *)PETSCIIMAP, "vdcsepetv"))
    {
        menu_fileerrormessage();
        exit(1);
    }

    // Load default charsets to bank 1
    printcentered("Copy charsets", 29, 24, 22);
    bnk_memcpy(BNK_1_FULL, (char *)CHARSETNORMAL, BNK_CHARROM, (char *)0xd000, 0x1000);
    bnk_memcpy(BNK_1_FULL, (char *)CHARSETSYSTEM, BNK_1_FULL, (char *)CHARSETALTERNATE, 0x0800);

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
            vdcwin_cursor_toggle(&canvas.view);
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