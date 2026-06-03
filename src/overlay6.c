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
#include <conio.h>
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
#ifdef TESTMODE
#include <oscar.h>
#endif

// Section and region for low memory area overlay
#pragma overlay(vdcseovl6, 7)
#pragma section(codeovl6, 0)
#pragma section(dataovl6, 0)
#pragma section(bssovl6, 0)
#pragma region(ovl6, OVERLAYLOAD, 0xC000, , 7, { codeovl6, dataovl6, bssovl6  } )

#pragma code(codeovl6)
#pragma data(dataovl6)
#pragma bss(bssovl6)

struct ATTRVALS
{
    char color;
    char underline;
    char blink;
    char reverse;
    char alt;
};

struct SEQSAVEDSTATE
{
    char showbar;
    char plotscreencode;
    char plotcolor;
    char plotblink;
    char plotunderline;
    char plotreverse;
    char plotaltchar;
    unsigned screencol;
    unsigned screenrow;
    char xoff;
    char yoff;
};

static const unsigned char c64_seq_color_control[16] = {0x90, 0x05, 0x1c, 0x9f, 0x9c, 0x1e, 0x1f, 0x9e, 0x81, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b};
static const unsigned char vdc_seq_color_control[16] = {0x90, 0x05, 0x1c, 0x9f, 0x9c, 0x1e, 0x1f, 0x9e, 0x81, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b};
static const unsigned char vdc_to_vic_color[16] = {0, 11, 6, 14, 5, 13, 3, 3, 2, 10, 4, 4, 8, 7, 15, 1};
static volatile unsigned char seq_escapepending;
static volatile unsigned char seq_rawcharpending;
#define SEQ_VDC_ESC_UNDERLINE_ON 0x49
#define SEQ_VDC_ESC_UNDERLINE_OFF 0x4a
#define SEQ_VDC_ESC_BLINK_ON 0x4f
#define SEQ_VDC_ESC_BLINK_OFF 0x50
#define SEQ_VDC_ESC_RAW 0x56

static void seq_normalize_cell(unsigned char *screencode, unsigned char *attr);

void rebase()
// Rebase viewport pos based on import coords
{
    char oldxoff = canvas.sourcexoffset;
    char oldyoff = canvas.sourceyoffset;

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

    if (oldxoff != canvas.sourcexoffset || oldyoff != canvas.sourceyoffset)
    {
        vdcwin_cpy_viewport(&canvas);
    }
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
        if (importvars.xc < (importvars.width - 1))
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
            if (importvars.yc < (importvars.height - 1))
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
        if (importvars.yc < (importvars.height - 1))
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

static void seqimport_save_state(struct SEQSAVEDSTATE *savedstate)
{
    savedstate->showbar = showbar;
    savedstate->plotscreencode = plotscreencode;
    savedstate->plotcolor = plotcolor;
    savedstate->plotblink = plotblink;
    savedstate->plotunderline = plotunderline;
    savedstate->plotreverse = plotreverse;
    savedstate->plotaltchar = plotaltchar;
    savedstate->screencol = screen_col;
    savedstate->screenrow = screen_row;
    savedstate->xoff = canvas.sourcexoffset;
    savedstate->yoff = canvas.sourceyoffset;
}

static void seqimport_restore_state(const struct SEQSAVEDSTATE *savedstate)
{
    showbar = savedstate->showbar;
    plotscreencode = savedstate->plotscreencode;
    plotcolor = savedstate->plotcolor;
    plotblink = savedstate->plotblink;
    plotunderline = savedstate->plotunderline;
    plotreverse = savedstate->plotreverse;
    plotaltchar = savedstate->plotaltchar;
    screen_col = savedstate->screencol;
    screen_row = savedstate->screenrow;
    canvas.sourcexoffset = savedstate->xoff;
    canvas.sourceyoffset = savedstate->yoff;
}

static void seqimport_plot_byte(unsigned char screencode)
{
    plotscreencode = screencode;
    screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
    vdc_printc(screen_col, screen_row, bnk_readb(BNK_1_FULL, screenmap_screenaddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth, canvas.sourceheight)));
    seqimport_move(0, 1, 0, 0);
}

static void seqimport_clear_region(void)
{
    unsigned y;

    for (y = 0; y < importvars.height; ++y)
    {
        bnk_memset(BNK_1_FULL, screenmap_screenaddr(importvars.ypos + y, importvars.xpos, canvas.sourcewidth), CH_SPACE, importvars.width);
        bnk_memset(BNK_1_FULL, screenmap_attraddr(importvars.ypos + y, importvars.xpos, canvas.sourcewidth, canvas.sourceheight), VDC_WHITE, importvars.width);
    }
}

static void seqimport_plot_raw_vdc_byte(unsigned char screencode)
{
    plotscreencode = screencode;
    screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, plotscreencode, VDC_Attribute(plotcolor, plotblink, plotunderline, plotreverse, plotaltchar));
    vdc_printc(screen_col, screen_row, bnk_readb(BNK_1_FULL, screenmap_screenaddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth)), bnk_readb(BNK_1_FULL, screenmap_attraddr(canvas.sourceyoffset + screen_row, canvas.sourcexoffset + screen_col, canvas.sourcewidth, canvas.sourceheight)));
    seqimport_move(0, 1, 0, 0);
}

static char seq_decode_printable(unsigned char ch, unsigned char *screencode)
{
    if ((ch >= 0x20) && (ch < 0x40))
    {
        *screencode = ch;
        return 1;
    }
    if ((ch >= 0x40) && (ch <= 0x5f))
    {
        *screencode = ch - 0x40;
        return 1;
    }
    if ((ch >= 0x60) && (ch <= 0x7f))
    {
        *screencode = ch - 0x20;
        return 1;
    }
    if ((ch >= 0xa0) && (ch <= 0xbf))
    {
        *screencode = ch - 0x40;
        return 1;
    }
    if ((ch >= 0xc0) && (ch <= 0xfe))
    {
        *screencode = ch - 0x80;
        return 1;
    }
    if (ch == 0xff)
    {
        *screencode = 0x5e;
        return 1;
    }

    return 0;
}

static char decode_c64_seq_color(unsigned char ch)
{
    switch (ch)
    {
    case 0x05:
        plotcolor = VDC_WHITE;
        return 1;
    case 0x1c:
        plotcolor = VDC_DRED;
        return 1;
    case 0x1e:
        plotcolor = VDC_DGREEN;
        return 1;
    case 0x1f:
        plotcolor = VDC_DBLUE;
        return 1;
    case 0x81:
        plotcolor = (importvars.convert != 1) ? VDC_DPURPLE : VDC_DYELLOW;
        return 1;
    case 0x90:
        plotcolor = VDC_BLACK;
        return 1;
    case 0x95:
        plotcolor = VDC_DYELLOW;
        return 1;
    case 0x96:
        plotcolor = VDC_LRED;
        return 1;
    case 0x97:
        plotcolor = (importvars.convert != 1) ? VDC_DCYAN : VDC_DGREY;
        return 1;
    case 0x98:
        plotcolor = (importvars.convert != 1) ? VDC_DGREY : VDC_LGREY;
        return 1;
    case 0x99:
        plotcolor = VDC_LGREEN;
        return 1;
    case 0x9a:
        plotcolor = VDC_LBLUE;
        return 1;
    case 0x9b:
        plotcolor = VDC_LGREY;
        return 1;
    case 0x9c:
        plotcolor = (importvars.convert != 1) ? VDC_LPURPLE : VDC_DPURPLE;
        return 1;
    case 0x9e:
        plotcolor = VDC_LYELLOW;
        return 1;
    case 0x9f:
        plotcolor = VDC_LCYAN;
        return 1;
    default:
        return 0;
    }
}

static char decode_vdc_seq_color(unsigned char ch)
{
    unsigned idx;

    for (idx = 0; idx < sizeof(vdc_to_vic_color); ++idx)
    {
        if (vdc_seq_color_control[idx] == ch)
        {
            plotcolor = idx;
            return 1;
        }
    }

    return 0;
}

static void seqimport_reset_decode_state(void)
{
    seq_escapepending = 0;
    seq_rawcharpending = 0;
}

static void decode_seq_byte(unsigned char ch, char seqmode)
{
    unsigned char screencode;

    if (seqmode == SEQ_MODE_VDC && seq_rawcharpending)
    {
        seq_rawcharpending = 0;
        seqimport_plot_raw_vdc_byte(ch);
        return;
    }

    if (seqmode == SEQ_MODE_VDC && seq_escapepending)
    {
        seq_escapepending = 0;
        switch (ch)
        {
        case SEQ_VDC_ESC_UNDERLINE_ON:
            plotunderline = 1;
            return;
        case SEQ_VDC_ESC_UNDERLINE_OFF:
            plotunderline = 0;
            return;
        case SEQ_VDC_ESC_BLINK_ON:
            plotblink = 1;
            return;
        case SEQ_VDC_ESC_BLINK_OFF:
            plotblink = 0;
            return;
        case SEQ_VDC_ESC_RAW:
            seq_rawcharpending = 1;
            return;
        default:
            return;
        }
    }

    if ((seqmode == SEQ_MODE_C64 && decode_c64_seq_color(ch)) || (seqmode == SEQ_MODE_VDC && decode_vdc_seq_color(ch)))
    {
        return;
    }

    switch (ch)
    {
    case 0x02:
        plotunderline = 1;
        break;
    case 0x0a:
    case 0x0d:
    case 0x8d:
        importvars.xc = 0;
        if (importvars.yc < (importvars.height - 1))
        {
            importvars.yc++;
        }
        rebase();
        break;
    case 0x0e:
        plotaltchar = 1;
        break;
    case 0x0f:
        plotblink = 1;
        break;
    case 0x11:
        seqimport_move(0, 0, 0, 1);
        break;
    case 0x12:
        plotreverse = 1;
        break;
    case 0x13:
        importvars.xc = 0;
        importvars.yc = 0;
        rebase();
        break;
    case 0x14:
        seqimport_move(1, 0, 0, 0);
        screenmapplot(screen_row + canvas.sourceyoffset, screen_col + canvas.sourcexoffset, CH_SPACE, VDC_WHITE);
        break;
    case 0x1b:
        if (seqmode == SEQ_MODE_VDC)
        {
            seq_escapepending = 1;
        }
        break;
    case 0x1d:
        seqimport_move(0, 1, 0, 0);
        break;
    case 0x82:
        plotunderline = 0;
        break;
    case 0x8e:
        plotaltchar = 0;
        break;
    case 0x8f:
        plotblink = 0;
        break;
    case 0x91:
        seqimport_move(0, 0, 1, 0);
        break;
    case 0x92:
        plotreverse = 0;
        break;
    case 0x93:
        if (importvars.cls != 1)
        {
            seqimport_clear_region();
        }
        importvars.xc = 0;
        importvars.yc = 0;
        rebase();
        break;
    case 0x9d:
        seqimport_move(1, 0, 0, 0);
        break;
    default:
        if (seq_decode_printable(ch, &screencode))
        {
            seqimport_plot_byte(screencode);
        }
        break;
    }
}

static void import_seq_mode(char seqmode, const char *title)
{
    char error = 0;
    char status = 0;
    unsigned char ch;
    struct SEQSAVEDSTATE savedstate;

    if (import_dialogue((seqmode == SEQ_MODE_C64) ? IMPORT_DIALOGUE_SEQ_C64 : IMPORT_DIALOGUE_SEQ_VDC, title))
    {
        seqimport_save_state(&savedstate);
        showbar = 0;

        // Create undo option
        if (undoenabled == 1)
        {
            undo_new(importvars.ypos, importvars.xpos, importvars.width, importvars.height);
        }

        // Exit pop up window
        vdcwin_win_free();

        // Exit menu bar
        vdcwin_win_free();

        // Hide status bar
        hidestatusbar();

        // Set default plot values
        plotscreencode = CH_SPACE;
        plotreverse = 0;
        plotaltchar = (seqmode == SEQ_MODE_VDC || importvars.uppercase == 1) ? 0 : 1;
        plotblink = 0;
        plotcolor = VDC_WHITE;
        plotunderline = 0;
        seqimport_reset_decode_state();
        rebase();

        // Set bank and name
        sprintf(linebuffer, "%s,s,r", filename);
        krnio_setbnk(0, 0);
        krnio_setnam(linebuffer);

        // Open file and return status
        status = krnio_open(1, targetdevice, 2);

        // If open is succesful, read contents
        if (status)
        {
            do
            {
                error = krnio_read(1, buffer, 64);
                ch = krnio_status();
                if (error)
                {
                    for (unsigned i = 0; i < error; ++i)
                    {
                        decode_seq_byte((unsigned char)buffer[i], seqmode);
                    }
                }
            } while (ch == KRNIO_OK);

            // Close file
            krnio_close(1);

            // Show error message if error is not end of file
            if (ch != KRNIO_EOF)
            {
                menu_fileerrormessage();
            }
        }

        seqimport_reset_decode_state();

        // Restore menu and statusbbars
        seqimport_restore_state(&savedstate);

        // Show new viewport data
        placesignature();
        vdcwin_cpy_viewport(&canvas);

        vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
        menu_placebar(0);
        if (showbar)
        {
            initstatusbar();
        }
    }
}

static unsigned char seq_map_screencode_to_petscii(unsigned char screencode)
{
    if (screencode <= 0x1f)
    {
        return screencode + 0x40;
    }
    if (screencode >= 0x40 && screencode <= 0x5d)
    {
        return screencode + 0x80;
    }
    if (screencode == 0x5e)
    {
        return 0xff;
    }
    if (screencode == 0x5f || screencode == 0x95)
    {
        return 0xdf;
    }
    if (screencode >= 0x60 && screencode <= 0x7f)
    {
        return screencode + 0x40;
    }
    if (screencode >= 0x80 && screencode <= 0xbf)
    {
        return screencode - 0x80;
    }
    if (screencode >= 0xc0)
    {
        return screencode - 0x40;
    }

    return screencode;
}

static char seq_is_color_control_byte(unsigned char byte)
{
    unsigned idx;

    for (idx = 0; idx < sizeof(c64_seq_color_control); ++idx)
    {
        if (c64_seq_color_control[idx] == byte)
        {
            return 1;
        }
    }

    return 0;
}

static char seq_is_structural_control_byte(unsigned char byte)
{
    switch (byte)
    {
    case 0x02:
    case 0x07:
    case 0x0d:
    case 0x0e:
    case 0x0f:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x14:
    case 0x1b:
    case 0x1d:
    case 0x82:
    case 0x8d:
    case 0x8e:
    case 0x8f:
    case 0x91:
    case 0x92:
    case 0x93:
    case 0x9d:
        return 1;
    default:
        return 0;
    }
}

static char seq_can_write_vdc_code_direct(unsigned char screencode)
{
    unsigned char seqbyte = seq_map_screencode_to_petscii(screencode);
    unsigned char decoded;

    if (seq_is_color_control_byte(seqbyte) || seq_is_structural_control_byte(seqbyte))
    {
        return 0;
    }

    return seq_decode_printable(seqbyte, &decoded) && decoded == screencode;
}

static char seq_write_byte(unsigned char byte)
{
    krnio_chrout(byte);
    return krnio_status();
}

static char seq_emit_toggle(char enable, unsigned char onbyte, unsigned char offbyte)
{
    return seq_write_byte(enable ? onbyte : offbyte);
}

static char seq_emit_vdc_escape(unsigned char command)
{
    char error = seq_write_byte(CH_ESC);
    if (error)
    {
        return error;
    }

    return seq_write_byte(command);
}

static char seq_emit_attributes(struct ATTRVALS *attr_present, unsigned char attr, char seqmode, char firstcell)
{
    char error;
    struct ATTRVALS attr_new;

    attr_new.color = attr & 0x0f;
    attr_new.alt = attr & VDC_A_ALTCHAR;
    attr_new.blink = attr & VDC_A_BLINK;
    attr_new.reverse = attr & VDC_A_REVERSE;
    attr_new.underline = attr & VDC_A_UNDERLINE;

    if (firstcell)
    {
        error = seq_write_byte(CH_CLEAR);
        if (error)
        {
            return error;
        }
    }

    if (firstcell || attr_new.color != attr_present->color)
    {
        attr_present->color = attr_new.color;
        error = seq_write_byte((seqmode == SEQ_MODE_VDC) ? vdc_seq_color_control[(unsigned char)attr_present->color] : c64_seq_color_control[vdc_to_vic_color[(unsigned char)attr_present->color]]);
        if (error)
        {
            return error;
        }
    }

    if (firstcell || attr_new.alt != attr_present->alt)
    {
        attr_present->alt = attr_new.alt;
        error = seq_emit_toggle(attr_present->alt, 0x0e, 0x8e);
        if (error)
        {
            return error;
        }
    }

    if (seqmode == SEQ_MODE_VDC)
    {
        if (firstcell || attr_new.underline != attr_present->underline)
        {
            attr_present->underline = attr_new.underline;
            error = seq_emit_vdc_escape(attr_present->underline ? SEQ_VDC_ESC_UNDERLINE_ON : SEQ_VDC_ESC_UNDERLINE_OFF);
            if (error)
            {
                return error;
            }
        }

        if (firstcell || attr_new.blink != attr_present->blink)
        {
            attr_present->blink = attr_new.blink;
            error = seq_emit_vdc_escape(attr_present->blink ? SEQ_VDC_ESC_BLINK_ON : SEQ_VDC_ESC_BLINK_OFF);
            if (error)
            {
                return error;
            }
        }
    }

    if (firstcell || attr_new.reverse != attr_present->reverse)
    {
        attr_present->reverse = attr_new.reverse;
        error = seq_emit_toggle(attr_present->reverse, 0x12, 0x92);
        if (error)
        {
            return error;
        }
    }

    *attr_present = attr_new;
    return 0;
}

static void seq_normalize_cell(unsigned char *screencode, unsigned char *attr)
{
    if (*screencode > 0x7f)
    {
        *screencode -= 0x80;
        *attr ^= VDC_A_REVERSE;
    }
}

static char seq_emit_char(unsigned char screencode, unsigned char attr, char seqmode)
{
    char error;

    if (seqmode == SEQ_MODE_VDC)
    {
        if (seq_can_write_vdc_code_direct(screencode))
        {
            return seq_write_byte(seq_map_screencode_to_petscii(screencode));
        }

        error = seq_emit_vdc_escape(SEQ_VDC_ESC_RAW);
        if (error)
        {
            return error;
        }
        return seq_write_byte(screencode);
    }

    return seq_write_byte(seq_map_screencode_to_petscii(screencode));
}

static char seq_emit_rowbreak(char reverse)
{
    return seq_write_byte(reverse ? 0x0d : 0x8d);
}

static void export_seq_mode(char seqmode)
{
    char error = 0;
    char status = 0;
    unsigned char overwrite;
    unsigned char screencode;
    unsigned char attr;
    unsigned escapeflag, x, y;
    struct ATTRVALS attr_present = {0};

    escapeflag = chooseidandfilename("Save screen", 15);

    if (escapeflag == -1)
    {
        vdcwin_win_free();
        return;
    }

    overwrite = checkiffileexists(filename, targetdevice);

    if (overwrite)
    {
        // Scratch old file
        if (overwrite == 2)
        {
            sprintf(buffer, "s:%s", filename);
            cmd(targetdevice, buffer);
        }

        // Set bank and name
        sprintf(linebuffer, "%s,s,w", filename);
        krnio_setbnk(0, 0);
        krnio_setnam(linebuffer);

        // Open file and return status
        status = krnio_open(1, targetdevice, 2);

        // If open is succesful, read contents
        if (status)
        {
            vdc_prints(21, 13, "Exporting data to disk.");

            // Open file for inout
            if (krnio_chkout(1))
            {
                // Read chars until EOF or error
                for (y = 0; y < canvas.sourceheight; y++)
                {
                    for (x = 0; x < canvas.sourcewidth; x++)
                    {
                        // Obtain screen code and attribute for coordinate
                        screencode = bnk_readb(BNK_1_FULL, screenmap_screenaddr(y, x, canvas.sourcewidth));
                        attr = bnk_readb(BNK_1_FULL, screenmap_attraddr(y, x, canvas.sourcewidth, canvas.sourceheight));
                        if (seqmode == SEQ_MODE_C64)
                        {
                            seq_normalize_cell(&screencode, &attr);
                        }

                        error = seq_emit_attributes(&attr_present, attr, seqmode, x == 0 && y == 0);
                        if (error)
                        {
                            krnio_clrchn();
                            krnio_close(1);
                            menu_fileerrormessage();
                            return;
                        }

                        error = seq_emit_char(screencode, attr, seqmode);
                        if (error)
                        {
                            krnio_clrchn();
                            krnio_close(1);
                            menu_fileerrormessage();
                            return;
                        }
                    }

                    if (seqmode == SEQ_MODE_C64 && y < canvas.sourceheight - 1)
                    {
                        error = seq_emit_rowbreak(attr_present.reverse);
                        if (error)
                        {
                            krnio_clrchn();
                            krnio_close(1);
                            menu_fileerrormessage();
                            return;
                        }
                    }
                }

                // Close file
                krnio_clrchn();
                krnio_close(1);

                // Show error message if error is not end of file
                if (error)
                {
                    menu_fileerrormessage();
                }
            }
            else
            {
                krnio_close(1);
                menu_fileerrormessage();
            }
        }
    }

    vdcwin_win_free();
}

void import_seq_c64()
{
    import_seq_mode(SEQ_MODE_C64, "Import C64 SEQ");
    // TEST_HOOK: import_seq_c64_complete — screen map populated at SCREENMAPBASE (Bank 1)
#ifdef TESTMODE
    // Increment the test-completion counter at $03FA (page-3 free area).
    // Python polls this byte (disconnected from monitor so keyboard works).
    (*((volatile unsigned char *)0x03FA))++;
    breakpoint();
#endif
}

void import_seq_vdc()
{
    import_seq_mode(SEQ_MODE_VDC, "Import VDC SEQ");
    // TEST_HOOK: import_seq_vdc_complete — screen map populated at SCREENMAPBASE (Bank 1)
#ifdef TESTMODE
    (*((volatile unsigned char *)0x03FA))++;
    breakpoint();
#endif
}

void export_seq_c64()
{
    export_seq_mode(SEQ_MODE_C64);
    // TEST_HOOK: export_seq_c64_complete — SEQ file written to disk
#ifdef TESTMODE
    (*((volatile unsigned char *)0x03FA))++;
    breakpoint();
#endif
}

void export_seq_vdc()
{
    export_seq_mode(SEQ_MODE_VDC);
    // TEST_HOOK: export_seq_vdc_complete — SEQ file written to disk
#ifdef TESTMODE
    (*((volatile unsigned char *)0x03FA))++;
    breakpoint();
#endif
}
// FUTURE_TEST_HOOK: inside import_seq_mode after each row written — for partial-import tests

#pragma code(code)
#pragma data(data)
#pragma bss(bss)