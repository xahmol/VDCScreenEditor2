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
#include "banking.h"
#include "vdc_win.h"
#include "vdc_menu.h"
#include "main.h"
#include "overlay1.h"

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

    unsigned char key, screencode;
    unsigned char rvs = 0;

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

void resizewidth()
{
    // Function to resize screen canvas width

    unsigned int newwidth = 0;
    unsigned int maxsize = MEMORYLIMIT - SCREENMAPBASE;
    unsigned char areyousure = 0;
    unsigned char sizechanged = 0;
    unsigned int y;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Resize canvas width");
    vdc_underline(0);
    vdc_prints(21, 8, "Enter new width:");

    sprintf(buffer, "%u", canvas.sourcewidth);
    if (textInput(21, 9, buffer, 4, 1) > 0)
    {
        newwidth = (unsigned int)strtol(buffer, &ptrend, 10);
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

    unsigned int newheight = 0;
    unsigned int maxsize = MEMORYLIMIT - SCREENMAPBASE;
    unsigned char areyousure = 0;
    unsigned char sizechanged = 0;
    unsigned char y;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Resize canvas height");
    vdc_underline(0);
    vdc_prints(21, 8, "Enter new height:");

    sprintf(buffer, "%u", canvas.sourceheight);
    if (textInput(21, 9, buffer, 4, 1) > 0)
    {
        newheight = (unsigned int)strtol(buffer, &ptrend, 10);
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

void selectscreenmode()
// Select the screen mode from the menu
{
    char menuchoice;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Select screen mode");
    vdc_underline(0);
    vdc_prints(21, 8, "Choose desired mode:");

    menuchoice = menu_pulldown(25, 9, VDC_MENU_YESNO + 1, 1);

    vdcwin_win_free();

    vdc_state.text_attr = VDC_WHITE;
    if (menuchoice)
    {
        if ((menuchoice - 1) != vdc_state.mode)
        {
            vdc_set_mode(menuchoice - 1);
            updatecanvas();
            vdcwin_cpy_viewport(&canvas);
            menu_placebar(0);
            if (showbar)
            {
                initstatusbar();
            }
        }
    }
}

void changebackgroundcolor()
{
    // Function to change background color

    unsigned char key;
    unsigned char newcolor = screenbackground;
    unsigned char changed = 0;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Change background color");
    vdc_underline(0);
    sprintf(buffer, "Color: %2u", newcolor);
    vdc_prints(21, 8, buffer);
    vdc_prints(21, 10, "Press:");
    vdc_prints(21, 11, "+:     Increase color number");
    vdc_prints(21, 12, "-:     Decrease color number");
    vdc_prints(21, 13, "ENTER: Accept color");
    vdc_prints(21, 14, "ESC:   Cancel");

    do
    {
        do
        {
            key = vdcwin_getch();
        } while (key != CH_ENTER && key != CH_ESC && key != CH_STOP && key != '+' && key != '-');

        switch (key)
        {
        case '+':
            newcolor++;
            if (newcolor > 15)
            {
                newcolor = 0;
            }
            changed = 1;
            break;

        case '-':
            if (newcolor == 0)
            {
                newcolor = 15;
            }
            else
            {
                newcolor--;
            }
            changed = 1;
            break;

        case CH_ESC:
        case CH_STOP:
            changed = 0;
            vdc_bgcolor(screenbackground);
            break;

        default:
            break;
        }

        if (changed == 1)
        {
            vdc_bgcolor(newcolor);
            sprintf(buffer, "Color: %2u", newcolor);
            vdc_prints(21, 8, buffer);
        }
    } while (key != CH_ENTER && key != CH_ESC && key != CH_STOP);

    if (changed = 1)
    {
        screenbackground = newcolor;

        // Change menu palette based on background color

        // Default palette if black or dark grey background
        if (screenbackground == VDC_BLACK || screenbackground == VDC_DGREY)
        {
            mc_mb_normal = VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR;
            mc_mb_select = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
            mc_pd_normal = VDC_DCYAN + VDC_A_REVERSE + VDC_A_ALTCHAR;
            mc_pd_select = VDC_LYELLOW + VDC_A_REVERSE + VDC_A_ALTCHAR;
            mc_menupopup = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
        }
        else
        {
            // Palette for background colors with intensity bit enabled
            if (screenbackground & 0x01)
            {
                mc_mb_normal = VDC_BLACK + VDC_A_REVERSE + VDC_A_ALTCHAR;
                mc_mb_select = VDC_BLACK + VDC_A_ALTCHAR;
                mc_pd_normal = VDC_BLACK + VDC_A_REVERSE + VDC_A_ALTCHAR;
                mc_pd_select = VDC_BLACK + VDC_A_ALTCHAR;
                mc_menupopup = VDC_BLACK + VDC_A_REVERSE + VDC_A_ALTCHAR;
            }
            // Palette for background color with intensity bit disabled if not black/dgrey
            else
            {
                mc_mb_normal = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
                mc_mb_select = VDC_WHITE + VDC_A_ALTCHAR;
                mc_pd_normal = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
                mc_pd_select = VDC_WHITE + VDC_A_ALTCHAR;
                mc_menupopup = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
            }
        }
        vdc_state.text_attr = mc_menupopup;
        updatecanvas();
    }

    vdcwin_win_free();
}

void versioninfo()
{
    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 5, 5, 60, 15);
    vdc_underline(1);
    vdc_prints(6, 6, "Version information and credits");
    vdc_underline(0);
    vdc_prints(6, 8, "VDC Screen Editor");
    vdc_prints(6, 9, "Written in 2024 by Xander Mol");
    sprintf(buffer, "Version: %s", VERSION);
    vdc_prints(6, 11, buffer);
    vdc_prints(6, 13, "Full source code, documentation and credits at:");
    vdc_prints(6, 14, "https://github.com/xahmol/VDCScreenEditor2");
    vdc_prints(6, 16, "(C) 2024, IDreamtIn8Bits.com");
    vdc_prints(6, 18, "Press a key to continue.");
    getch();
    vdcwin_win_free();
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)