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

-   PetMate 9 source code by Wbochar: For SEQ import and export code
    https://github.com/wbochar/petmate9

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
#include "vdc_core.h"
#include "peekpoke.h"
#include "banking.h"
#include "vdc_win.h"
#include "vdc_menu.h"
#include "main.h"
#include "overlay6.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl6, 7)
#pragma section(codeovl6, 0)
#pragma section(dataovl6, 0)
#pragma section(bssovl6, 0)
#pragma region(ovl6, OVERLAYLOAD, 0xC000, , 7, { codeovl6, dataovl6, bssovl6  } )

#pragma code(codeovl6)
#pragma data(dataovl6)
#pragma bss(bssovl6)

void rebase()
// Rebase viewport pos based on import coords
{
    screen_col = importvars.xpos + importvars.xc;
    canvas.sourcexoffset = 0;
    while (screen_col > (vdc_state.width - 1))
    {
        canvas.sourcexoffset++;
        screen_col--;
    }

    screen_row = importvars.ypos + importvars.yc;
    canvas.sourceyoffset = 0;
    while (screen_row > (vdc_state.height - 1))
    {
        canvas.sourceyoffset++;
        screen_row--;
    }

    vdcwin_cpy_viewport(&canvas);
}

void seqimport_move(char left, char right, char up, char down)
{
    // Move cursor and scroll screen if needed
    // Input: flags to enable (1) or disable (0) move in the different directions

    if (left == 1)
    {
        if (importvars.xc == 0)
        {
            if (importvars.yc > 0)
            {
                importvars.yc--;
                importvars.xc = importvars.width - 1;
                rebase();
            }
        }
        else
        {
            importvars.xc--;
            if (screen_col == 0)
            {
                if (canvas.sourcexoffset > 0)
                {
                    vdcwin_viewportscroll(&canvas, SCROLL_LEFT);
                }
            }
            else
            {
                screen_col--;
            }
        }
    }
    if (right == 1)
    {
        if (importvars.xc < importvars.width)
        {
            importvars.xc++;
            if (screen_col == getmaxx())
            {
                if (canvas.sourcexoffset + screen_col < canvas.sourcewidth - 1)
                {
                    vdcwin_viewportscroll(&canvas, SCROLL_RIGHT);
                }
            }
            else
            {
                screen_col++;
            }
        }
        else
        {
            if (importvars.yc < importvars.height)
            {
                importvars.yc++;
                importvars.xc = 0;
                rebase();
            }
        }
    }
    if (up == 1)
    {
        if (importvars.yc > 0)
        {
            importvars.yc--;
            if (screen_row == 0)
            {
                if (canvas.sourceyoffset > 0)
                {
                    vdcwin_viewportscroll(&canvas, SCROLL_UP);
                }
            }
            else
            {
                screen_row--;
            }
        }
    }
    if (down == 1)
    {
        if (importvars.yc < importvars.height)
        {
            importvars.yc++;
            if (screen_row == getmaxy())
            {
                if (canvas.sourceyoffset + screen_row < canvas.sourceheight - 1)
                {
                    vdcwin_viewportscroll(&canvas, SCROLL_DOWN);
                }
            }
            else
            {
                screen_row++;
            }
        }
    }
}

void decode_controlcode(char ch, char cls, unsigned xpos, unsigned ypos, unsigned width, unsigned height)
// Decode PETSCII chars and control codes and perform output based on code
{

    switch (ch)
    {
    // 	Underline On
    case 0x02:
        plotunderline = 1;
        break;

    // 	Set text color to White
    case 0x05:
        plotcolor = VDC_WHITE;
        break;

    // Line Feed / Return
    case 0x0a:
    case 0x0d:
        importvars.xc = 0;
        if (importvars.yc < height)
        {
            importvars.yc++;
        }
        rebase();
        break;

    // Switch to lower case
    case 0x0e:
        plotaltchar = 1;
        break;

    // Flash On
    case 0x0f:
        plotblink = 1;
        break;

    // Cursor Down
    case 0x11:
        seqimport_move(0, 0, 0, 1);
        break;

    // Reverse On
    case 0x12:
        plotreverse = 1;
        break;

    // Cursor Home
    case 0x13:
        importvars.xc = 0;
        importvars.yc = 0;
        rebase();
        break;

    // Delete
    case 0x14:
        seqimport_move(1, 0, 0, 0);
        screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, CH_SPACE, VDC_WHITE);
        break;

    // 	Set text color to Red
    case 0x1c:
        plotcolor = VDC_DRED;
        break;

    // Cursor Right
    case 0x1d:
        seqimport_move(0, 1, 0, 0);
        break;

    // 	Set text color to Green
    case 0x1e:
        plotcolor = VDC_DGREEN;
        break;

    // 	Set text color to Blue
    case 0x1f:
        plotcolor = VDC_DBLUE;
        break;

    // 	Set text color to Dark Purple
    case 0x81:
        plotcolor = VDC_DPURPLE;
        break;

    // 	Underline Off
    case 0x82:
        plotunderline = 0;
        break;

    // Switch to upper case
    case 0x8e:
        plotaltchar = 0;
        break;

    // Flash On
    case 0x8f:
        plotblink = 0;
        break;

    // 	Set text color to Black
    case 0x90:
        plotcolor = VDC_BLACK;
        break;

    // Cursor Up
    case 0x91:
        seqimport_move(0, 0, 1, 0);
        break;

    // Reverse Off
    case 0x92:
        plotreverse = 0;
        break;

    // Clear
    case 0x93:
        // Should clear be ignored? If no perform clear
        if (cls)
        {
            for (char y = 0; y < width; y++)
            {
                bnk_memset(BNK_1_FULL, screenmap_screenaddr(ypos + y, xpos, canvas.sourcewidth), CH_SPACE, width);
                bnk_memset(BNK_1_FULL, screenmap_attraddr(ypos + y, xpos, canvas.sourcewidth, canvas.sourceheight), CH_SPACE, width);
            }
        }
        importvars.xc = 0;
        importvars.yc = 0;
        rebase();
        break;

    // 	Set text color to Dark Yellow
    case 0x95:
        plotcolor = VDC_DYELLOW;
        break;

    // 	Set text color to Light Red
    case 0x96:
        plotcolor = VDC_LRED;
        break;

    // 	Set text color to Dark Cyan
    case 0x97:
        plotcolor = VDC_DCYAN;
        break;

    // 	Set text color to Dark Grey
    case 0x98:
        plotcolor = VDC_DGREY;
        break;

    // 	Set text color to Light Green
    case 0x99:
        plotcolor = VDC_LGREEN;
        break;

    // 	Set text color to Light Blue
    case 0x9a:
        plotcolor = VDC_LBLUE;
        break;

    // 	Set text color to Light Gray
    case 0x9b:
        plotcolor = VDC_LGREY;
        break;

    // 	Set text color to Light Purple
    case 0x9c:
        plotcolor = VDC_LPURPLE;
        break;

    // Cursor Left
    case 0x9d:
        seqimport_move(1, 0, 0, 0);
        break;

    // 	Set text color to Light Yellow
    case 0x9e:
        plotcolor = VDC_LYELLOW;
        break;

    // 	Set text color to Light Cyan
    case 0x9f:
        plotcolor = VDC_LCYAN;
        break;

    default:
        if (isprint(ch))
        {
            screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
            vdc_printc(screen_col, screen_row, bnk_readb(BNK_1_FULL, screenmap_screenaddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth, canvas.sourceheight)));
            seqimport_move(0, 1, 0, 0);
        }
        break;
    }
}

void import_seq()
{
    if (import_dialogue(2, "Import SEQ"))
    {
        // Exit pop up window
        vdcwin_win_free();

        // Exit menu bar
        vdcwin_win_free();

        // Show new viewport data
        placesignature();
        vdcwin_cpy_viewport(&canvas);

        // Restore menu and statusbbars
        vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
        menu_placebar(0);
        if (showbar)
        {
            initstatusbar();
        }
        undo_undopossible = 0;
        undo_redopossible = 0;
    }
}

void export_seq()
{
    menu_messagepopup("Export SEQ placeholder");
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)