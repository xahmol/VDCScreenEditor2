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
#include "overlay3.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl3, 4)
#pragma section(codeovl3, 0)
#pragma section(dataovl3, 0)
#pragma section(bssovl3, 0)
#pragma region(ovl3, OVERLAYLOAD, 0xC000, , 4, { codeovl3, dataovl3, bssovl3  } )

#pragma code(codeovl3)
#pragma data(dataovl3)
#pragma bss(bssovl3)

void loadscreenmap()
{
    printf("Placeholder.");
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)