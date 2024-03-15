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
#include "overlay4.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl4, 5)
#pragma section(codeovl4, 0)
#pragma section(dataovl4, 0)
#pragma section(bssovl4, 0)
#pragma region(ovl4, OVERLAYLOAD, 0xC000, , 5, { codeovl4, dataovl4, bssovl4  } )

#pragma code(codeovl4)
#pragma data(dataovl4)
#pragma bss(bssovl4)

void chareditor()
{
    unsigned char x, y, char_altorstd, char_screencode, key;
    unsigned char xpos = 0;
    unsigned char ypos = 0;
    unsigned char char_present[8];
    unsigned char char_copy[8];
    unsigned char char_undo[8];
    unsigned char char_buffer[8];
    unsigned int char_address;
    unsigned char charchanged = 0;
    unsigned char altchanged = 0;
    char bitset;
    char *ptrend;

    char_altorstd = plotaltchar;
    char_screencode = plotscreencode;
    char_address = charaddress(char_screencode, char_altorstd, 0);
    charsetchanged[plotaltchar] = 1;
    strcpy(programmode, "Charedit");

    // Load system charset if needed in charset not edited
    if (plotaltchar == 0 && charsetchanged[1] == 1)
    {
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETSYSTEM, 256);
    }
    if (plotaltchar == 1 && charsetchanged[0] == 1)
    {
        bnk_redef_charset(vdc_state.char_std, BNK_1_FULL, (char *)CHARSETSYSTEM, 256);
    }

    for (y = 0; y < 8; y++)
    {
        char_present[y] = vdc_mem_read_at(char_address + y);
        char_undo[y] = char_present[y];
    }

    hidecursor();
    showchareditfield(char_altorstd);
    showchareditgrid(char_screencode, char_altorstd);

    do
    {
        bitset = (char_present[ypos] & (1<<(7-xpos)))?0:1;
        vdc_printc(xpos+71,ypos+3,'*'+bitset*128,vdc_state.text_attr ^ VDC_A_BLINK);
        if (showbar)
        {
            printstatusbar();
        }
        key = vdcwin_getch();
        vdc_printc(xpos+71,ypos+3,CH_SPACE+bitset*128,vdc_state.text_attr);

        switch (key)
        {
        // Movement
        case CH_CURS_RIGHT:
            if (xpos < 7)
            {
                xpos++;
            }
            break;

        case CH_CURS_LEFT:
            if (xpos > 0)
            {
                xpos--;
            }
            break;

        case CH_CURS_DOWN:
            if (ypos < 7)
            {
                ypos++;
            }
            break;

        case CH_CURS_UP:
            if (ypos > 0)
            {
                ypos--;
            }
            break;

        // Next or previous character
        case '+':
        case '-':
            if (key == '+')
            {
                char_screencode++;
            }
            else
            {
                char_screencode--;
            }
            charchanged = 1;
            break;

        // Toggle bit
        case CH_SPACE:
            char_present[ypos] ^= 1 << (7 - xpos);
            vdc_mem_write_at(char_address + ypos, char_present[ypos]);
            bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + ypos, char_present[ypos]);
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Inverse
        case 'i':
            for (y = 0; y < 8; y++)
            {
                char_present[y] ^= 0xff;
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Delete
        case CH_DEL:
            for (y = 0; y < 8; y++)
            {
                char_present[y] = 0;
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Undo
        case 'z':
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_undo[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Restore from system font
        case 's':
            for (y = 0; y < 8; y++)
            {
                char_present[y] = bnk_readb(BNK_1_FULL, (char*) CHARSETSYSTEM + y + (char_screencode * 8));
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Copy
        case 'c':
            for (y = 0; y < 8; y++)
            {
                char_copy[y] = char_present[y];
            }
            break;

        // Paste
        case 'v':
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_copy[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Switch charset
        case 'a':
            char_altorstd = (char_altorstd == 0) ? 1 : 0;
            altchanged = 1;
            break;

        // Mirror y axis
        case 'y':
            for (y = 0; y < 8; y++)
            {
                vdc_mem_write_at(char_address + y, char_present[7 - y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[7 - y]);
            }
            for (y = 0; y < 8; y++)
            {
                char_present[y] = vdc_mem_read_at(char_address + y);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Mirror x axis
        case 'x':
            for (y = 0; y < 8; y++)
            {
                char_present[y] = (char_present[y] & 0xF0) >> 4 | (char_present[y] & 0x0F) << 4;
                char_present[y] = (char_present[y] & 0xCC) >> 2 | (char_present[y] & 0x33) << 2;
                char_present[y] = (char_present[y] & 0xAA) >> 1 | (char_present[y] & 0x55) << 1;
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Rotate clockwise
        case 'o':
            for (y = 0; y < 8; y++)
            {
                for (x = 0; x < 8; x++)
                {
                    if (char_present[y] & (1 << (7 - x)))
                    {
                        char_buffer[x] |= (1 << y);
                    }
                    else
                    {
                        char_buffer[x] &= ~(1 << y);
                    }
                }
            }
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_buffer[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Scroll up
        case 'u':
            for (y = 1; y < 8; y++)
            {
                char_buffer[y - 1] = char_present[y];
            }
            char_buffer[7] = char_present[0];
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_buffer[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Scroll down
        case 'd':
            for (y = 1; y < 8; y++)
            {
                char_buffer[y] = char_present[y - 1];
            }
            char_buffer[0] = char_present[7];
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_buffer[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Scroll right
        case 'r':
            for (y = 0; y < 8; y++)
            {
                char_buffer[y] = char_present[y] >> 1;
                if (char_present[y] & 0x01)
                {
                    char_buffer[y] += 0x80;
                }
            }
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_buffer[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Scroll left
        case 'l':
            for (y = 0; y < 8; y++)
            {
                char_buffer[y] = char_present[y] << 1;
                if (char_present[y] & 0x80)
                {
                    char_buffer[y] += 0x01;
                }
            }
            for (y = 0; y < 8; y++)
            {
                char_present[y] = char_buffer[y];
                vdc_mem_write_at(char_address + y, char_present[y]);
                bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + y, char_present[y]);
            }
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Hex edit
        case 'h':
            sprintf(buffer, "%2X", char_present[ypos]);
            textInput(68, ypos + 3, buffer, 2, 1);
            char_present[ypos] = (unsigned char)strtol(buffer, &ptrend, 16);
            vdc_mem_write_at(char_address + ypos, char_present[ypos]);
            bnk_writeb(BNK_1_FULL, (char*) charaddress(char_screencode, char_altorstd, 1) + ypos, char_present[ypos]);
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Toggle statusbar
        case CH_F6:
            vdcwin_win_free();
            togglestatusbar();
            showchareditfield(char_altorstd);
            showchareditgrid(char_screencode, char_altorstd);
            break;

        // Help screen
        case CH_F8:
            vdcwin_win_free();
            helpscreen_load(2);
            if (plotaltchar == 0 && charsetchanged[1] == 1)
            {
                bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char*) CHARSETALTERNATE, 256);
            }
            showchareditfield(char_altorstd);
            showchareditgrid(char_screencode, char_altorstd);
            break;

        default:
            // 0-9: Favourites select
            if (key > 47 && key < 58)
            {
                char_screencode = favourites[key - 48][0];
                char_altorstd = favourites[key - 48][1];
                charchanged = 1;
                altchanged = 1;
            }
            // Shift 1-9 or *: Store present character in favourites slot
            if (key > 32 && key < 43)
            {
                favourites[key - 33][0] = char_screencode;
                favourites[key - 33][1] = char_altorstd;
            }
            break;
        }

        if (charchanged || altchanged)
        {
            if (charchanged)
            {
                charchanged = 0;
                char_address = charaddress(char_screencode, char_altorstd, 0);
                for (y = 0; y < 8; y++)
                {
                    char_present[y] = vdc_mem_read_at(char_address + y);
                    char_undo[y] = char_present[y];
                }
            }
            if (altchanged)
            {
                altchanged = 0;
                if (char_altorstd == 0)
                {
                    bnk_redef_charset(vdc_state.char_std,BNK_1_FULL, (char*) CHARSETNORMAL, 256);
                    bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL, (char*) CHARSETSYSTEM, 256);
                }
                else
                {
                    bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL, (char*) CHARSETALTERNATE, 256);
                    bnk_redef_charset(vdc_state.char_std,BNK_1_FULL, (char*) CHARSETSYSTEM, 256);
                }
                charsetchanged[char_altorstd] = 1;
                vdcwin_win_free();
                showchareditfield(char_altorstd);
            }
            showchareditgrid(char_screencode, char_altorstd);
        }
    } while (key != CH_ESC && key != CH_STOP);

    vdcwin_win_free();

    if (char_altorstd == 0)
    {
        bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL, (char*) CHARSETALTERNATE, 256);
    }
    else
    {
        bnk_redef_charset(vdc_state.char_std,BNK_1_FULL, (char*) CHARSETNORMAL, 256);
    }

    plotscreencode = char_screencode;
    plotaltchar = char_altorstd;
    resetcursor();
    strcpy(programmode, "Main");
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