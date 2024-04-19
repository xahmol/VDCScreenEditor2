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
#include "overlay1.h"
#include "visualpetscii.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl1, 2)
#pragma section(codeovl1, 0)
#pragma section(dataovl1, 0)
#pragma section(bssovl1, 0)
#pragma region(ovl1, OVERLAYLOAD, 0xC000, , 2, { codeovl1, dataovl1, bssovl1  } )

#pragma code(codeovl1)
#pragma data(dataovl1)
#pragma bss(bssovl1)

void writemode()
{
    // Write mode with screencodes

    char key, screencode;
    char rvs = 0;

    strcpy(programmode, "Write");

    do
    {
        if (showbar)
        {
            printstatusbar();
        }
        key = getch();

        switch (key)
        {
        // Cursor move
        case CH_CURS_LEFT:
        case CH_CURS_RIGHT:
        case CH_CURS_UP:
        case CH_CURS_DOWN:
            plotmove(key);
            break;

        // Toggle blink
        case CH_F1:
            plotblink = (plotblink == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle underline
        case CH_F3:
            plotunderline = (plotunderline == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle reverse
        case CH_F5:
            plotreverse = (plotreverse == 0) ? 1 : 0;
            plotcursor();
            break;

        // Toggle alternate character set
        case CH_F7:
            plotaltchar = (plotaltchar == 0) ? 1 : 0;
            plotcursor();
            break;

        // Delete present screencode and attributes
        case CH_DEL:
            if (undoenabled == 1)
            {
                undo_new(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, 1, 1);
            }
            screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, CH_SPACE, VDC_WHITE);
            plotcursor();
            break;

        // Perform undo
        case CH_F2:
            if (undoenabled == 1 && undo_undopossible > 0)
            {
                undo_performundo();
            }
            break;

        // Perform redo
        case CH_F4:
            if (undoenabled == 1 && undo_redopossible > 0)
            {
                undo_performredo();
            }
            break;

        // Toggle statusbar
        case CH_F6:
            togglestatusbar();
            break;

        case CH_F8:
            helpscreen_load(4);
            break;

        // Toggle RVS with the RVS ON and RVS OFF keys (control 9 and control 0)
        case CH_RVSON:
            rvs = 1;
            break;

        case CH_RVSOFF:
            rvs = 0;
            break;

        // Color control with Control and Commodore keys plus 0-9 key
        case CH_BLACK:
            change_plotcolor(VDC_BLACK);
            break;

        case CH_WHITE:
            change_plotcolor(VDC_WHITE);
            break;

        case CH_DRED:
            change_plotcolor(VDC_DRED);
            break;

        case CH_LCYAN:
            change_plotcolor(VDC_LCYAN);
            break;

        case CH_LPURPLE:
            change_plotcolor(VDC_LPURPLE);
            break;

        case CH_DGREEN:
            change_plotcolor(VDC_DGREEN);
            break;

        case CH_DBLUE:
            change_plotcolor(VDC_DBLUE);
            break;

        case CH_LYELLOW:
            change_plotcolor(VDC_LYELLOW);
            break;

        case CH_DPURPLE:
            change_plotcolor(VDC_DPURPLE);
            break;

        case CH_DYELLOW:
            change_plotcolor(VDC_DYELLOW);
            break;

        case CH_LRED:
            change_plotcolor(VDC_LRED);
            break;

        case CH_DCYAN:
            change_plotcolor(VDC_DCYAN);
            break;

        case CH_DGREY:
            change_plotcolor(VDC_DGREY);
            break;

        case CH_LGREEN:
            change_plotcolor(VDC_LGREEN);
            break;

        case CH_LBLUE:
            change_plotcolor(VDC_LBLUE);
            break;

        case CH_LGREY:
            change_plotcolor(VDC_LGREY);
            break;

        // Write printable character
        default:
            if ((key > 31 && key < 128) || (key > 159))
            {
                if (undoenabled == 1)
                {
                    undo_new(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, 1, 1);
                }
                if (rvs == 0)
                {
                    screencode = pet2screen(key);
                }
                else
                {
                    screencode = pet2screen(key);
                }
                screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, screencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
                plotmove(CH_CURS_RIGHT);
                plotcursor();
            }
            break;
        }
    } while (key != CH_ESC && key != CH_STOP);
    strcpy(programmode, "Main");
}

void colorwrite()
{
    // Write mode with colors

    char key, attribute, written;

    strcpy(programmode, "Colorwrite");
    do
    {
        if (showbar)
        {
            printstatusbar();
        }
        key = vdcwin_getch();
        written = 0;

        // Get old attribute value
        attribute = bnk_readb(BNK_1_FULL, screenmap_attraddr(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcewidth, canvas.sourcewidth, canvas.sourceheight));

        switch (key)
        {

        // Cursor move
        case CH_CURS_LEFT:
        case CH_CURS_RIGHT:
        case CH_CURS_UP:
        case CH_CURS_DOWN:
            plotmove(key);
            break;

        // Toggle blink
        case CH_F1:
            attribute ^= 0x10; // Toggle bit 4 for blink
            written = 1;
            break;

        // Perform undo
        case CH_F2:
            if (undoenabled == 1 && undo_undopossible > 0)
            {
                undo_performundo();
            }
            break;

        // Perform redo
        case CH_F4:
            if (undoenabled == 1 && undo_redopossible > 0)
            {
                undo_performredo();
            }
            break;

        // Toggle underline
        case CH_F3:
            attribute ^= 0x20; // Toggle bit 5 for underline
            written = 1;
            break;

        // Toggle reverse
        case CH_F5:
            attribute ^= 0x40; // Toggle bit 6 for reverse
            written = 1;
            break;

        // Toggle alternate charset
        case CH_F7:
            attribute ^= 0x80; // Toggle bit 7 for alternate charset
            written = 1;
            break;

        // Toggle statusbar
        case CH_F6:
            togglestatusbar();
            break;

        case CH_F8:
            helpscreen_load(4);
            break;

        default:
            // If keypress is 0-9 or A-F select color
            if (key > 47 && key < 58)
            {
                attribute &= 0xf0;       // Erase bits 0-3
                attribute += (key - 48); // Add color 0-9 with key 0-9
                written = 1;
            }
            if (key > 64 && key < 71)
            {
                attribute &= 0xf0;       // Erase bits 0-3
                attribute += (key - 55); // Add color 10-15 with key A-F
                written = 1;
            }
            break;
        }
        if (written)
        {
            if (undoenabled == 1)
            {
                undo_new(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, 1, 1);
            }
            bnk_writeb(BNK_1_FULL, screenmap_attraddr(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, canvas.sourcewidth, canvas.sourceheight), attribute);
            plotmove(CH_CURS_RIGHT);
        }
    } while (key != CH_ESC && key != CH_STOP);
    strcpy(programmode, "Main");
}

void palette_draw()
{
    // Draw window for character palette

    char attribute = mc_menupopup - VDC_A_ALTCHAR;
    char x, y;
    char counter = 0;
    char petsciimap = 0;
    ;

    vdc_state.text_attr = attribute;
    vdcwin_win_new(VDC_POPUP_BORDER, 44, 1, 34, 21);

    // Set coordinate of present char if no visual map
    if (visualmap == 0)
    {
        rowsel = (palettechar / 32) + (plotaltchar * 9) + 2;
        colsel = palettechar % 32;
    }

    // Favourites palette
    for (x = 0; x < 10; x++)
    {
        vdc_printc(45 + x, 2, favourites[x][0], attribute + favourites[x][1] * VDC_A_ALTCHAR);
    }

    // Full charsets
    for (y = 0; y < 8; y++)
    {
        for (x = 0; x < 32; x++)
        {
            if (visualmap)
            {
                vdc_printc(45 + x, 4 + y, visualpetscii[petsciimap], attribute);
                vdc_printc(45 + x, 13 + y, visualpetscii[petsciimap], attribute + VDC_A_ALTCHAR);
                if (visualpetscii[petsciimap++] == palettechar)
                {
                    rowsel = y + 2 + (9 * plotaltchar);
                    colsel = x;
                }
            }
            else
            {
                vdc_printc(45 + x, 4 + y, counter, attribute);
                vdc_printc(45 + x, 13 + y, counter, attribute + VDC_A_ALTCHAR);
            }
            counter++;
        }
    }
}

void palette_returnscreencode()
{
    // Get screencode from palette position

    if (rowsel == 0)
    {
        palettechar = favourites[colsel][0];
        plotaltchar = favourites[colsel][1];
    }
    if (rowsel > 1 && rowsel < 10)
    {
        if (visualmap)
        {
            palettechar = visualpetscii[colsel + (rowsel - 2) * 32];
        }
        else
        {
            palettechar = colsel + (rowsel - 2) * 32;
        }

        plotaltchar = 0;
    }
    if (rowsel > 10)
    {
        if (visualmap)
        {
            palettechar = visualpetscii[colsel + (rowsel - 11) * 32];
        }
        else
        {
            palettechar = colsel + (rowsel - 11) * 32;
        }

        plotaltchar = 1;
    }
}

void palette()
{
    // Show character set palette

    char attribute = mc_menupopup - VDC_A_ALTCHAR;
    char key;

    palettechar = plotscreencode;

    strcpy(programmode, "Palette");

    hidecursor();
    palette_draw();
    vdcwin_cursor_move(&canvas.view, 45 + colsel, 2 + rowsel);
    vdcwin_cursor_toggle(&canvas.view);

    // Get key loop
    do
    {
        if (showbar)
        {
            printstatusbar();
        }
        key = vdcwin_getch();

        switch (key)
        {
        // Cursor movemeny
        case CH_CURS_RIGHT:
        case CH_CURS_LEFT:
        case CH_CURS_DOWN:
        case CH_CURS_UP:
            if (key == CH_CURS_RIGHT)
            {
                colsel++;
            }
            if (key == CH_CURS_LEFT)
            {
                if (colsel > 0)
                {
                    colsel--;
                }
                else
                {
                    colsel = 31;
                    if (rowsel > 0)
                    {
                        rowsel--;
                        if (rowsel == 1 || rowsel == 10)
                        {
                            rowsel--;
                        }
                        if (rowsel == 0)
                        {
                            colsel = 9;
                        }
                    }
                    else
                    {
                        rowsel = 18;
                    }
                }
            }
            if (key == CH_CURS_DOWN)
            {
                rowsel++;
            }
            if (key == CH_CURS_UP)
            {
                if (rowsel > 0)
                {
                    rowsel--;
                    if (rowsel == 1 || rowsel == 10)
                    {
                        rowsel--;
                    }
                }
                else
                {
                    rowsel = 18;
                }
            }
            if (colsel > 9 && rowsel == 0)
            {
                colsel = 0;
                rowsel = 2;
            }
            if (colsel > 31)
            {
                colsel = 0;
                rowsel++;
            }
            if (rowsel > 18)
            {
                rowsel = 0;
            }
            if (rowsel == 1 || rowsel == 10)
            {
                rowsel++;
            }
            vdcwin_cursor_toggle(&canvas.view);
            vdcwin_cursor_move(&canvas.view, 45 + colsel, 2 + rowsel);
            vdcwin_cursor_toggle(&canvas.view);
            break;

        // Select character
        case CH_SPACE:
        case CH_ENTER:
            palette_returnscreencode();
            plotscreencode = palettechar;
            key = CH_ESC;
            break;

        // Toggle visual PETSCII map
        case 'v':
            vdcwin_win_free();
            palette_returnscreencode();
            visualmap = (visualmap) ? 0 : 1;
            palette_draw();
            vdcwin_cursor_move(&canvas.view, 45 + colsel, 2 + rowsel);
            vdcwin_cursor_toggle(&canvas.view);
            break;

        // Toggle statusbar
        case CH_F6:
            togglestatusbar();
            break;

        // Help screen
        case CH_F8:
            vdcwin_cursor_toggle(&canvas.view);
            vdcwin_win_free();
            helpscreen_load(2);
            palette_draw();
            vdcwin_cursor_move(&canvas.view, 45 + colsel, 2 + rowsel);
            vdcwin_cursor_toggle(&canvas.view);
            break;

        default:
            // Store in favourites
            if (key > 47 && key < 58 && rowsel > 0)
            {
                palette_returnscreencode();
                favourites[key - 48][0] = palettechar;
                if (rowsel < 10)
                {
                    favourites[key - 48][1] = 0;
                }
                else
                {
                    favourites[key - 48][1] = 1;
                }
                vdc_printc(key - 3, 2, favourites[key - 48][0], attribute + favourites[key - 48][1] * VDC_A_ALTCHAR);
            }
            break;
        }
    } while (key != CH_ESC && key != CH_STOP);

    vdcwin_win_free();
    resetcursor();
    strcpy(programmode, "Main");
}

void resizewidth()
{
    // Function to resize screen canvas width

    unsigned newwidth = 0;
    unsigned maxsize = MEMORYLIMIT - SCREENMAPBASE;
    char areyousure = 0;
    char sizechanged = 0;
    unsigned y;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Resize canvas width");
    vdc_underline(0);
    vdc_prints(21, 8, "Enter new width:");

    sprintf(buffer, "%u", canvas.sourcewidth);
    if (textInput(21, 9, buffer, 3) > 0)
    {
        newwidth = (unsigned)strtol(buffer, &ptrend, 10);
    }

    if ((newwidth * canvas.sourceheight * 2) + 48 > maxsize || !newwidth)
    {
        vdc_prints(21, 11, "New size unsupported. Press key.");
        getch();
    }
    else
    {
        if (newwidth < canvas.sourcewidth)
        {
            vdc_prints(21, 11, "Shrinking might delete data.");
            vdc_prints(21, 12, "Are you sure?");
            areyousure = menu_pulldown(25, 13, VDC_MENU_YESNO, 0);
            if (areyousure == 1)
            {
                for (y = 1; y < canvas.sourceheight; y++)
                {
                    bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_screenaddr(y, 0, canvas.sourcewidth), newwidth);
                    bnk_cpyfromvdc(BNK_1_FULL, screenmap_screenaddr(y, 0, newwidth), vdc_state.swap_text, newwidth);
                }
                for (y = 0; y < canvas.sourceheight; y++)
                {
                    bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_attraddr(y, 0, canvas.sourcewidth, canvas.sourceheight), newwidth);
                    bnk_cpyfromvdc(BNK_1_FULL, screenmap_attraddr(y, 0, newwidth, canvas.sourceheight), vdc_state.swap_text, newwidth);
                }
                if (screen_col > newwidth - 1)
                {
                    screen_col = newwidth - 1;
                }
                sizechanged = 1;
            }
        }
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
            sizechanged = 1;
        }
    }

    vdcwin_win_free();

    if (sizechanged == 1)
    {
        canvas.sourcewidth = newwidth;
        canvas.sourcexoffset = 0;
        updatecanvas();
        placesignature();
        vdc_state.text_attr = VDC_WHITE;
        vdc_cls();
        vdcwin_cpy_viewport(&canvas);
        menu_placebar(0);
        if (showbar)
        {
            initstatusbar();
        }
        undo_undopossible = 0;
        undo_redopossible = 0;
    }
}

void resizeheight()
{
    // Function to resize screen camvas height

    unsigned newheight = 0;
    unsigned maxsize = MEMORYLIMIT - SCREENMAPBASE;
    char areyousure = 0;
    char sizechanged = 0;
    char y;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Resize canvas height");
    vdc_underline(0);
    vdc_prints(21, 8, "Enter new height:");

    sprintf(buffer, "%u", canvas.sourceheight);
    if (textInput(21, 9, buffer, 3) > 0)
    {
        newheight = (unsigned)strtol(buffer, &ptrend, 10);
    }

    if ((newheight * canvas.sourcewidth * 2) + 48 > maxsize || !newheight)
    {
        vdc_prints(21, 11, "New size unsupported. Press key.");
        getch();
    }
    else
    {
        if (newheight < canvas.sourceheight)
        {

            vdc_prints(21, 11, "Shrinking might delete data.");
            vdc_prints(21, 12, "Are you sure?");
            areyousure = menu_pulldown(25, 13, VDC_MENU_YESNO, 0);
            if (areyousure == 1)
            {
                bnk_memcpy(BNK_1_FULL, screenmap_attraddr(0, 0, canvas.sourcewidth, newheight), BNK_1_FULL, screenmap_attraddr(0, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth * canvas.sourceheight);
                if (screen_row > newheight - 1)
                {
                    screen_row = newheight - 1;
                }
                sizechanged = 1;
            }
        }
        if (newheight > canvas.sourceheight)
        {
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_memcpy(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, newheight), BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth);
            }
            bnk_memset(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight, 0, canvas.sourcewidth, newheight), VDC_WHITE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            bnk_memset(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight, 0, canvas.sourcewidth), CH_SPACE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            sizechanged = 1;
        }
    }

    vdcwin_win_free();

    if (sizechanged == 1)
    {
        canvas.sourceheight = newheight;
        canvas.sourceyoffset = 0;
        updatecanvas();
        placesignature();
        vdc_state.text_attr = VDC_WHITE;
        vdc_cls();
        vdcwin_cpy_viewport(&canvas);
        menu_placebar(0);
        if (showbar)
        {
            initstatusbar();
        }
        undo_undopossible = 0;
        undo_redopossible = 0;
    }
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)