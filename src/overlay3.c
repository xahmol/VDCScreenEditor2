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
#pragma region(ovl3, OVERLAYLOAD, 0xC000, , 4, { codeovl3, dataovl3,bssovl3 } )

#pragma code(codeovl3)
#pragma data(dataovl3)
#pragma bss(bssovl3)

char choosedeviceid(char ypos)
// Choose device ID dialogue
{
    char key;

    vdc_prints(21, ypos, "Choose drive ID:");
    vdc_prints(21, ypos + 2, "Change with + / - key, RET to select.");
    vdc_state.text_attr = mc_pd_select;

    do
    {
        sprintf(linebuffer, "%2u", targetdevice);
        vdc_prints(21, ypos + 1, linebuffer);

        key = vdcwin_getch();

        switch (key)
        {
        case '+':
            if (++targetdevice > MAXDEVID)
            {
                targetdevice = 8;
            }
            while (!bnk_iec_active(targetdevice))
            {
                if (++targetdevice > MAXDEVID)
                {
                    targetdevice = 8;
                }
            }
            break;

        case '-':
            if (--targetdevice < 8)
            {
                targetdevice = MAXDEVID;
            }
            while (!bnk_iec_active(targetdevice))
            {
                if (--targetdevice < 8)
                {
                    targetdevice = MAXDEVID;
                }
            }
            break;

        default:
            break;
        }

    } while (key != CH_ENTER && key != CH_STOP && key != CH_ESC);

    vdc_state.text_attr = mc_menupopup;
    vdc_prints(21, ypos + 1, linebuffer);
    vdc_clear(20, ypos + 2, CH_SPACE, 40, 1);
    if (key == CH_ESC || key == CH_STOP)
    {
        return 0;
    }
    return 1;
}

signed chooseidandfilename(const char *headertext, char maxlen)
// Function to present dialogue to enter device id and filename
// Input: Headertext to print, maximum length of filename input string
{
    int valid = 0;
    char *ptrend;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, headertext);
    vdc_underline(0);

    if (!choosedeviceid(8))
    {
        return -1;
    }

    vdc_prints(21, 10, "Choose filename:");
    return textInput(21, 11, filename, maxlen);
}

char checkiffileexists(char *filetocheck, unsigned char id)
{
    // Check if file exists and, if yes, ask confirmation of overwrite

    unsigned char proceed = 1;
    unsigned char yesno;
    unsigned char error;

    sprintf(buffer, "r0:%s=%s", filetocheck, filetocheck);
    error = cmd(id, buffer);

    if (error == 63)
    {
        yesno = menu_areyousure("File exists.");
        if (yesno == 2)
        {
            proceed = 0;
        }
        else
        {
            proceed = 2;
        }
    }
    else
    {
        if (error && error != 62)
        {
            menu_fileerrormessage();
            proceed = 0;
        }
    }

    return proceed;
}

void loadscreenmap()
{
    // Function to load screenmap

    unsigned lastreadaddress, newwidth, newheight;
    unsigned maxsize = MEMORYLIMIT - SCREENMAPBASE;
    char *ptrend;

    if (!filepicker(0))
    {
        return;
    }

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 20, 5, 40, 12);

    vdc_underline(1);
    vdc_prints(21, 6, "Load screen");
    vdc_underline(0);

    vdc_prints(21, 8, "Enter screen width:");
    sprintf(buffer, "%u", canvas.sourcewidth);
    textInput(21, 9, buffer, 3);
    newwidth = (unsigned)strtol(buffer, &ptrend, 10);

    vdc_prints(21, 10, "Enter screen height:");
    sprintf(buffer, "%u", canvas.sourceheight);
    textInput(21, 11, buffer, 3);
    newheight = (unsigned)strtol(buffer, &ptrend, 10);

    if ((newwidth * newheight * 2) + 48 > maxsize)
    {
        vdc_prints(21, 12, "New size unsupported. Press key.");
        getch();
        vdcwin_win_free();
    }
    else
    {
        vdcwin_win_free();

        if (bnk_load(targetdevice, 1, (char *)SCREENMAPBASE, filename))
        {
            vdcwin_win_free();
            updatecanvas();
            placesignature();

            vdcwin_cpy_viewport(&canvas);
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
}

void savescreenmap()
{
    // Function to save screenmap

    char overwrite;
    unsigned escapeflag;

    escapeflag = chooseidandfilename("Save screen", 15);

    vdcwin_win_free();

    if (escapeflag == -1)
    {
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

        if (!bnk_save(targetdevice, 1, (char *)SCREENMAPBASE, (char *)SCREENMAPBASE + (screentotal * 2) + 48, filename))
        {
            menu_fileerrormessage();
        }
    }
}

void saveproject()
{
    // Function to save project (screen, charsets and metadata)

    char overwrite;
    char projbuffer[23];
    char tempfilename[21];
    int escapeflag;

    escapeflag = chooseidandfilename("Save project", 10);

    vdcwin_win_free();
    memset(projbuffer, 0, 23);

    if (escapeflag == -1)
    {
        return;
    }

    sprintf(tempfilename, "%s.proj", filename);

    overwrite = checkiffileexists(tempfilename, targetdevice);

    if (overwrite)
    {
        // Scratch old files
        if (overwrite == 2)
        {
            sprintf(buffer, "s:%s.proj", filename);
            cmd(targetdevice, buffer);
            sprintf(buffer, "s:%s.scrn", filename);
            cmd(targetdevice, buffer);
            sprintf(buffer, "s:%s.chrs", filename);
            cmd(targetdevice, buffer);
            sprintf(buffer, "s:%s.chra", filename);
            cmd(targetdevice, buffer);
        }

        // Store project data to buffer variable
        projbuffer[0] = charsetchanged[0];
        projbuffer[1] = charsetchanged[1];
        projbuffer[2] = screen_col;
        projbuffer[3] = screen_row;
        projbuffer[4] = (canvas.sourcewidth >> 8) & 0xff;
        projbuffer[5] = canvas.sourcewidth & 0xff;
        projbuffer[6] = (canvas.sourceheight >> 8) & 0xff;
        projbuffer[7] = canvas.sourceheight & 0xff;
        projbuffer[8] = (screentotal >> 8) & 0xff;
        projbuffer[9] = screentotal & 0xff;
        projbuffer[10] = screenbackground;
        projbuffer[11] = mc_mb_normal;
        projbuffer[12] = mc_mb_select;
        projbuffer[13] = mc_pd_normal;
        projbuffer[14] = mc_pd_select;
        projbuffer[15] = mc_menupopup;
        projbuffer[16] = plotscreencode;
        projbuffer[17] = plotcolor;
        projbuffer[18] = plotreverse;
        projbuffer[19] = plotunderline;
        projbuffer[20] = plotblink;
        projbuffer[21] = plotaltchar;
        projbuffer[22] = vdc_state.mode;

        // Store project file
        sprintf(buffer, "%s.proj", filename);
        if (!bnk_save(targetdevice, 0, projbuffer, projbuffer + 23, buffer))
        {
            menu_fileerrormessage();
        }

        // Store screen data
        sprintf(buffer, "%s.scrn", filename);
        if (!bnk_save(targetdevice, 1, (char *)SCREENMAPBASE, (char *)SCREENMAPBASE + (screentotal * 2) + 48, buffer))
        {
            menu_fileerrormessage();
        }

        // Store standard charset
        if (charsetchanged[0] == 1)
        {
            sprintf(buffer, "%s.chrs", filename);
            if (!bnk_save(targetdevice, 1, (char *)CHARSETNORMAL, (char *)CHARSETNORMAL + 2048, buffer))
            {
                menu_fileerrormessage();
            }
        }

        // Store alternate charset
        if (charsetchanged[1] == 1)
        {
            sprintf(buffer, "%s.chra", filename);
            if (!bnk_save(targetdevice, 1, (char *)CHARSETALTERNATE, (char *)CHARSETALTERNATE + 2048, buffer))
            {
                menu_fileerrormessage();
            }
        }
    }
}

void loadproject()
{
    // Function to load project (screen, charsets and metadata)
    char projbuffer[23];
    memset(projbuffer, 0, 23);

    if (!filepicker(1))
    {
        return;
    }

    // Strip .proj extension
    filename[strlen(filename) - 5] = 0;

    // Load project variables
    sprintf(buffer, "%s.proj", filename);
    if (!bnk_load(targetdevice, 0, projbuffer, buffer))
    {
        return;
    }

    charsetchanged[0] = projbuffer[0];
    charsetchanged[1] = projbuffer[1];
    screen_col = projbuffer[2];
    screen_row = projbuffer[3];
    canvas.sourcewidth = projbuffer[4] * 256 + projbuffer[5];
    canvas.sourceheight = projbuffer[6] * 256 + projbuffer[7];
    screentotal = projbuffer[8] * 256 + projbuffer[9];
    screenbackground = projbuffer[10];
    vdc_bgcolor(screenbackground);
    mc_mb_normal = projbuffer[11];
    mc_mb_select = projbuffer[12];
    mc_pd_normal = projbuffer[13];
    mc_pd_select = projbuffer[14];
    mc_menupopup = projbuffer[15];
    plotscreencode = projbuffer[16];
    plotcolor = projbuffer[17];
    plotreverse = projbuffer[18];
    plotunderline = projbuffer[19];
    plotblink = projbuffer[20];
    plotaltchar = projbuffer[21];
    if (projbuffer[22] != vdc_state.mode)
    {
        vdc_set_mode(projbuffer[22]);
    }
    updatecanvas();

    // Load screen
    sprintf(buffer, "%s.scrn", filename);
    if (bnk_load(targetdevice, 1, (char *)SCREENMAPBASE, buffer))
    {
        vdcwin_win_free();
        placesignature();
        vdcwin_cpy_viewport(&canvas);
        vdcwin_win_new(0, 0, 0, vdc_state.width, 1);
        menu_placebar(0);
        if (showbar)
        {
            initstatusbar();
        }
        undo_undopossible = 0;
        undo_redopossible = 0;
    }

    // Load standard charset
    if (charsetchanged[0] == 1)
    {
        sprintf(buffer, "%s.chrs", filename);
        bnk_load(targetdevice, 1, (char *)CHARSETNORMAL, buffer);
        bnk_redef_charset(vdc_state.char_std, BNK_1_FULL, (char *)CHARSETNORMAL, 256);
    }

    // Load standard charset
    if (charsetchanged[1] == 1)
    {
        sprintf(buffer, "%s.chra", filename);
        bnk_load(targetdevice, 1, (char *)CHARSETALTERNATE, buffer);
        bnk_redef_charset(vdc_state.char_alt, BNK_1_FULL, (char *)CHARSETALTERNATE, 256);
    }
}

void loadcharset(char stdoralt)
{
    // Function to load charset
    // Input: stdoralt: standard charset (0) or alternate charset (1)

    char *charsetaddress;

    if (!filepicker(0))
    {
        return;
    }

    charsetaddress = (stdoralt == 0) ? (char *)CHARSETNORMAL : (char *)CHARSETALTERNATE;

    if (bnk_load(targetdevice, 1, charsetaddress, filename))
    {
        if (stdoralt == 0)
        {
            bnk_redef_charset(vdc_state.char_std, BNK_1_FULL, (char *)charsetaddress, 256);
        }
        charsetchanged[stdoralt] = 1;
    }
}

void savecharset(char stdoralt)
{
    // Function to save charset
    // Input: stdoralt: standard charset (0) or alternate charset (1)

    char overwrite;
    char *charsetaddress;
    int escapeflag;

    escapeflag = chooseidandfilename("Save charset", 15);

    vdcwin_win_free();

    if (escapeflag == -1)
    {
        return;
    }

    charsetaddress = (stdoralt == 0) ? (char *)CHARSETNORMAL : (char *)CHARSETALTERNATE;

    overwrite = checkiffileexists(filename, targetdevice);

    if (overwrite)
    {
        // Scratch old file
        if (overwrite == 2)
        {
            sprintf(buffer, "s:%s", filename);
            cmd(targetdevice, buffer);
        }

        if (!bnk_save(targetdevice, 1, charsetaddress, charsetaddress + 2048, filename))
        {
            menu_fileerrormessage();
        }
    }
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)