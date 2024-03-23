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

#ifndef BANKING_H
#define BANKING_H

// Defines for MMU modes, MMU $FF00 configuration values
#define BNK_DEFAULT 0x0e
#define BNK_CHARROM 0x01
#define BNK_0_FULL 0x3f
#define BNK_1_FULL 0x7f
#define BMK_0_IO 0x3e
#define BNK_1_IO 0x7e

// Defines for scroll directions
#define SCROLL_LEFT 0x01
#define SCROLL_RIGHT 0x02
#define SCROLL_DOWN 0x04
#define SCROLL_UP 0x08

// Kernal defines for IEC statis detection
#define STATUS 0x90          // Kernal I/O completion status
#define SECOND 0xFF93
#define UNLSN  0xFFAE
#define LISTEN 0xFFB1

#define X(a, b, c) linebuffer[len - 3] == a &&linebuffer[len - 2] == b &&linebuffer[len - 1] == c

#define CBM_T_REG 0x10 /* Bit set for regular files */
#define CBM_T_SEQ 0x10
#define CBM_T_PRG 0x11
#define CBM_T_USR 0x12
#define CBM_T_REL 0x13
#define CBM_T_VRP 0x14 /* Vorpal fast-loadable format */
#define CBM_T_DEL 0x00
#define CBM_T_CBM 0x01    /* 1581 sub-partition */
#define CBM_T_DIR 0x02    /* IDE64 and CMD sub-directory */
#define CBM_T_LNK 0x03    /* IDE64 soft-link */
#define CBM_T_OTHER 0x04  /* File-type not recognized */
#define CBM_T_HEADER 0x05 /* Disk header / title */
#define CBM_T_FREE 100
#define DISK_ID_LEN 5
#define CBM_A_RO 1 /* Read only   */
#define CBM_A_WO 2 /* Write only  */
#define CBM_A_RW 3 /* Read, Write */

// File picker defines
#define DIRH 14
#define DIRY 2
#define DIRX 10
#define DIRW 60
#define MAXDEVID 30

// Function Prototypes

// Not in overlay
void load_overlay(const char *fname);
void bnk_init();
void bnk_exit();
char getcurrentdevice();

// In overlay
__noinline char bnk_readb(char cr, volatile char *p);
__noinline unsigned bnk_readw(char cr, volatile unsigned *p);
__noinline unsigned long bnk_readl(char cr, volatile unsigned long *p);
__noinline void bnk_writeb(char cr, volatile char *p, char b);
__noinline void bnk_writew(char cr, volatile unsigned *p, unsigned w);
__noinline void bnk_writel(char cr, volatile unsigned long *p, unsigned long l);
__noinline void bnk_memcpy(char dcr, volatile char *dp, char scr, volatile char *sp, unsigned size);
__noinline void bnk_memset(char cr, volatile char *p, char val, unsigned size);
__noinline void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char *sp, unsigned size);
__noinline void bnk_cpyfromvdc(char dcr, volatile char *dp, unsigned vdcsrc, unsigned size);
__noinline void bnk_redef_charset(unsigned vdcdest, char scr, volatile char *sp, unsigned size);
__noinline void freeDir();
__noinline void dir_close(char lfn);
__noinline char dir_open(char lfn, unsigned char device);
__noinline char dir_readentry(const char lfn, struct DirEntry *l_dirent);
__noinline bool bnk_load(char device, char bank, const char *start, const char *fname);
__noinline bool bnk_save(char device, char bank, const char *start, const char *end, const char *fname);
__noinline bool bnk_iec_active(char device);
__noinline void sid_startmusic();
__noinline void sid_stopmusic();
__noinline void sid_resetsid();
__noinline void sid_pausemusic();

// Global variables
extern char bootdevice;

struct DirEntry
{
    char name[17]; /* File name in PetSCII, limited to 16 chars */
    unsigned size; /* Size, in 254-/256-byte blocks */
    char type;
    char access;
};
struct DirElement
{
    struct DirEntry dirent;
    struct DirElement *next;
    struct DirElement *prev;
};
struct Directory
{
    /// 16 characters name
    /// 1 comma
    /// 5 characters ID
    /// NUL
    char name[16 + 1 + 5 + 1];
    struct DirElement *firstelement;
    struct DirElement *selected;
    struct DirElement *firstprinted;
    /// current cursor position
    unsigned int pos;
    /// number of free blocks
    unsigned int free;
};
extern struct Directory cwd;
extern struct DirElement direlement_size;
extern struct DirElement *previous;
extern struct DirElement *current;
extern struct DirElement *next;
extern const char progressBar[4];
extern const char progressRev[4];
extern char disk_id_buf[5];
extern struct DirElement direlement_size;
extern struct DirElement *previous;
extern struct DirElement *current;
extern struct DirElement *next;
extern struct Directory cwd;
extern const char *value2hex;
extern const char *reg_types[];
extern const char *oth_types[];
extern char bad_type[4];
extern char linebuffer2[81];

#pragma compile("banking.c")

#endif