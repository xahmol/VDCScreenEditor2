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
#include "overlay2.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl2, 3)
#pragma section(codeovl2, 0)
#pragma section(dataovl2, 0)
#pragma section(bssovl2, 0)
#pragma region(ovl2, OVERLAYLOAD, 0xC000, , 3, { codeovl2, dataovl2, bssovl2  } )

#pragma code(codeovl2)
#pragma data(dataovl2)
#pragma bss(bssovl2)

void plotvisible(unsigned char row, unsigned char col, unsigned char setorrestore)
{
    // Plot or erase part of line or box if in visible viewport
    // Input: row, column, and flag setorrestore to plot new value (1) or restore old value (0)

    if (row >= canvas.sourceyoffset && row <= canvas.sourceyoffset + 24 && col >= canvas.sourcexoffset && col <= canvas.sourcexoffset + 79)
    {
        if (setorrestore == 1)
        {
            vdc_printc(col - canvas.sourcexoffset, row - canvas.sourceyoffset, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
        }
        else
        {
            vdc_printc(col - canvas.sourcexoffset, row - canvas.sourceyoffset, bnk_readb(BNK_1_FULL, screenmap_screenaddr(row, col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(row, col, canvas.sourcewidth, canvas.sourceheight)));
        }
    }
}

void lineandbox(unsigned char draworselect)
{
    // Select line or box from upper left corner using cursor keys, ESC for cancel and ENTER for accept
    // Input: draworselect: Choose select mode (0) or draw mode (1)

    unsigned char key;
    unsigned char x, y;

    select_startx = screen_col + canvas.sourcexoffset;
    select_starty = screen_row + canvas.sourceyoffset;
    select_endx = select_startx;
    select_endy = select_starty;
    select_accept = 0;

    if (draworselect)
    {
        strcpy(programmode, "Line/Box");
    }

    do
    {
        if (showbar)
        {
            printstatusbar();
        }
        key = vdcwin_getch();
        vdcwin_cursor_show(&canvas.view, 1);

        switch (key)
        {
        case CH_CURS_RIGHT:
            cursormove(0, 1, 0, 0);
            select_endx = screen_col + canvas.sourcexoffset;
            for (y = select_starty; y < select_endy + 1; y++)
            {
                plotvisible(y, select_endx, 1);
            }
            break;

        case CH_CURS_LEFT:
            if (select_endx > select_startx)
            {
                cursormove(1, 0, 0, 0);
                for (y = select_starty; y < select_endy + 1; y++)
                {
                    plotvisible(y, select_endx, 0);
                }
                select_endx = screen_col + canvas.sourcexoffset;
            }
            break;

        case CH_CURS_UP:
            if (select_endy > select_starty)
            {
                cursormove(0, 0, 1, 0);
                for (x = select_startx; x < select_endx + 1; x++)
                {
                    plotvisible(select_endy, x, 0);
                }
                select_endy = screen_row + canvas.sourceyoffset;
            }
            break;

        case CH_CURS_DOWN:
            cursormove(0, 0, 0, 1);
            select_endy = screen_row + canvas.sourceyoffset;
            for (x = select_startx; x < select_endx + 1; x++)
            {
                plotvisible(select_endy, x, 1);
            }
            break;

        // Toggle statusbar
        case CH_F6:
            togglestatusbar();
            break;

        case CH_F8:
            if (select_startx == select_endx && select_starty == select_endy)
                helpscreen_load(3);
            break;

        default:
            break;
        }
        vdcwin_cursor_move(&canvas.view, screen_col, screen_row);
        plotcursor();
    } while (key != CH_ESC && key != CH_STOP && key != CH_ENTER);

    if (key == CH_ENTER)
    {
        select_width = select_endx - select_startx + 1;
        select_height = select_endy - select_starty + 1;
        undo_new(select_starty, select_startx, select_width, select_height);
    }

    if (key == CH_ENTER && draworselect == 1)
    {
        for (y = select_starty; y < select_endy + 1; y++)
        {
            bnk_memset(BNK_1_FULL, screenmap_screenaddr(y, select_startx, canvas.sourcewidth), plotscreencode, select_width);
            bnk_memset(BNK_1_FULL, screenmap_attraddr(y, select_startx, canvas.sourcewidth, canvas.sourceheight), VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar), select_width);
        }
    }
    else
    {
        vdcwin_cpy_viewport(&canvas);
        if (showbar)
        {
            initstatusbar();
        }
        if (key == CH_ENTER)
        {
            select_accept = 1;
        }
    }
    if (draworselect)
    {
        strcpy(programmode, "Main");
    }
    plotcursor();
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)