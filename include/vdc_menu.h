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

#ifndef VDC_MENU_H
#define VDC_MENU_H

#include <c128/vdc.h>
#include "vdc_core.h"
#include "vdc_win.h"
#include "defines.h"

// Define
// Set these for menubar and pulldown menu dimensions
#define VDC_MENUBAR_MAXOPTIONS 4  // Number of options in main menu bar
#define VDC_MENUBAR_MAXLENGTH 12   // Maxiumum length of main menu bar option names
#define VDC_PULLDOWN_NUMBER 5     // Number of pull down menus defined
#define VDC_PULLDOWN_MAXOPTIONS 6 // Maximum number of options for pull down meus
#define VDC_PULLDOWN_MAXLENGTH 16 // Maximum length of pull down menu option names

// Set default colours and styles to use
#define VDC_MENUBAR_HEADERCOL VDC_LGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE   // Header bar color
#define VDC_MENUBAR_BARCOL VDC_DGREEN + VDC_A_ALTCHAR + VDC_A_REVERSE      // Menu bar color
#define VDC_MENUBAR_HIGHLLIGHT VDC_WHITE + VDC_A_ALTCHAR + VDC_A_REVERSE   // Menu bar color of selected option
#define VDC_PULLDOWN_SELECTCOL VDC_LYELLOW + VDC_A_ALTCHAR + VDC_A_REVERSE // Pull down color of selected option
#define VDC_PULLDOWN_NORMALCOL VDC_DCYAN + VDC_A_ALTCHAR + VDC_A_REVERSE   // Pull down color of not selected option
#define VDC_PULLDOWN_BORFULL WIN_BOR_ALL                                   // Set borderstyle for separate pulldown
#define VDC_PULLDOWN_BORTOP WIN_BOR_NOTOP                                  // Set borderstyle for main menu pulldowns
#define VDC_PULLDOWN_SELECTCH CH_MINUS                                     // Set char before selected option
#define VDC_POPUP_COLOR VDC_LYELLOW + VDC_A_ALTCHAR                        // Set pop-up window default attributes
#define VDC_POPUP_BORDER WIN_BOR_ALL                                       // Default pop-up border style
#define VDC_MENU_YESNO 5                                                   // Number for Yes No pull down menu

// Function prototypes
void menu_placeheader(const char *header);
void menu_placebar(char y);
void menu_placetop(const char *header);
char menu_pulldown(char xpos, char ypos, char menunumber, unsigned char escapable);
char menu_main();
char menu_areyousure(const char *message);
void menu_fileerrormessage();
void menu_messagepopup(const char *message);

// Variables
struct VDCMenuBar
{
    char titles[VDC_MENUBAR_MAXOPTIONS][VDC_MENUBAR_MAXLENGTH];
    char xstart[VDC_MENUBAR_MAXOPTIONS];
    char ypos;
};
extern struct VDCMenuBar menubar;
extern char pulldown_options[VDC_PULLDOWN_NUMBER];
extern char pulldown_titles[VDC_PULLDOWN_NUMBER][VDC_PULLDOWN_MAXOPTIONS][VDC_PULLDOWN_MAXLENGTH];

#pragma compile("vdc_menu.c")

#endif