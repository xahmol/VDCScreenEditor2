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

// Memory region for viewer data
#pragma section(viewdata, 0)
#pragma region( viewdata, 0x1c80, 0x1ca0, , , {viewdata} )

// Memory region for code, data etc. from 0x1c80
#pragma region( vdcse2prgvwc, 0x1ca0, 0x4600, , , {code, data, bss, heap, stack} )
#pragma stacksize(512)
#pragma heapsize(0)

#pragma data(viewdata)
#pragma bss(viewdata)
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
#pragma data(data)
#pragma bss(bss)

struct VDCSoftScrollSettings softscroll;
char vert_dir;
char hor_dir;
char phase;
char nextystop;

void check_charsets()
// Check if charsets need to be redefined
{
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
}

char right_check()
// Check right boundery
{
    if (softscroll.hscroll > 5)
    {
        if (softscroll.xoff == softscroll.width - vdc_state.width - 1)
        {
            return 1;
        }
    }
    return 0;
}

char down_check()
// Check down boundery
{
    if (softscroll.vscroll == 6)
    {
        if (softscroll.yoff == nextystop)
        {
            return 1;
        }
    }
    return 0;
}

char left_check()
// Check right boundery
{
    if (softscroll.hscroll == softscroll.hscroll_def)
    {
        if (softscroll.xoff == 0)
        {
            return 1;
        }
    }
    return 0;
}

char up_check()
// Check down boundery
{
    if (softscroll.vscroll == 0)
    {
        if (softscroll.yoff == nextystop)
        {
            return 1;
        }
    }
    return 0;
}

void show_smooth_croll()
// Viewer with softscroll
{
    vert_dir = (view.height > vdc_state.height) ? 1 : 0;
    hor_dir = (view.width > vdc_state.width) ? 1 : 0;
    phase = 1;
    nextystop = vdc_state.height - 1;

    softscroll.source = (char *)view.screen;
    softscroll.width = view.width;
    softscroll.height = view.height;

    if (!vdc_softscroll_init(&softscroll, vdc_state.mode))
    {
        return;
    }

    check_charsets();

    // Ensure no longer keypress is detected
    while (vdcwin_checkch())
    {
        ;
    }

    do
    {
        // Adjust VStop if higher than screen height
        if (nextystop > softscroll.height - vdc_state.height - 2)
        {
            nextystop = softscroll.height - vdc_state.height - 1;
        }

        // Phase 1: Scroll right before scrolling down
        if (phase == 1)
        {
            if (hor_dir)
            {
                if (right_check())
                {
                    phase++;
                }
                else
                {
                    vdc_softscroll_right(&softscroll, 2);
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 2: Scrolling down before scrolling left
        if (phase == 2)
        {
            if (vert_dir)
            {
                vdc_softscroll_down(&softscroll, 2);
                if (down_check())
                {
                    if (nextystop == softscroll.height - vdc_state.height - 1)
                    {
                        phase = 7;
                        if (softscroll.yoff > vdc_state.height)
                        {
                            nextystop -= vdc_state.height;
                        }
                        else
                        {
                            nextystop = 0;
                        }
                    }
                    else
                    {
                        phase++;
                        nextystop += vdc_state.height;
                    }
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 3: Scrolling left before scrolling down
        if (phase == 3)
        {
            if (hor_dir)
            {
                if (left_check())
                {
                    phase++;
                }
                else
                {
                    vdc_softscroll_left(&softscroll, 2);
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 4: Scrolling down before scrolling right
        if (phase == 4)
        {
            if (vert_dir)
            {
                vdc_softscroll_down(&softscroll, 2);
                if (down_check())
                {
                    if (nextystop == softscroll.height - vdc_state.height - 1)
                    {
                        phase = 5;
                        if (softscroll.yoff > vdc_state.height)
                        {
                            nextystop -= vdc_state.height;
                        }
                        else
                        {
                            nextystop = 0;
                        }
                    }
                    else
                    {
                        phase = 1;
                        nextystop += vdc_state.height;
                    }
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 5: Scrolling right before scrolling up
        if (phase == 5)
        {
            if (hor_dir)
            {
                if (right_check())
                {
                    phase++;
                }
                else
                {
                    vdc_softscroll_right(&softscroll, 2);
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 6: Scrolling up before scrolling left
        if (phase == 6)
        {
            if (vert_dir)
            {

                vdc_softscroll_up(&softscroll, 2);
                if (up_check())
                {
                    if (nextystop == 0)
                    {
                        phase = 3;
                        nextystop = vdc_state.height;
                    }
                    else
                    {
                        phase++;
                        if (nextystop > vdc_state.height - 1)
                        {
                            nextystop -= vdc_state.height;
                        }
                        else
                        {
                            nextystop = 0;
                        }
                    }
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 7: Scrolling left before scrolling up
        if (phase == 7)
        {
            if (hor_dir)
            {
                if (left_check())
                {
                    phase++;
                }
                else
                {
                    vdc_softscroll_left(&softscroll, 2);
                }
            }
            else
            {
                phase++;
            }
        }

        // Phase 8: Scrolling up before right again
        if (phase == 8)
        {
            if (vert_dir)
            {

                vdc_softscroll_up(&softscroll, 2);
                if (up_check())
                {
                    if (nextystop == 0)
                    {
                        phase = 1;
                        nextystop = vdc_state.height;
                    }
                    else
                    {
                        phase = 5;
                        if (nextystop > vdc_state.height - 1)
                        {
                            nextystop -= vdc_state.height;
                        }
                        else
                        {
                            nextystop = 0;
                        }
                    }
                }
            }
            else
            {
                phase = 1;
            }
        }

        if (vdcwin_checkch())
        {
            phase = 0;
        }
    } while (phase);

    vdc_softscroll_exit(&softscroll, vdc_state.mode);
}

void show_char_scroll()
// If insufficient VDC memory use per char instead of smooth scroll. Only vertical scroll supported.
{
    struct VDCViewport charscroll;

    vdcwin_viewport_init(&charscroll, (char *)view.screen, view.width, view.height, vdc_state.width, vdc_state.height, 0, 0);
    check_charsets();

    // Show screen
    vdcwin_cpy_viewport(&charscroll);

    // Init scroll
    phase = 1;

    // Ensure no longer keypress is detected
    while (vdcwin_checkch())
    {
        ;
    }

    do
    {
        // Phase 1: Scrolling down
        if (phase == 1)
        {
            vdc_wait_vblank();
            vdcwin_viewportscroll(&charscroll, SCROLL_DOWN);
            vdc_wait_no_vblank();
            vdc_pass_vblank();
            if (charscroll.sourceyoffset == view.height - vdc_state.height + 1)
            {
                phase++;
            }
        }

        // Phase 2: Scrolling up
        if (phase == 2)
        {
            vdc_wait_vblank();
            vdcwin_viewportscroll(&charscroll, SCROLL_UP);
            vdc_wait_no_vblank();
            vdc_pass_vblank();
            if (charscroll.sourceyoffset == 0)
            {
                phase = 1;
            }
        }

        if (vdcwin_checkch())
        {
            phase = 0;
        }
    } while (phase);
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
    vdcwin_viewport_init(&canvas, view.screen, view.width, view.height, view.width, view.height, xc, yc);
    check_charsets();

    // Show screen
    vdcwin_cpy_viewport(&canvas);

    // Exit on key press
    vdcwin_getch();
}

int main(void)
{
    // Init
    vdc_init(view.mode, 1);
    vdc_bgcolor(view.background);

    // Check screen dimension against VDC mode dimension to see if scrolling is needed
    if (view.width > vdc_state.width || view.height > vdc_state.height)
    {
        if (vdc_state.memextended)
        {
            show_smooth_croll();
        }
        else
        {
            if (view.width > vdc_state.width)
            {
                vdc_prints(0,0,"64 KB VDC RAM needed for horizontal scroll. Press key.");
                vdcwin_getch();
            }
            else
            {
                show_char_scroll();
            }
        }
    }
    else
    {
        show_noscroll();
    }

    // Restore charsets if needed
    if (!view.mode && (view.charstd || view.charalt))
    {
        vdc_restore_charsets();
    }

    // Exit
    vdc_exit();
    printf("\n\rgenerated with vdcse version %s\n\r", VERSION);
    return 0;
}
