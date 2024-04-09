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

// Memory region for code, data etc. from 0x1c80
#pragma region( vdcse2prgvwc, 0x1c80, 0x3200, , , {code, data, bss, heap, stack} )
#pragma stacksize( 512 )
#pragma heapsize( 0 )

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

void show_scroll()
// Viewer with softscroll
{
}

void show_noscroll()
// Viewer without scroll
{
    char xc = 0;
    char yc = 0;
    struct VDCViewport canvas;

    // Center coords if screen is smaller than present VDC mode screen
    if (view.width < vdc_state.width)
    {
        xc = (vdc_state.width - view.width) / 2;
    }
    if (view.height < vdc_state.height)
    {
        yc = (vdc_state.height - view.height) / 2;
    }

    // Init canvas
    vdcwin_viewport_init(&canvas,view.screen,view.width,view.height,view.width,view.height,xc,yc);

    // Show screen
    vdcwin_cpy_viewport(&canvas);

    // Exit on key press
    vdcwin_getch();
}

int main(void)
{
    // Init
    vdc_init(view.mode, 0);
    vdc_bgcolor(view.background);

    // Check if std charset has to be redefined
    if (view.charstd)
    {
        vdc_redef_charset(vdc_state.char_std, view.charstd, 256);
    }

    // Check if alt charset has to be redefined
    if (view.charstd)
    {
        vdc_redef_charset(vdc_state.char_alt, view.charalt, 256);
    }

    // Check screen dimension against VDC mode dimension to see if scrolling is needed
    if (view.width > vdc_state.width || view.height > vdc_state.height)
    {
        show_scroll();
    }
    else
    {
        show_noscroll();
    }

    // Exit
    vdc_exit();
}
