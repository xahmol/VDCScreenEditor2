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

char dir_validentry(char filter)
// Is current dir entry a valid entry to show given filetype and filter
{
    char len = strlen(current->dirent.name);
    char extension[6];

    // If it is not a PRG file, return with zero value
    if (current->dirent.type != CBM_T_PRG)
    {
        return 0;
    }

    // Filter and filename long enough? Then check for extension
    if (filter && len > 5)
    {
        strcpy(extension, (char *)current->dirent.name[len - 5]);
        if (strcmp(extension, ".proj"))
        {
            return 0;
        }
    }
    return 1;
}

char readDir(char device, char filter)
// Read the directory
{
    char cnt = 0xff;
    char ret, i;

    previous = (struct DirElement *)0;

    vdc_state.text_attr = mc_menupopup;

    if (cwd.name[0])
    {
        freeDir();
    }

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);

    if (dir_open(15, device))
    {
        return 0;
    }

    while (1)
    {
        current = calloc(1, sizeof(direlement_size));

        if (!current)
        {
            break;
        }

        if (dir_readentry(15, &(current->dirent)))
        {
            free(current);
            break;
        }

        // print progress bar
        if ((cnt >> 2) >= 36)
        {
            cnt = 0;
            vdc_clear(DIRX, DIRY + 3, CH_SPACE, DIRW, 1);
            sprintf(linebuffer, "[%02u]", device);
            vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
        }
        else
        {
            vdcwin_cursor_move(&canvas.view, DIRX + 4 + (cnt >> 2), DIRY + 3);
            vdc_reverse(!progressRev[cnt & 3]);
            vdcwin_put_char(&canvas.view, progressBar[cnt & 3]);
            ++cnt;
        }

        if (!cwd.name[0])
        {
            // initialize directory
            if (current->dirent.type == CBM_T_HEADER)
            {
                for (i = 0; current->dirent.name[i]; ++i)
                {
                    cwd.name[i] = current->dirent.name[i];
                }
                cwd.name[i++] = ',';
                memcpy(&cwd.name[i], disk_id_buf, DISK_ID_LEN);
            }
            else
            {
                strcpy(cwd.name, "Unknown type");
            }
        }
        else
        {
            if (current->dirent.type == CBM_T_FREE)
            {
                // blocks free entry
                cwd.free = current->dirent.size;
                break;
            }
            else if (dir_validentry(filter))
            {
                if (cwd.firstelement == 0)
                {
                    // first element
                    cwd.firstelement = current;
                    previous = current;
                }
                else
                {
                    // all other elements
                    current->prev = previous;
                    previous->next = current;
                    previous = current;
                }
            }
            else
            {
                free(current);
            }
        }
    }
    dir_close(15);
    vdc_reverse(1);

    // Are there valid entries read?
    if (cwd.firstelement)
    {
        cwd.selected = cwd.firstelement;
        cwd.firstprinted = cwd.firstelement;
        return 1;
    }
    // No valid entries
    else
    {
        return 0;
    }
}

const char *fileTypeToStr(char ft)
// Convert file type from value to string
{
    if (ft & CBM_T_REG)
    {
        ft &= ~CBM_T_REG;
        if (ft <= 4)
            return reg_types[ft];
    }
    else
    {
        if (ft <= 5)
            return oth_types[ft];
    }
    bad_type[0] = '?';
    bad_type[1] = value2hex[ft >> 4];
    bad_type[2] = value2hex[ft & 15];
    bad_type[3] = 0;
    return bad_type;
}

void drawDirFrame(char device)
{
    vdc_clear(DIRX, DIRY + 3, CH_SPACE, 40, DIRH + 2);
    sprintf(linebuffer, "[%02u] %.20s", device, cwd.name);
    vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
    sprintf(linebuffer, "%u blocks free", cwd.free);
    vdc_prints(DIRX + 1, DIRY + DIRH + 4, linebuffer);
}

void printElementPriv(const char ypos)
{
    vdc_state.text_attr = mc_pd_normal;
    if ((current == cwd.selected))
    {
        vdc_state.text_attr = mc_pd_select;
    }

    vdcwin_cursor_move(&canvas.view, DIRX + 2, ypos);
    strcpy(linebuffer, current->dirent.name);
    sprintf(linebuffer2, (current->dirent.size < 10000) ? "%4u %-16s " : "%u %-15s ", current->dirent.size, linebuffer);
    vdcwin_put_string(&canvas.view, linebuffer2);

    // if blocks are >= 10000 shorten the file type to 2 characters
    strcpy(linebuffer2, fileTypeToStr(current->dirent.type));
    if (current->dirent.size >= 10000 && strlen(current->dirent.name) == 16)
    {
        linebuffer2[0] = linebuffer2[1];
        linebuffer2[1] = linebuffer2[2];
        linebuffer2[2] = 0;
    }
    vdcwin_put_string(&canvas.view, linebuffer2);
    vdc_state.text_attr = mc_menupopup;
}

void printDir(char device)
{
    unsigned idx = 0;

    if (!cwd.firstelement)
    {
        vdcwin_clear(&canvas.view);
        return;
    }

    drawDirFrame(device);

    current = cwd.firstprinted;

    for (idx = 0; (current != 0) && (idx < DIRH); ++idx)
    {
        printElementPriv(idx + DIRY + 4);
        current = current->next;
    }

    // clear empty lines
    for (; idx < DIRH; ++idx)
    {
        vdc_clear(DIRX, idx + DIRY + 4, CH_SPACE, 40, 1);
    }
}

void refreshDir(char device, char filter)
{
    readDir(device, filter);
    cwd.selected = cwd.firstelement;
    printDir(device);
}

void updateMenu(void)
{
    char menuy = DIRY + 2;

    vdc_state.text_attr = mc_menupopup;
    vdc_clear(DIRX + DIRW - 15, DIRY + 2, CH_SPACE, 14, 10);

    vdc_prints(DIRX + DIRW - 15, ++menuy, " F1 Dir refr.");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "+/- Device");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "RET Select");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "  T Top");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "  E End");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "P/U Page up/do");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "Cur Navigate");
    vdc_prints(DIRX + DIRW - 15, ++menuy, "ESC Cancel");
}

char filepicker(char filter)
// Function to select a file from the directory list
{
    unsigned pos = 0;
    char lastpage = 0;
    char nextpage = 0;
    unsigned ypos, yoff;
    char count;
    char selected = 0;

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);
    memset(&filename, 0, sizeof(filename));

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, DIRX, DIRY, DIRW, DIRH + 6);

    vdc_underline(1);
    vdc_prints(DIRX + 1, DIRY + 1, "Select the file to load");
    vdc_underline(0);

    refreshDir(targetdevice, filter);

    if (cwd.firstelement == 0)
    {
        vdc_prints(DIRX + 1, DIRY + 3, "No valid directory entries found.");
    }

    updateMenu();

    do
    {
        current = cwd.selected;
        pos = cwd.pos;
        lastpage = pos / DIRH;
        yoff = pos - (lastpage * DIRH);
        ypos = yoff + 6;

        switch (vdcwin_getch())
        {
        case CH_F1:
            refreshDir(targetdevice, filter);
            break;

        case '2':
        case CH_F2:
        case '+':
            if (targetdevice)
            {
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
                memset(&cwd, 0, sizeof(cwd));
                refreshDir(targetdevice, filter);
            }
            break;

        case '-':
            if (targetdevice)
            {
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
                memset(&cwd, 0, sizeof(cwd));
                refreshDir(targetdevice, filter);
            }
            break;

        case 't':
        case CH_HOME:
            cwd.selected = cwd.firstelement;
            cwd.pos = 0;
            printDir(filter);
            break;

        case 'e':
            current = cwd.firstelement;
            pos = 0;
            while (1)
            {
                if (current->next != 0)
                {
                    current = current->next;
                    pos++;
                }
                else
                {
                    break;
                }
            }
            cwd.selected = current;
            cwd.pos = pos;
            printDir(filter);
            break;

        case CH_ESC:
        case CH_STOP:
            selected = 2;
            break;

        case CH_CURS_DOWN:
            if (cwd.selected != 0 && current->next != 0)
            {
                current = current->next;
                cwd.selected = current;
                nextpage = (pos + 1) / DIRH;
                cwd.pos++;
                if (lastpage != nextpage)
                {
                    cwd.firstprinted = current;
                    printDir(filter);
                }
                else
                {
                    current = current->prev;
                    printElementPriv(ypos);
                    yoff++;
                    ypos = yoff + 6;
                    current = current->next;
                    printElementPriv(ypos);
                }
            }
            break;

        case CH_CURS_UP:
            if (cwd.selected != 0 && current->prev != 0)
            {
                current = current->prev;
                cwd.selected = current;
                nextpage = (pos - 1) / DIRH;
                cwd.pos--;
                if (lastpage != nextpage)
                {
                    for (count = 0; count < DIRH - 1; count++)
                    {
                        if (current->prev != 0)
                        {
                            current = current->prev;
                        }
                    }
                    cwd.firstprinted = current;
                    printDir(filter);
                }
                else
                {
                    current = current->next;
                    printElementPriv(ypos);
                    yoff--;
                    ypos = yoff + 6;
                    current = current->prev;
                    printElementPriv(ypos);
                }
            }
            break;

        // Select file
        case CH_ENTER:
            selected = 1;
            strcpy(filename, current->dirent.name);
            break;

        // Page down
        case 'p':
            // Check if not already last item? If no, page down
            if (current->next != 0)
            {
                cwd.selected = (struct DirElement *)0;
                printElementPriv(ypos);
                for (count = 0; count < DIRH; count++)
                {
                    if (current->next)
                    {
                        current = current->next;
                        cwd.pos++;
                        cwd.selected = current;
                        cwd.firstprinted = current;
                    }
                }
                pos = cwd.pos;
                yoff = pos - (lastpage * DIRH);
                ypos = yoff + 6;
                printDir(filter);
            }
            break;

        // Page up
        case 'u':
            // Check if not already first item? If no, page up
            if (current->prev != 0)
            {
                cwd.selected = (struct DirElement *)0;
                printElementPriv(ypos);
                for (count = 0; count < DIRH; count++)
                {
                    if (current->prev)
                    {
                        current = current->prev;
                        cwd.pos--;
                        cwd.selected = current;
                        cwd.firstprinted = current;
                    }
                }
                pos = cwd.pos;
                yoff = pos - (lastpage * DIRH);
                ypos = yoff + 6;
                printDir(filter);
            }
            break;
        }
    } while (!selected);

    vdcwin_win_free();
    if (selected == 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

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
        vdcwin_win_free();
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

    unsigned char overwrite;
    char projbuffer[23];
    char tempfilename[21];
    int escapeflag;

    escapeflag = chooseidandfilename("Save project", 10);

    vdcwin_win_free();
    memset(projbuffer,0,23);

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
    unsigned char projbuffer[23];
    memset(projbuffer,0,23);

    if (!filepicker(1))
    {
        vdcwin_win_free();
        return;
    }

    // Strip .proj extension
    filename[strlen(filename - 5)] = 0;

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
        bnk_redef_charset(vdc_state.char_std,BNK_1_FULL,(char *)CHARSETNORMAL,256);
    }

    // Load standard charset
    if (charsetchanged[1] == 1)
    {
        sprintf(buffer, "%s.chra", filename);
        bnk_load(targetdevice, 1, (char *)CHARSETALTERNATE, buffer);
        bnk_redef_charset(vdc_state.char_alt,BNK_1_FULL,(char *)CHARSETALTERNATE,256);
    }
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)