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

char importread(char device, const char *filename, unsigned xpos, unsigned ypos, unsigned width, unsigned height, unsigned offset, char content, char convert, char uppercase, char loadaddr)
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
        if (loadaddr == 1)
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
        if (content < 3)
        {
            address = screenmap_screenaddr(ypos, xpos, canvas.sourcewidth);
            for (line = 0; line < height; line++)
            {
                sprintf(linebuffer, "Char line %3u of %3u at address %4x", line + 1, height, address);
                vdc_prints(21, yc, linebuffer);
                bnk_io_read(1, BNK_1_FULL, address, width);
                error = krnio_status();
                if (error == KRNIO_EOF)
                {
                    error = 0;
                    content = 2;
                    line = height;
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
        if (content == 1 && offset > 0)
        {
            if (krnio_chkin(1))
            {
                for (offbyte = 0; offbyte < offset; offbyte++)
                {
                    sprintf(linebuffer, "Skipping offset byte %u of %u", offbyte + 1, offset);
                    vdc_prints(21, yc, linebuffer);
                    krnio_chrin();
                    error = krnio_status();
                    if (error == KRNIO_EOF)
                    {
                        error = 0;
                        content = 2;
                        offbyte = offset;
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
        if (content == 1 || content == 3)
        {
            address = screenmap_attraddr(ypos, xpos, canvas.sourcewidth, canvas.sourceheight);
            for (line = 0; line < height; line++)
            {
                sprintf(linebuffer, "Color line %3u of %3u at address %4x", line + 1, height, address);
                vdc_prints(21, yc, linebuffer);
                bnk_io_read(1, BNK_1_FULL, address, width);
                error = krnio_status();
                if (error == KRNIO_EOF)
                {
                    error = 0;
                    line = height;
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
        if (convert == 1 || uppercase == 2)
        {

            for (y = 0; y < height; y++)
            {
                address = screenmap_attraddr(ypos + y, xpos, canvas.sourcewidth, canvas.sourceheight);
                sprintf(linebuffer, "Convert VIC color line %3u of %3u", y + 1, height, address);
                vdc_prints(21, yc, linebuffer);
                for (x = 0; x < width; x++)
                {
                    attr = bnk_readb(BNK_1_FULL, address);

                    // Convert VIC to VDC color
                    if (convert == 1)
                    {
                        attr &= 0x0f; // Wipe upper nibble to be sure in case incorrect data is fed
                        attr = victovdccol[attr];
                    }

                    // Convert to uppercase charset
                    if (uppercase == 2)
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

void import()
// Function to import screen data
{
    unsigned importwidth, importheight;
    unsigned newwidth, newheight, y;
    unsigned xpos = screen_col + canvas.sourcexoffset;
    unsigned ypos = screen_row + canvas.sourceyoffset;
    unsigned maxsize = MEMORYLIMIT - SCREENMAPBASE;
    char *ptrend;
    char content = 0;
    char convert = 0;
    char loadaddr = 0;
    char uppercase = 0;
    unsigned offset = 48;

    // Pick file to import
    if (!filepicker(0))
    {
        return;
    }

    // Create popup window
    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Import");
    vdc_underline(0);

    // Ask to inout import parameters
    vdc_prints(21, 8, "Enter import width:");
    sprintf(buffer, "%u", canvas.sourcewidth);
    textInput(21, 9, buffer, 3);
    importwidth = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, 10, "Enter import height:");
    sprintf(buffer, "%u", canvas.sourceheight);
    textInput(21, 11, buffer, 3);
    importheight = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, 12, "Enter target X coord:");
    sprintf(buffer, "%u", xpos);
    textInput(21, 13, buffer, 3);
    xpos = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, 14, "Enter target Y coord:");
    sprintf(buffer, "%u", ypos);
    textInput(21, 15, buffer, 3);
    ypos = (unsigned)strtol(buffer, &ptrend, 10);

    // See if for import canvas dimensions should be enlarged and check if this fits
    newwidth = xpos + importwidth;
    newheight = ypos + importheight;

    if ((newwidth * newheight * 2) + 48 > maxsize)
    {
        vdc_prints(21, 16, "New size unsupported. Press key.");
        getch();
        vdcwin_win_free();
    }
    else
    {
        // Enlarge canvas width if needed
        if (newwidth > canvas.sourcewidth)
        {
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth);
                bnk_cpyfromvdc(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, newwidth, canvas.sourceheight), vdc_state.swap_text, canvas.sourcewidth);
                bnk_memset(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, canvas.sourcewidth, newwidth, canvas.sourceheight), VDC_WHITE, newwidth - canvas.sourcewidth);
            }
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_cpytovdc(vdc_state.swap_text, BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth), canvas.sourcewidth);
                bnk_cpyfromvdc(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, 0, newwidth), vdc_state.swap_text, canvas.sourcewidth);
                bnk_memset(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight - y - 1, canvas.sourcewidth, newwidth), CH_SPACE, newwidth - canvas.sourcewidth);
            }
            canvas.sourcewidth = newwidth;
            canvas.sourcexoffset = 0;
            updatecanvas();
        }

        // Enlarge canvas height if needed
        if (newheight > canvas.sourceheight)
        {
            for (y = 0; y < canvas.sourceheight; y++)
            {
                bnk_memcpy(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, newheight), BNK_1_FULL, screenmap_attraddr(canvas.sourceheight - y - 1, 0, canvas.sourcewidth, canvas.sourceheight), canvas.sourcewidth);
            }
            bnk_memset(BNK_1_FULL, screenmap_attraddr(canvas.sourceheight, 0, canvas.sourcewidth, newheight), VDC_WHITE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            bnk_memset(BNK_1_FULL, screenmap_screenaddr(canvas.sourceheight, 0, canvas.sourcewidth), CH_SPACE, (newheight - canvas.sourceheight) * canvas.sourcewidth);
            canvas.sourceheight = newheight;
            canvas.sourceyoffset = 0;
            updatecanvas();
        }

        // Ask for additional import parameters
        vdc_clear(20, 8, CH_SPACE, 40, 8);

        vdc_prints(21, 8, "Includes load addres at first 2 bytes?");
        loadaddr = menu_pulldown(25, 9, VDC_MENU_YESNO, 0);
        vdc_prints(21, 9, pulldown_titles[VDC_MENU_YESNO][loadaddr - 1]);

        vdc_prints(21, 10, "Import chars, color or both?");
        content = menu_pulldown(25, 11, 6, 0);
        vdc_prints(21, 11, pulldown_titles[6][content - 1]);

        if (content != 2)
        {
            vdc_prints(21, 12, "Convert VIC colours?");
            convert = menu_pulldown(25, 13, VDC_MENU_YESNO, 0);
            vdc_prints(21, 13, pulldown_titles[VDC_MENU_YESNO][convert - 1]);
        }

        if (content == 2 || convert == 1)
        {
            vdc_prints(21, 12, "Uppercase charset?   ");
            uppercase = menu_pulldown(25, 13, VDC_MENU_YESNO, 0);
            vdc_prints(25, 13, pulldown_titles[VDC_MENU_YESNO][uppercase - 1]);
        }

        if (content == 1)
        {
            vdc_prints(21, 14, "Enter offset char to color:");
            sprintf(buffer, "%u", offset);
            textInput(21, 15, buffer, 6);
            offset = strtol(buffer, &ptrend, 10);
        }

        // Load imprt data and check for errors
        vdc_clear(20, 8, CH_SPACE, 40, 8);
        if (importread(targetdevice, filename, xpos, ypos, importwidth, importheight, offset, content, convert, uppercase, loadaddr))
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