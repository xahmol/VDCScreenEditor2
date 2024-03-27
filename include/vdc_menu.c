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

#include <stdbool.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include "vdc_win.h"
#include "vdc_core.h"
#include "banking.h"
#include "vdc_menu.h"

struct VDCMenuBar menubar = {
    {"Screen", "File", "Charset", "Information"},
    {0, 0, 0, 0},
    0};

char pulldown_options[VDC_PULLDOWN_NUMBER] = {6, 5, 4, 2, 2, 6, 3};
char pulldown_titles[VDC_PULLDOWN_NUMBER][VDC_PULLDOWN_MAXOPTIONS][VDC_PULLDOWN_MAXLENGTH] = {
    {"Width:      80 ",
     "Height:     25 ",
     "Background:  0 ",
     "Screenmode:  0 ",
     "Clear          ",
     "Fill           "},
    {"Save screen    ",
     "Load screen    ",
     "Save project   ",
     "Load project   ",
     "Import         "},
    {"Load standard  ",
     "Load alternate ",
     "Save standard  ",
     "Save alternate "},
    {"Version/credits",
     "Exit program   "},
    {"Yes",
     "No "},
    {"PAL  80x25",
     "PAL  80x50",
     "PAL  80x70",
     "NTSC 80x25",
     "NTSC 80x50",
     "NTSC 80x60"},
    {"Both      ",
     "Only chars",
     "Only color"}};

// Menucolors
char mc_mb_normal = VDC_LGREEN + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_mb_select = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_pd_normal = VDC_DCYAN + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_pd_select = VDC_LYELLOW + VDC_A_REVERSE + VDC_A_ALTCHAR;
char mc_menupopup = VDC_WHITE + VDC_A_REVERSE + VDC_A_ALTCHAR;

void menu_placeheader(const char *header)
// Print header title
{
    vdc_hchar(0, 0, C_SPACE, VDC_MENUBAR_HEADERCOL, 80);
    vdc_prints_attr(0, 0, header, VDC_MENUBAR_HEADERCOL);
}

void menu_placebar(char y)
// Place main meny bar at given line ycoord
{
    char xcoord = 1;
    char len;

    menubar.ypos = y;

    vdc_hchar(0, y, C_SPACE, mc_mb_normal, 80);

    for (char i = 0; i < VDC_MENUBAR_MAXOPTIONS; i++)
    {
        len = strlen(menubar.titles[i]);
        if (xcoord + len > vdc_state.width - 1)
        {
            xcoord = vdc_state.width - 1 - len;
        }
        vdc_prints_attr(xcoord, y, menubar.titles[i], mc_mb_normal);
        menubar.xstart[i] = xcoord;
        xcoord += len + 1;
    }
}

void menu_placetop(const char *header)
// Place both header and menubar at lines 0 and 1
{
    vdc_cls();
    menu_placeheader(header);
    menu_placebar(1);
}

char menu_pulldown(char xpos, char ypos, char menunumber, unsigned char escapable)
/* Function for pull down menu
   Input:
   - xpos = x-coordinate of upper left corner
   - ypos = y-coordinate of upper left corner
   - menunumber =
     number of the menu as defined in pulldownmenuoptions array
   - espacable: ability to escape with escape key enabled (1) or not (0)  */

{
    char x;
    char key;
    char exit = 0;
    char menuchoice = 1;
    char width = strlen(pulldown_titles[menunumber][0]) + 2;
    char height = pulldown_options[menunumber];
    char topmenu = (menunumber > VDC_MENUBAR_MAXOPTIONS - 1) ? 0 : 1;
    char border = topmenu ? VDC_PULLDOWN_BORTOP : VDC_PULLDOWN_BORFULL;

    vdcwin_win_new(border, xpos, ypos, width, height);

    for (x = 0; x < height; x++)
    {
        sprintf(linebuffer, " %s ", pulldown_titles[menunumber][x]);
        vdc_prints_attr(xpos, ypos + x, linebuffer, mc_pd_normal);
    }

    do
    {
        sprintf(linebuffer, "%c%s ", VDC_PULLDOWN_SELECTCH, pulldown_titles[menunumber][menuchoice - 1]);
        vdc_prints_attr(xpos, ypos + menuchoice - 1, linebuffer, mc_pd_select);

        do
        {
            key = vdcwin_getch();
        } while (key != CH_ENTER && key != CH_CURS_LEFT && key != CH_CURS_RIGHT && key != CH_CURS_UP && key != CH_CURS_DOWN && key != CH_ESC && key != CH_STOP);

        switch (key)
        {
        case CH_ESC:
        case CH_STOP:
            if (escapable == 1)
            {
                exit = 1;
                menuchoice = 0;
            }
            break;

        case CH_ENTER:
            exit = 1;
            break;

        case CH_CURS_LEFT:
            if (topmenu)
            {
                exit = 1;
                menuchoice = 18;
            }
            break;

        case CH_CURS_RIGHT:
            if (topmenu)
            {
                exit = 1;
                menuchoice = 19;
            }
            break;

        case CH_CURS_DOWN:
        case CH_CURS_UP:
            sprintf(linebuffer, " %s ", pulldown_titles[menunumber][menuchoice - 1]);
            vdc_prints_attr(xpos, ypos + menuchoice - 1, linebuffer, mc_pd_normal);
            if (key == CH_CURS_UP)
            {
                menuchoice--;
                if (menuchoice < 1)
                {
                    menuchoice = height;
                }
            }
            else
            {
                menuchoice++;
                if (menuchoice > height)
                {
                    menuchoice = 1;
                }
            }
            break;

        default:
            break;
        }
    } while (exit == 0);

    vdcwin_win_free();

    return menuchoice;
}

char menu_main()
{
    /* Function for main menu selection */

    unsigned char menubarchoice = 1;
    unsigned char menuoptionchoice = 0;
    unsigned char key;
    unsigned char xpos;

    menu_placebar(menubar.ypos);

    do
    {
        do
        {
            vdc_prints_attr(menubar.xstart[menubarchoice - 1], menubar.ypos, menubar.titles[menubarchoice - 1], mc_mb_select);

            do
            {
                key = vdcwin_getch();
            } while (key != CH_ENTER && key != CH_CURS_LEFT && key != CH_CURS_RIGHT && key != CH_ESC && key != CH_STOP);

            vdc_prints_attr(menubar.xstart[menubarchoice - 1], menubar.ypos, menubar.titles[menubarchoice - 1], mc_mb_normal);

            if (key == CH_CURS_LEFT)
            {
                menubarchoice--;
                if (menubarchoice < 1)
                {
                    menubarchoice = VDC_MENUBAR_MAXOPTIONS;
                }
            }
            else if (key == CH_CURS_RIGHT)
            {
                menubarchoice++;
                if (menubarchoice > VDC_MENUBAR_MAXOPTIONS)
                {
                    menubarchoice = 1;
                }
            }
        } while (key != CH_ENTER && key != CH_ESC && key != CH_STOP);
        if (key != CH_ESC && key != CH_STOP)
        {
            xpos = menubar.xstart[menubarchoice - 1];
            menuoptionchoice = menu_pulldown(xpos, menubar.ypos + 1, menubarchoice - 1, 1);
            if (menuoptionchoice == 18)
            {
                menuoptionchoice = 0;
                menubarchoice--;
                if (menubarchoice < 1)
                {
                    menubarchoice = VDC_MENUBAR_MAXOPTIONS;
                }
            }
            if (menuoptionchoice == 19)
            {
                menuoptionchoice = 0;
                menubarchoice++;
                if (menubarchoice > VDC_MENUBAR_MAXOPTIONS)
                {
                    menubarchoice = 1;
                }
            }
        }
        else
        {
            menuoptionchoice = 99;
        }
    } while (menuoptionchoice == 0);

    return menubarchoice * 10 + menuoptionchoice;
}

char menu_areyousure(const char *message)
// Pull down menu to verify if player is sure
{
    char choice;
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = mc_menupopup;

    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);
    vdc_prints(10, 9, message);
    vdc_prints(10, 10, "Are you sure?");
    choice = menu_pulldown(25, 11, VDC_MENU_YESNO, 0);
    vdcwin_win_free();

    vdc_state.text_attr = old_attr;

    return choice;
}

void menu_fileerrormessage()
// Show message for file error encountered
{
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);

    vdc_prints(10, 9, "File error!");

    sprintf(linebuffer, "Error nr.: %2X", krnio_pstatus[1]);
    vdc_prints(10, 11, linebuffer);

    vdc_prints(10, 13, "Press key.");
    vdcwin_getch();

    vdcwin_win_free();
    vdc_state.text_attr = old_attr;
}

void menu_messagepopup(const char *message)
// Show popup with a message
{
    char old_attr = vdc_state.text_attr;

    vdc_state.text_attr = mc_menupopup;
    vdcwin_win_new(VDC_POPUP_BORDER, 8, 8, 30, 6);

    vdc_prints(10, 9, message);

    vdc_prints(10, 11, "Press key.");
    vdcwin_getch();

    vdcwin_win_free();
    vdc_state.text_attr = old_attr;
}