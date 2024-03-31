#ifndef __DEFINES_H_
#define __DEFINES_H_

/* Machine code area addresses mapping */
#define MACOSTART 0x1300 // Start of machine code area
#define MACOSIZE 0x0800  // Length of machine code area

/* Address mapping for visual PETSCII map */
#define PETSCIIMAP 0x0C00 // PETSCII map in RS232 buffer

/* Bank 0 save data adress mapping */
#define OVERLAYBANK0 0xC000 // Start address overlay storage bank 0

/* Bank 1 memory addresses mapping */
#define WINDOWBASEADDRESS 0x2000 // Base address for windows system data, 8k reserved
#define CHARSETSYSTEM 0x4000     // Base address for system charset
#define CHARSETNORMAL 0x4800     // Base address for normal charset
#define CHARSETALTERNATE 0x5000  // Base address for alternate charset
#define SCREENMAPBASE 0x5800     // Base address for screen map
#define MEMORYLIMIT 0xCFFF       // Upper memory limit address for address map
#define OVERLAYBANK1 0xD000      // Start address overlay storage bank 1

/* Global variables */

// Overlay data struct
#define OVERLAYNUMBER 6    // Number of overlays
#define OVERLAYSIZE 0x1400 // Overlay size (align with config)
#define OVERLAYLOAD 0xAC00 // Overlay load address (align with config=0xC000-OVERLAYSIZE)

struct OverlayStruct
{
    char bank;
    unsigned address;
};
extern struct OverlayStruct overlaydata[OVERLAYNUMBER];
extern char overlay_active;

// Undo data
extern char undoenabled;
extern unsigned undoaddress;
extern char undonumber;
extern char undo_undopossible;
extern char undo_redopossible;
struct UndoStruct
{
    unsigned address;
    char ystart;
    char xstart;
    char height;
    char width;
    char redopresent;
};
extern struct UndoStruct Undo[41];

// Importer data
struct IMPORTVARS
{
    unsigned xpos;
    unsigned ypos;
    unsigned width;
    unsigned height;
    unsigned xc;
    unsigned yc;
    char content;
    char convert;
    char loadaddr;
    char uppercase;
    unsigned offset;
    char cls;
};
extern struct IMPORTVARS importvars;

// Global variables
extern char bootdevice;
extern char DOSstatus[40];
extern char charsetchanged[2];
extern char appexit;
extern char targetdevice;
extern char filename[21];
extern char programmode[11];
extern char showbar;

extern unsigned screen_col;
extern unsigned screen_row;
extern unsigned screentotal;
extern char screenbackground;
extern char plotscreencode;
extern char plotcolor;
extern char plotreverse;
extern char plotunderline;
extern char plotblink;
extern char plotaltchar;
extern unsigned select_startx, select_starty, select_endx, select_endy, select_width, select_height, select_accept;
extern unsigned rowsel;
extern unsigned colsel;
extern char palettechar;
extern char visualmap;
extern char favourites[10][2];
extern struct VDCViewport canvas;

extern char buffer[81];
extern char version[22];

/* Char defines */
#define CH_CURS_UP 145    // Petscii control code for Cursor Up
#define CH_CURS_DOWN 17   // Petscii control code for Cursor Down
#define CH_CURS_LEFT 157  // Petscii control code for Cursor Left
#define CH_CURS_RIGHT 29  // Petscii control code for Cursor Right
#define CH_PI 222         // Petscii control code for Pi
#define CH_HOME 19        // Petscii control code for Home (HOME)
#define CH_CLEAR 147      // Petscii control code for Clear (SHIFT+HOME)
#define CH_DEL 20         // Petscii control code for delete (DEL)
#define CH_INS 148        // Petscii control code for Insert (SHIFT+DEL)
#define CH_ENTER 13       // Petscii control code for enter (RETURN)
#define CH_STOP 3         // Petscii control code for stop (STOP)
#define CH_RUN 10         // Petscii control code for run (SHIFT+STOP)
#define CH_TAB 9          // Petscii control code for tab (TAB)
#define CH_LIRA 92        // Petscii control code for pound sign
#define CH_ESC 27         // Petscii control code for escape (ESC)
#define CH_FONT_LOWER 14  // Petscii control code for lower case font
#define CH_FONT_UPPER 142 // Petscii control code for upper case font
#define CH_ARROW_UP 94    // Petscii control code for arrow up
#define CH_ARROW_LEFT 95  // Petscii control code for arrow left
#define CH_SPACE 32       // Petscii code and Screencode for space
#define CH_MINUS 45       // Screencode for minus
#define CH_BLACK 144      // Petscii control code for black           CTRL-1
#define CH_WHITE 5        // Petscii control code for white           CTRL-2
#define CH_DRED 28        // Petscii control code for dark red        CTRL-3
#define CH_LCYAN 159      // Petscii control code for light cyan      CTRL-4
#define CH_LPURPLE 156    // Petscii control code for light purple    CTRL-5
#define CH_DGREEN 30      // Petscii control code for dark green      CTRL-6
#define CH_DBLUE 31       // Petscii control code for dark blue       CTRL-7
#define CH_LYELLOW 158    // Petscii control code for light yellow    CTRL-8
#define CH_RVSON 18       // Petscii control code for RVS ON          CTRL-9
#define CH_RVSOFF 146     // Petscii control code for RVS OFF         CTRL-0
#define CH_DPURPLE 129    // Petscii control code for dark purple     C=-1
#define CH_DYELLOW 149    // Petscii control code for dark yellow     C=-2
#define CH_LRED 150       // Petscii control code for light red       C=-3
#define CH_DCYAN 151      // Petscii control code for dark cyan       C=-4
#define CH_DGREY 152      // Petscii control code for dark grey       C=-5
#define CH_LGREEN 153     // Petscii control code for light green     C=-6
#define CH_LBLUE 154      // Petscii control code for light blue      C=-7
#define CH_LGREY 155      // Petscii control code for light grey      C=-8
#define CH_F1 133         // Petscii control code for F1
#define CH_F2 137         // Petscii control code for F2
#define CH_F3 134         // Petscii control code for F3
#define CH_F4 138         // Petscii control code for F4
#define CH_F5 135         // Petscii control code for F5
#define CH_F6 139         // Petscii control code for F6
#define CH_F7 136         // Petscii control code for F7
#define CH_F8 140         // Petscii control code for F8

/* Declaration global variables as externals */
extern char bootdevice;

#endif // __DEFINES_H_