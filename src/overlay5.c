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
#include "overlay5.h"

// Section and region for low memory area overlay
#pragma overlay(vdcseovl5, 6)
#pragma section(codeovl5, 0)
#pragma section(dataovl5, 0)
#pragma section(bssovl5, 0)
#pragma region(ovl5, OVERLAYLOAD, 0xC000, , 6, { codeovl5, dataovl5, bssovl5  } )

#pragma code(codeovl5)
#pragma data(dataovl5)
#pragma bss(bssovl5)

char importread(char device, const char *filename)
// Import screen data into the screen map
{
    char error = 0;
    char status = 0;
    char line;
    unsigned offbyte;
    char *address;
    char loadaddressbuf[1];
    char yc = 8;
    unsigned x, y;
    char attr;
    const char victovdccol[16] = {0, 15, 8, 7, 10, 4, 2, 13, 12, 12, 9, 1, 14, 5, 3, 14};

    // Set bank and name
    sprintf(linebuffer, "%s,p,r", filename);
    krnio_setbnk(0, 0);
    krnio_setnam(linebuffer);

    // Open file and return status
    status = krnio_open(1, device, 2);

    // If open is succesful, read contents
    if (status)
    {
        // Skip loadddress if asked
        if (importvars.loadaddr == 1)
        {
            vdc_prints(21, yc++, "Skipping load address.");
            krnio_read(1, loadaddressbuf, 2);
            error = krnio_status();
            if (error)
            {
                krnio_close(1);
                return error;
            }
        }

        // Read char data if selected
        if (importvars.content < 3)
        {
            address = screenmap_screenaddr(importvars.ypos, importvars.xpos, canvas.sourcewidth);
            for (line = 0; line < importvars.height; line++)
            {
                sprintf(linebuffer, "Char line %3u of %3u at address %4x", line + 1, importvars.height, address);
                vdc_prints(21, yc, linebuffer);
                bnk_io_read(1, BNK_1_FULL, address, importvars.width);
                error = krnio_status();
                if (error == KRNIO_EOF)
                {
                    error = 0;
                    importvars.content = 2;
                    line = importvars.height;
                }
                if (error)
                {
                    krnio_close(1);
                    return error;
                }
                address += canvas.sourcewidth;
            }
            yc++;
        }

        // Skip offset if needed
        if (importvars.content == 1 && importvars.offset > 0)
        {
            if (krnio_chkin(1))
            {
                for (offbyte = 0; offbyte < importvars.offset; offbyte++)
                {
                    sprintf(linebuffer, "Skipping offset byte %u of %u", offbyte + 1, importvars.offset);
                    vdc_prints(21, yc, linebuffer);
                    krnio_chrin();
                    error = krnio_status();
                    if (error == KRNIO_EOF)
                    {
                        error = 0;
                        importvars.content = 2;
                        offbyte = importvars.offset;
                    }
                    if (error)
                    {
                        krnio_close(1);
                        return error;
                    }
                }
                krnio_clrchn();
                yc++;
            }
            else
            {
                krnio_close(1);
                return 1;
            }
        }

        // Read color data if selected
        if (importvars.content == 1 || importvars.content == 3)
        {
            address = screenmap_attraddr(importvars.ypos, importvars.xpos, canvas.sourcewidth, canvas.sourceheight);
            for (line = 0; line < importvars.height; line++)
            {
                sprintf(linebuffer, "Color line %3u of %3u at address %4x", line + 1, importvars.height, address);
                vdc_prints(21, yc, linebuffer);
                bnk_io_read(1, BNK_1_FULL, address, importvars.width);
                error = krnio_status();
                if (error == KRNIO_EOF)
                {
                    error = 0;
                    line = importvars.height;
                }
                if (error)
                {
                    krnio_close(1);
                    return error;
                }
                address += canvas.sourcewidth;
            }
        }

        krnio_close(1);
        yc++;

        // Convert VIC to VDC colours if selected
        if (importvars.convert == 1 || importvars.uppercase == 2)
        {

            for (y = 0; y < importvars.height; y++)
            {
                address = screenmap_attraddr(importvars.ypos + y, importvars.xpos, canvas.sourcewidth, canvas.sourceheight);
                sprintf(linebuffer, "Convert VIC color line %3u of %3u", y + 1, importvars.height, address);
                vdc_prints(21, yc, linebuffer);
                for (x = 0; x < importvars.width; x++)
                {
                    attr = bnk_readb(BNK_1_FULL, address);

                    // Convert VIC to VDC color
                    if (importvars.convert == 1)
                    {
                        attr &= 0x0f; // Wipe upper nibble to be sure in case incorrect data is fed
                        attr = victovdccol[attr];
                    }

                    // Convert to uppercase charset
                    if (importvars.uppercase == 2)
                    {
                        attr |= VDC_A_ALTCHAR;
                    }

                    bnk_writeb(BNK_1_FULL, address++, attr);
                }
            }
        }
    }

    return 0;
}

void import_prg()
// Function to import screen data
{
    if(import_dialogue(0,"Import PRG"))
    {
        // Load imprt data and check for errors
        vdc_clear(20, 8, CH_SPACE, 40, 8);
        if (importread(targetdevice, filename))
        {
            menu_fileerrormessage();
        }

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

#pragma code(code)
#pragma data(data)
#pragma bss(bss)