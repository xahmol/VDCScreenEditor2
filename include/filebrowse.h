/*
VDC Screen Editor — shared file browser module

Written in 2024 by Xander Mol
Extracted from banking.c / main.c / prg_gen.c to eliminate duplication.
Used by both the main editor (vdcse) and the PRG generator utility (vdcse2prg).
*/

#ifndef FILEBROWSE_H
#define FILEBROWSE_H

// File type detection macro (requires linebuffer and len in scope)
#define X(a, b, c) linebuffer[len - 3] == a && linebuffer[len - 2] == b && linebuffer[len - 1] == c

// CBM file type flags
#define CBM_T_REG    0x10
#define CBM_T_SEQ    0x10
#define CBM_T_PRG    0x11
#define CBM_T_USR    0x12
#define CBM_T_REL    0x13
#define CBM_T_VRP    0x14
#define CBM_T_DEL    0x00
#define CBM_T_CBM    0x01
#define CBM_T_DIR    0x02
#define CBM_T_LNK    0x03
#define CBM_T_OTHER  0x04
#define CBM_T_HEADER 0x05
#define CBM_T_FREE   100
#define DISK_ID_LEN  5
#define CBM_A_RO 1
#define CBM_A_WO 2
#define CBM_A_RW 3

// VDCWin struct (no pragma compile — safe to include from both build chains)
#include "vdcwin_types.h"

// File picker display constants
#define DIRH 14
#define DIRY  2
#define DIRX 10
#define DIRW 60
#define MAXDEVID 30

// Directory entry structures
struct DirEntry
{
    char name[17];
    unsigned size;
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
    char name[16 + 1 + 5 + 1];
    struct DirElement *firstelement;
    struct DirElement *selected;
    struct DirElement *firstprinted;
    unsigned int pos;
    unsigned int free;
};

// Global variables
extern const char *value2hex;
extern const char *reg_types[];
extern const char *oth_types[];
extern char bad_type[4];
extern char linebuffer2[81];
extern const char progressBar[4];
extern const char progressRev[4];
extern char disk_id_buf[6];
extern struct DirElement direlement_size;
extern struct DirElement *previous;
extern struct DirElement *current;
extern struct DirElement *next;
extern struct Directory cwd;

// Function prototypes
__noinline void freeDir(void);
__noinline char dir_open(char lfn, unsigned char device);
__noinline void dir_close(char lfn);
__noinline char dir_readentry(const char lfn, struct DirEntry *l_dirent);
__noinline const char *fileTypeToStr(char ft);
__noinline char dir_validentry(char filter);
char readDir(char device, char filter);
void drawDirFrame(char device);
void printDir(char device);
void refreshDir(char device, char filter);
__noinline char filepicker(char filter);

#pragma compile("filebrowse.c")

#endif
