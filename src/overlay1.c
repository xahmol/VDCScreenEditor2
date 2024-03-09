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

#pragma code(code)
#pragma data(data)
#pragma bss(bss)