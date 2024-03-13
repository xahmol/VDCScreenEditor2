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
#include "overlay2.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl3, 4)
#pragma section(codeovl3, 0)
#pragma section(dataovl3, 0)
#pragma section(bssovl3, 0)
#pragma region(ovl3, OVERLAYLOAD, 0xC000, , 4, { codeovl3, dataovl3, bssovl3  } )

#pragma code(codeovl3)
#pragma data(dataovl3)
#pragma bss(bssovl3)

void changebackgroundcolor()
{
    // Function to change background color

    char key;
    char newcolor = screenbackground;
    char changed = 0;

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

#pragma code(code)
#pragma data(data)
#pragma bss(bss)