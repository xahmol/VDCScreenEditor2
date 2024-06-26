/*
Oscar64 VDC function library

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Code and resources from others used:

-   Oscar64 cross compiler

    https://github.com/drmortalwombat/oscar64

    Many thanks also to https://github.com/drmortalwombat to provide extrordinary support and tips for making this and adapting Oscar64 to my needs faster than I could ask it.

-   Screens used in the demo made with my own VDC Screen Editor.

    https://github.com/xahmol/VDCScreenEdit

-   Commodore logo charset created using CharPad Pro.

    https://subchristsoftware.itch.io/c64-pro-editions

-   C128 Programmers Reference Guide: For the basic VDC register routines and VDC code inspiration

    http://www.zimmers.net/anonftp/pub/cbm/manuals/c128/C128_Programmers_Reference_Guide.pdf

-   Tokra: For the optimal VDC registry settings for 80x50 and 80x70 textmodes

-   Scott Hutter - VDC Core functions inspiration:

    https://github.com/Commodore64128/vdc_gui/blob/master/src/vdc_core.c

    (used as starting point)

-   Scott Robison for teaching me how o create a C128 disk boot sector

-   Francesco Sblendorio - Screen Utility: used for inspiration:

    https://github.com/xlar54/ultimateii-dos-lib/blob/master/src/samples/screen_utility.c

-   DevDef: Commodore 128 Assembly - Part 3: The 80-column (8563) chip

    https://devdef.blogspot.com/2018/03/commodore-128-assembly-part-3-80-column.html

-   Tips and Tricks for C128: VDC

    http://commodore128.mirkosoft.sk/vdc.html

-   Steve Goldsmith - C3L Commodore 128 CP/M C Library

    https://github.com/sgjava/c3l

    (Used for inspiration and for the text wrap and random sentence generator functions)

-   Bart van Leeuwen: For inspiration and advice while coding. Also for providing the excellent Device Manager ROM to make testing on real hardware very easy

-   Original windowing system code on Commodore 128 by unknown author.
   
-   Tested using real hardware (C128D and C128DCR) plus VICE.

The code can be used freely as long as you retain a notice describing original source and author.

THE PROGRAMS ARE DISTRIBUTED IN THE HOPE THAT THEY WILL BE USEFUL, BUT WITHOUT ANY WARRANTY. USE THEM AT YOUR OWN RISK!
*/

#ifndef BANKING_H
#define BANKING_H

// Defines for MMU modes, MMU $FF00 configuration values
#define BNK_DEFAULT 0x0e
#define BNK_CHARROM 0x01
#define BNK_0_FULL 0x3f
#define BNK_1_FULL 0x7f
#define BMK_0_IO 0x3e
#define BNK_1_IO 0x7e

// Function Prototypes

// Not in overlay
char getcurrentdevice();
void load_overlay(const char *fname);
void bnk_init();
void bnk_exit();

// In overlay
__noinline char bnk_readb(char cr, volatile char *p);
__noinline void bnk_writeb(char cr, volatile char *p, char b);
__noinline void bnk_memcpy(char dcr, volatile char *dp, char scr, volatile char *sp, unsigned size);
__noinline void bnk_memset(char cr, volatile char *p, char val, unsigned size);
__noinline bool bnk_load(char device, char bank, const char *start, const char *fname);
__noinline bool bnk_save(char device, char bank, const char *start, const char *end, const char *fname);

// Globals
extern char bootdevice;

#pragma compile("bank_minimal.c")

#endif