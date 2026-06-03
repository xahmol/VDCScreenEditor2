/*
VDC Screen Editor — shared file browser module

Written in 2024 by Xander Mol
Extracted from banking.c / main.c / prg_gen.c to eliminate duplication.
Used by both the main editor (vdcse) and the PRG generator utility (vdcse2prg).

Bug fixes applied versus the original duplicated copies:
- Oscar64 §12.1: for/continue loops replaced with while loops in dir_readentry
  (whitespace strip and disk-name strip loops).
- Navigation: 'e' (End) key now resets cwd.firstprinted to cwd.firstelement
  before scanning, preventing stale firstprinted when list fits one page.

The popup window (vdcwin_win_new / vdcwin_win_free) is NOT called inside
filepicker. Callers in overlay3.c and import_dialogue (main.c) wrap the call
with a popup; the standalone prg_gen utility calls filepicker directly.
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include "defines.h"
#include "filebrowse.h"

// VDC/window layer — resolved by vdc_core.c (main chain) or vdc_nobnk.c (prg_gen chain)
extern char linebuffer[81];
extern void vdc_clear(char x, char y, char val, char length, char lines);
extern void vdc_prints(char x, char y, const char *string);
extern void vdc_textcolor(char color);
extern void vdc_blink(char set);
extern void vdc_underline(char set);
extern void vdc_reverse(char set);
extern void vdc_altchar(char set);
extern int  vdcwin_getch(void);
extern void vdcwin_init(struct VDCWin *win, char sx, char sy, char wx, char wy);
extern void vdcwin_clear(struct VDCWin *win);
extern void vdcwin_cursor_move(struct VDCWin *win, char cx, char cy);
extern void vdcwin_put_char(struct VDCWin *win, char ch);
extern char vdcwin_put_string(struct VDCWin *win, const char *str);

// Color globals — defined in vdc_menu.c (main chain) or locally in prg_gen.c
extern char mc_pd_normal;
extern char mc_pd_select;
extern char mc_menupopup;

// Set all attribute bits from a packed attr byte (color|blink|underline|reverse|altchar)
static void fb_set_attr(char attr)
{
    vdc_textcolor(attr & 0x0F);
    vdc_blink(attr & 0x10);
    vdc_underline(attr & 0x20);
    vdc_reverse(attr & 0x40);
    vdc_altchar(attr & 0x80);
}

// Module globals (moved from banking.c / prg_gen.c)
const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];
char linebuffer2[81];
const char progressBar[4] = {0xA5, 0xA1, 0xA7, ' '};
const char progressRev[4] = {0, 0, 1, 1};
char disk_id_buf[6];
struct DirElement direlement_size;
struct DirElement *previous;
struct DirElement *current;
struct DirElement *next;
struct Directory cwd;

// Module-local full-screen VDCWin used for cursor positioning in the browser
static struct VDCWin fb_win;

// ---------------------------------------------------------------------------
// Low-level IEC directory functions
// ---------------------------------------------------------------------------

void freeDir(void)
{
    if (!cwd.name[0])
    {
        return;
    }

    current = cwd.firstelement;
    while (current)
    {
        next = current->next;
        free(current);
        current = next;
    }

    cwd.name[0] = 0;
}

void dir_close(char lfn)
{
    krnio_clrchn();
    krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device)
{
    char status = 0;
    char error = 0;

    krnio_setbnk(0, 0);
    krnio_setnam("$");

    status = krnio_open(lfn, device, 0);
    error = krnio_status();

    if (status && error)
    {
        dir_close(lfn);
    }

    if (status && !error)
    {
        status = krnio_chkin(lfn);
        error = krnio_status();

        if (status && !error)
        {
            krnio_chrin();
            krnio_chrin();

            error = krnio_status();

            if (error)
            {
                dir_close(lfn);
            }
        }
        else
        {
            dir_close(lfn);
        }
    }

    return error;
}

char dir_readentry(const char lfn, struct DirEntry *l_dirent)
// Read the next directory entry.
// Oscar64 §12.1: for/continue loops replaced with while to avoid zeroing loop var.
{
    char b, len;
    char i = 0;
    char type_known = 0;
    char quote_end = 0;

    b = krnio_chrin();
    if (!b)
    {
        return 1;
    }
    if (krnio_status())
    {
        return 7;
    }

    krnio_chrin();

    l_dirent->size = krnio_chrin();
    l_dirent->size |= (krnio_chrin()) << 8;

    memset(linebuffer, 0, sizeof(linebuffer));
    while (1)
    {
        b = krnio_chrin();
        if (b == 0)
        {
            break;
        }
        if (i < sizeof(linebuffer))
        {
            linebuffer[i++] = b;
        }
        if (krnio_status())
        {
            krnio_clrchn();
            return 2;
        }
    }

    if (linebuffer[0] == 'b')
    {
        l_dirent->type = CBM_T_FREE;
        return 0;
    }

    if (i < 5)
    {
        return 3;
    }

    // Strip whitespace from right — while loop avoids Oscar64 §12.1 for/continue bug
    len = i;
    while (len > 0)
    {
        b = linebuffer[len];
        if (b == 0 || b == ' ' || b == 0xA0)
        {
            linebuffer[len] = 0;
            --len;
        }
        else
        {
            ++len;
            break;
        }
    }

    if (len < 3)
    {
        return 3;
    }

    for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
    {
    }

    if (i == sizeof(linebuffer))
    {
        return 3;
    }

    b = 0;
    for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < 16; ++i)
    {
        l_dirent->name[b++] = linebuffer[i];
    }
    quote_end = i;

    if (X('p', 'r', 'g'))
    {
        l_dirent->type = CBM_T_PRG;
        type_known = 1;
    }
    else if (X('s', 'e', 'q'))
    {
        l_dirent->type = CBM_T_SEQ;
        type_known = 1;
    }
    else if (X('u', 's', 'r'))
    {
        l_dirent->type = CBM_T_USR;
        type_known = 1;
    }
    else if (X('d', 'e', 'l'))
    {
        l_dirent->type = CBM_T_DEL;
        type_known = 1;
    }
    else if (X('r', 'e', 'l'))
    {
        l_dirent->type = CBM_T_REL;
        type_known = 1;
    }
    else if (X('c', 'b', 'm'))
    {
        l_dirent->type = CBM_T_CBM;
        type_known = 1;
    }
    else if (X('d', 'i', 'r'))
    {
        l_dirent->type = CBM_T_DIR;
        type_known = 1;
    }
    else if (X('v', 'r', 'p'))
    {
        l_dirent->type = CBM_T_VRP;
        type_known = 1;
    }
    else if (X('l', 'n', 'k'))
    {
        l_dirent->type = CBM_T_LNK;
        type_known = 1;
    }

    if (!type_known)
    {
        l_dirent->type = CBM_T_HEADER;

        if (quote_end < sizeof(linebuffer) && linebuffer[quote_end] == '"')
        {
            ++quote_end;
        }
        if (quote_end < sizeof(linebuffer) && linebuffer[quote_end] == ' ')
        {
            ++quote_end;
        }

        for (b = 0; b < DISK_ID_LEN; ++b)
        {
            if (quote_end < sizeof(linebuffer) && linebuffer[quote_end])
            {
                disk_id_buf[b] = linebuffer[quote_end];
            }
            ++quote_end;
        }
        disk_id_buf[b] = 0;

        // Strip disk name — while loop avoids Oscar64 §12.1 for/continue bug
        b = 15;
        while (b > 0)
        {
            if (l_dirent->name[b] == 0 ||
                l_dirent->name[b] == ' ' ||
                l_dirent->name[b] == 0xA0)
            {
                l_dirent->name[b] = 0;
                --b;
            }
            else
            {
                break;
            }
        }

        return 0;
    }

    l_dirent->access = CBM_A_RW;
    for (i = quote_end + 1; i < len; ++i)
    {
        if (linebuffer[i] == 0x3C)
        {
            l_dirent->access = CBM_A_RO;
            break;
        }
    }

    return 0;
}

const char *fileTypeToStr(char ft)
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

char dir_validentry(char filter)
// filter 0: all PRG, 1: project files (.proj), 2: SEQ files
{
    char len = strlen(current->dirent.name);
    char extension[6];

    if (current->dirent.type != CBM_T_PRG && filter < 2)
    {
        return 0;
    }

    if (current->dirent.type != CBM_T_SEQ && filter == 2)
    {
        return 0;
    }

    if (filter == 1)
    {
        if (len > 5)
        {
            memset(extension, 0, 6);
            for (char i = 0; i < 5; i++)
            {
                extension[i] = current->dirent.name[len - 5 + i];
            }
            if (!strcmp(extension, ".proj"))
            {
                return 1;
            }
        }
        return 0;
    }
    return 1;
}

// ---------------------------------------------------------------------------
// High-level display functions
// ---------------------------------------------------------------------------

char readDir(char device, char filter)
{
    char cnt = 0xff;
    char i;

    previous = (struct DirElement *)0;

    fb_set_attr(mc_menupopup);

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);

    if (dir_open(2, device))
    {
        return 0;
    }

    while (1)
    {
        current = calloc(1, sizeof(direlement_size));

        if (!current)
        {
            dir_close(2);
            vdc_reverse(1);
            return 0;
        }

        if (dir_readentry(2, &(current->dirent)))
        {
            free(current);
            break;
        }

        // Print progress bar
        if ((cnt >> 2) >= 36)
        {
            cnt = 0;
            vdc_reverse(1);
            vdc_clear(DIRX, DIRY + 3, CH_SPACE, DIRW, 1);
            sprintf(linebuffer, "[%02u]", device);
            vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
        }
        else
        {
            vdcwin_cursor_move(&fb_win, DIRX + 4 + (cnt >> 2), DIRY + 3);
            vdc_reverse(!progressRev[cnt & 3]);
            vdcwin_put_char(&fb_win, progressBar[cnt & 3]);
            ++cnt;
        }

        if (!cwd.name[0])
        {
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
            free(current);
        }
        else
        {
            if (current->dirent.type == CBM_T_FREE)
            {
                cwd.free = current->dirent.size;
                free(current);
            }
            else
            {
                if (dir_validentry(filter))
                {
                    if (cwd.firstelement == 0)
                    {
                        cwd.firstelement = current;
                        previous = current;
                    }
                    else
                    {
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
    }
    dir_close(2);
    vdc_reverse(1);

    if (cwd.firstelement)
    {
        cwd.selected = cwd.firstelement;
        cwd.firstprinted = cwd.firstelement;
        return 1;
    }
    else
    {
        return 0;
    }
}

void drawDirFrame(char device)
{
    vdc_clear(DIRX, DIRY + 3, CH_SPACE, 40, DIRH + 2);
    sprintf(linebuffer, "[%02u] %.20s", device, cwd.name);
    vdc_prints(DIRX + 1, DIRY + 3, linebuffer);
    sprintf(linebuffer, "%u blocks free", cwd.free);
    vdc_prints(DIRX + 1, DIRY + DIRH + 4, linebuffer);
}

static void printElementPriv(const char ypos)
{
    fb_set_attr(mc_pd_normal);
    if (current == cwd.selected)
    {
        fb_set_attr(mc_pd_select);
    }

    vdcwin_cursor_move(&fb_win, DIRX + 2, ypos);
    strcpy(linebuffer, current->dirent.name);
    sprintf(linebuffer2, (current->dirent.size < 10000) ? "%4u %-16s " : "%u %-15s ", current->dirent.size, linebuffer);
    vdcwin_put_string(&fb_win, linebuffer2);

    strcpy(linebuffer2, fileTypeToStr(current->dirent.type));
    if (current->dirent.size >= 10000 && strlen(current->dirent.name) == 16)
    {
        linebuffer2[0] = linebuffer2[1];
        linebuffer2[1] = linebuffer2[2];
        linebuffer2[2] = 0;
    }
    vdcwin_put_string(&fb_win, linebuffer2);
    fb_set_attr(mc_menupopup);
}

void printDir(char device)
{
    unsigned idx = 0;

    if (!cwd.firstelement)
    {
        vdcwin_clear(&fb_win);
        return;
    }

    drawDirFrame(device);

    current = cwd.firstprinted;

    for (idx = 0; (current != 0) && (idx < DIRH); ++idx)
    {
        printElementPriv(idx + DIRY + 4);
        current = current->next;
    }

    for (; idx < DIRH; ++idx)
    {
        vdc_clear(DIRX, idx + DIRY + 4, CH_SPACE, 40, 1);
    }
}

void refreshDir(char device, char filter)
{
    if (readDir(device, filter))
    {
        cwd.selected = cwd.firstelement;
        printDir(device);
    }
    else
    {
        drawDirFrame(device);
        vdc_prints(DIRX + 1, DIRY + 4, "No valid directory entries found.");
    }
}

static void updateMenu(void)
{
    char menuy = DIRY + 2;

    fb_set_attr(mc_menupopup);
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
// Select a file from the directory list.
// Callers in overlay3.c and import_dialogue wrap this with vdcwin_win_new/free
// for popup background save/restore. The prg_gen utility calls this directly.
{
    unsigned pos = 0;
    char lastpage = 0;
    char nextpage = 0;
    unsigned ypos, yoff;
    char count;
    char selected = 0;

    vdcwin_init(&fb_win, 0, 0, 80, 25);

    memset(&cwd, 0, sizeof(cwd));
    memset(disk_id_buf, 0, DISK_ID_LEN);
    memset(&filename, 0, sizeof(filename));

    fb_set_attr(mc_menupopup);
    vdc_clear(DIRX, DIRY, CH_SPACE, DIRW, DIRH + 6);

    vdc_underline(1);
    vdc_prints(DIRX + 1, DIRY + 1, "Select the file to load");
    vdc_underline(0);

    refreshDir(targetdevice, filter);
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
            if (++targetdevice > MAXDEVID)
            {
                targetdevice = 8;
            }
            memset(&cwd, 0, sizeof(cwd));
            refreshDir(targetdevice, filter);
            break;

        case '-':
            if (--targetdevice < 8)
            {
                targetdevice = MAXDEVID;
            }
            memset(&cwd, 0, sizeof(cwd));
            refreshDir(targetdevice, filter);
            break;

        case 't':
        case CH_HOME:
            if (cwd.firstelement)
            {
                cwd.selected = cwd.firstelement;
                cwd.firstprinted = cwd.firstelement;
                cwd.pos = 0;
                printDir(targetdevice);
            }
            break;

        case 'e':
            if (cwd.firstelement)
            {
                current = cwd.firstelement;
                // Fix: reset firstprinted before scanning to avoid stale page pointer
                cwd.firstprinted = cwd.firstelement;
                pos = 0;
                while (1)
                {
                    if (current->next != 0)
                    {
                        current = current->next;
                        lastpage = pos / DIRH;
                        pos++;
                        nextpage = pos / DIRH;
                        if (lastpage != nextpage)
                        {
                            cwd.firstprinted = current;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                cwd.selected = current;
                cwd.pos = pos;
                printDir(targetdevice);
            }
            break;

        case CH_ESC:
        case CH_STOP:
            selected = 2;
            break;

        case CH_CURS_DOWN:
            if (cwd.firstelement && cwd.selected && current->next)
            {
                current = current->next;
                cwd.selected = current;
                nextpage = (pos + 1) / DIRH;
                cwd.pos++;
                if (lastpage != nextpage)
                {
                    cwd.firstprinted = current;
                    printDir(targetdevice);
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
            if (cwd.firstelement && cwd.selected && current->prev)
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
                    printDir(targetdevice);
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

        case CH_ENTER:
            if (cwd.firstelement && cwd.selected)
            {
                selected = 1;
                strcpy(filename, current->dirent.name);
            }
            break;

        // Page down
        case 'p':
            if (cwd.firstelement && current->next)
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
                printDir(targetdevice);
            }
            break;

        // Page up
        case 'u':
            if (cwd.firstelement && current->prev)
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
                printDir(targetdevice);
            }
            break;
        }
    } while (!selected);

    if (cwd.name[0])
    {
        freeDir();
    }

    vdc_clear(DIRX, DIRY, CH_SPACE, DIRW, DIRH + 6);

    if (selected == 1)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
