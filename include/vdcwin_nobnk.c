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
#include <c128/vdc.h>
#include "vdcwin_nobnk.h"
#include "vdc_nobnk.h"
#include "peekpoke.h"

static inline void copy_fwd(unsigned sdp, const unsigned ssp, unsigned cdp, const unsigned csp, char n)
// Copy of a line direct from VDC source to VDC destination (for vertical based copy)
{
	// Screen copy
	vdc_block_copy(sdp, ssp, n);
	// Color copy
	vdc_block_copy(cdp, csp, n);
}

static inline void copy_bwd(unsigned sdp, const unsigned ssp, unsigned cdp, const unsigned csp, char n)
// Copy of a line from VDC source via swap memory to VDC destination (for horizontal based copy)
{
	// Check if swap memory is available given screenmode and VDC memory size
	if (!vdc_state.memextended && vdc_state.swap_text > 0x3ff)
	{
		// Screen copy via linebuffer
		vdc_cpyfromvdc(linebuffer, ssp, n);
		vdc_cpytovdc(sdp, linebuffer, n);
		// Color copy via linebuffer
		vdc_cpyfromvdc(linebuffer, csp, n);
		vdc_cpytovdc(cdp, linebuffer, n);
	}
	else
	{
		// Screen copy via swap VDC memory
		vdc_block_copy(vdc_state.swap_text, ssp, n);
		vdc_block_copy(sdp, vdc_state.swap_text, n);
		// Color copy via swap VDC memory
		vdc_block_copy(vdc_state.swap_text, csp, n);
		vdc_block_copy(cdp, vdc_state.swap_text, n);
	}
}

void vdcwin_init(struct VDCWin *win, char sx, char sy, char wx, char wy)
// Initialize the VDCWin structure for the given screen and coordinates, does not clear the window
{
	win->sx = sx;
	win->sy = sy;
	win->wx = wx;
	win->wy = wy;
	win->cx = 0;
	win->cy = 0;
	win->sp = vdc_state.base_text + vdc_coords(sx, sy);
	win->cp = vdc_state.base_attr + vdc_coords(sx, sy);
}

void vdcwin_clear(struct VDCWin *win)
// Clear the window
{
	vdcwin_fill(win, ' ');
}

void vdcwin_fill(struct VDCWin *win, char ch)
// Fill the window with the given character and the active attributes
{
	vdc_clear(win->sx, win->sy, ch, win->wx, win->wy);
}

void vdcwin_cursor_toggle(struct VDCWin *win)
// Show or hide the cursor by setting or clearing the reverse attribute
{
	unsigned cp = vdc_state.base_attr + vdc_coords(win->sx + win->cx, win->sy + win->cy);
	char attr = vdc_mem_read_at(cp);
	attr ^= VDC_A_REVERSE;
	attr ^= VDC_A_BLINK;
	vdc_mem_write_at(cp, attr);
}

void vdcwin_cursor_move(struct VDCWin *win, char cx, char cy)
// Move the cursor to the given location
{
	win->cx = cx;
	win->cy = cy;
}

bool vdcwin_cursor_left(struct VDCWin *win)
// Move the cursor left in the window, returns true if the cursor could be moved
{
	if (win->cx > 0)
	{
		win->cx--;
		return true;
	}

	return false;
}

bool vdcwin_cursor_right(struct VDCWin *win)
// Move the cursor right in the window, returns true if the cursor could be moved
{
	if (win->cx + 1 < win->wx)
	{
		win->cx++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_up(struct VDCWin *win)
// Move the cursor up in the window, returns true if the cursor could be moved
{
	if (win->cy > 0)
	{
		win->cy--;
		return true;
	}

	return false;
}

bool vdcwin_cursor_down(struct VDCWin *win)
// Move the cursor down in the window, returns true if the cursor could be moved
{
	if (win->cy + 1 < win->wy)
	{
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_newline(struct VDCWin *win)
// Go to next line
{
	win->cx = 0;
	if (win->cy + 1 < win->wy)
	{
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_forward(struct VDCWin *win)
// Move cursor position forward
{
	if (win->cx + 1 < win->wx)
	{
		win->cx++;
		return true;
	}
	else if (win->cy + 1 < win->wy)
	{
		win->cx = 0;
		win->cy++;
		return true;
	}

	return false;
}

bool vdcwin_cursor_backward(struct VDCWin *win)
// Move cursor position backward
{
	if (win->cx > 0)
	{
		win->cx--;
		return true;
	}
	else if (win->cy > 0)
	{
		win->cx = win->wx - 1;
		win->cy--;
		return true;
	}

	return false;
}

// PETSCII to and from screencode conversion tables
static char p2smap[] = {0x00, 0x00, 0x40, 0x20, 0x80, 0xc0, 0x80, 0x80};
static char s2pmap[] = {0x40, 0x00, 0x20, 0xc0, 0xc0, 0x80, 0xa0, 0x40};

static inline char p2s(char ch)
// PETSCII to screencode conversion
{
	return ch ^ p2smap[ch >> 5];
}

static inline char s2p(char ch)
// Screencode to PETSCII converion
{
	return ch ^ s2pmap[ch >> 5];
}

void vdcwin_read_string(struct VDCWin *win, char *buffer)
// Read the full window into a string
{
	unsigned sp = win->sp;

	char i = 0;
	for (char y = 0; y < win->wy; y++)
	{
		for (char x = 0; x < win->wx; x++)
		{
			buffer[i++] = s2p(vdc_mem_read_at(sp + x));
		}
		sp += vdc_state.width;
	}
	while (i > 0 && buffer[i - 1] == ' ')
		i--;
	buffer[i] = 0;
}

void vdcwin_write_string(struct VDCWin *win, const char *buffer)
// Write the fill window with the given string
{
	unsigned dp = win->sp;
	for (char y = 0; y < win->wy; y++)
	{
		for (char x = 0; x < win->wx; x++)
		{
			char ch = *buffer;
			if (ch)
			{
				vdc_mem_write_at(dp + x, p2s(ch));
				buffer++;
			}
			else
				vdc_mem_write_at(dp + x, ' ');
		}
		dp += vdc_state.width;
	}
}

void vdcwin_put_char(struct VDCWin *win, char ch)
// Put a single char at the cursor location and advance the cursor
{
	vdcwin_putat_char(win, win->cx, win->cy, ch);
	win->cx++;
	if (win->cx == win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}
}

void vdcwin_put_chars(struct VDCWin *win, const char *chars, char num)
// Put an array of chars at the cursor location and advance the cursor
{
	vdcwin_putat_chars(win, win->cx, win->cy, chars, num);
	win->cx += num;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}
}

char vdcwin_put_string(struct VDCWin *win, const char *str)
// Put a zero terminated string at the cursor location and advance the cursor
{
	char n = vdcwin_putat_string(win, win->cx, win->cy, str);
	win->cx += n;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}
	return n;
}

void vdcwin_put_char_raw(struct VDCWin *win, char ch)
// Put a single raw char at the cursor location and advance the cursor
{
	vdcwin_putat_char_raw(win, win->cx, win->cy, ch);
	win->cx++;
	if (win->cx == win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}
}

void vdcwin_put_chars_raw(struct VDCWin *win, const char *chars, char num)
// Put an array of raw chars at the cursor location and advance the cursor
{
	vdcwin_putat_chars_raw(win, win->cx, win->cy, chars, num);
	win->cx += num;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}
}

char vdcwin_put_string_raw(struct VDCWin *win, const char *str)
// Put a zero terminated raw string at the cursor location and advance the cursor
{
	char n = vdcwin_putat_string_raw(win, win->cx, win->cy, str);
	win->cx += n;
	if (win->cx >= win->wx)
	{
		win->cx = 0;
		win->cy++;
		if (win->cy == win->wy)
		{
			win->cy--;
			vdcwin_printline(win, "");
		}
	}

	return n;
}

void vdcwin_putat_char(struct VDCWin *win, char x, char y, char ch)
// Put a single char at the given window location
{
	vdc_printc(win->sx + x, win->sy + y, p2s(ch), vdc_state.text_attr);
}

#pragma native(vdcwin_putat_char)

void vdcwin_putat_chars(struct VDCWin *win, char x, char y, const char *chars, char num)
// Put an array of chars at the given window location
{
	for (char i = 0; i < num; i++)
	{
		vdc_printc(win->sx + x + i, win->sy + y, p2s(chars[i]), vdc_state.text_attr);
	}
}

#pragma native(vdcwin_putat_chars)

char vdcwin_putat_string(struct VDCWin *win, char x, char y, const char *str)
// Put a zero terminated string at the given window location
{
	char i = 0;
	char ch;
	while (ch = str[i])
	{
		vdc_printc(win->sx + x + i, win->sy + y, p2s(ch), vdc_state.text_attr);
		i++;
	}

	return i;
}

#pragma native(vdcwin_putat_string)

void vdcwin_putat_char_raw(struct VDCWin *win, char x, char y, char ch)
// Put a single raw char at the given window location
{
	vdc_printc(win->sx + x, win->sy + y, ch, vdc_state.text_attr);
}

#pragma native(vdcwin_putat_char_raw)

void vdcwin_putat_chars_raw(struct VDCWin *win, char x, char y, const char *chars, char num)
// Put an array of raw chars at the given window location
{
	for (char i = 0; i < num; i++)
	{
		vdc_printc(win->sx + x + i, win->sy + y, chars[i], vdc_state.text_attr);
	}
}

#pragma native(vdcwin_putat_chars_raw)

char vdcwin_putat_string_raw(struct VDCWin *win, char x, char y, const char *str)
// Put a zero terminated string at the given window location
{
	char i = 0;
	char ch;
	while (ch = str[i])
	{
		vdc_printc(win->sx + x + i, win->sy + y, ch, vdc_state.text_attr);
		i++;
	}

	return i;
}

#pragma native(vdcwin_putat_string_raw)

char vdcwin_getat_char(struct VDCWin *win, char x, char y)
// Get a single char at the given window location
{
	unsigned sp = win->sp + vdc_coords(x, y);

	return s2p(vdc_mem_read_at(sp));
}

#pragma native(vdcwin_getat_char)

void vdcwin_getat_chars(struct VDCWin *win, char x, char y, char *chars, char num)
// Get an array of chars at the given window location
{
	unsigned sp = win->sp + vdc_coords(x, y);

	for (char i = 0; i < num; i++)
	{
		chars[i] = s2p(vdc_mem_read_at(sp + i));
	}
}

#pragma native(vdcwin_getat_chars)

char vdcwin_getat_char_raw(struct VDCWin *win, char x, char y)
// Get a single char at the given window location
{
	unsigned sp = win->sp + vdc_coords(x, y);

	return vdc_mem_read_at(sp);
}

#pragma native(vdcwin_getat_chars_raw)

void vdcwin_getat_chars_raw(struct VDCWin *win, char x, char y, char *chars, char num)
// Get an array of chars at the given window location
{
	unsigned sp = win->sp + vdc_coords(x, y);

	for (char i = 0; i < num; i++)
	{
		chars[i] = vdc_mem_read_at(sp + i);
	}
}

#pragma native(vdcwin_put_rect_raw)

void vdcwin_put_rect_raw(struct VDCWin *win, char x, char y, char w, char h, const char *chars)
// Put an array of raw characters into a rectangle in the char win
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;
	unsigned cp = win->cp + offset;

	for (char i = 0; i < h; i++)
	{
		vdc_cpytovdc(sp, chars, w);
		vdc_block_fill(cp, vdc_state.text_attr, w);
		chars += w;
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

#pragma native(vdcwin_put_rect)

void vdcwin_put_rect(struct VDCWin *win, char x, char y, char w, char h, const char *chars)
// Put an array of characters into a rectangle in the char win
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;
	unsigned cp = win->cp + offset;

	for (char i = 0; i < h; i++)
	{

		for (char j = 0; j < w; j++)
		{
			vdc_mem_write_at(sp + j, p2s(PEEK(chars + j)));
			vdc_mem_write_at(cp + j, vdc_state.text_attr);
		}

		chars += w;
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

#pragma native(vdcwin_get_rect_raw)

void vdcwin_get_rect_raw(struct VDCWin *win, char x, char y, char w, char h, char *chars)
// Get an array of raw characters from a rectangle of a char win
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;

	for (char i = 0; i < h; i++)
	{
		vdc_cpyfromvdc(chars, sp, w);
		chars += w;
		sp += vdc_state.width;
	}
}

#pragma native(vdcwin_get_rect)

void vdcwin_get_rect(struct VDCWin *win, char x, char y, char w, char h, char *chars)
// Get an array of characters from a rectangle of a char win
{
	int offset = vdc_coords(x, y);

	unsigned sp = win->sp + offset;

	for (char i = 0; i < h; i++)
	{

		for (char j = 0; j < w; j++)
		{
			POKE(chars + j, s2p(vdc_mem_read_at(sp + j)));
		}

		chars += w;
		sp += vdc_state.width;
	}
}

#pragma native(vdcwin_getat_chars_raw)

void vdcwin_insert_char(struct VDCWin *win)
// Insert one space character at the cursor position
{
	char y = win->wy - 1, rx = win->wx - 1;

	unsigned sp = win->sp + vdc_coords(0, y);
	unsigned cp = win->cp + vdc_coords(0, y);

	while (y > win->cy)
	{
		copy_bwd(sp + 1, sp, cp + 1, cp, rx);

		sp -= vdc_state.width;
		cp -= vdc_state.width;
		vdc_mem_write_at(sp + vdc_state.width, vdc_mem_read_at(sp + rx));
		vdc_mem_write_at(cp + vdc_state.width, vdc_mem_read_at(cp + rx));
		y--;
	}

	sp += win->cx;
	cp += win->cx;
	rx -= win->cx;

	if (rx)
	{
		copy_bwd(sp + 1, sp, cp + 1, cp, rx);
	}

	vdc_mem_write_at(sp, ' ');
}

void vdcwin_delete_char(struct VDCWin *win)
// Delete the character at the cursor position
{
	unsigned sp = win->sp + vdc_coords(0, win->cy);
	unsigned cp = win->cp + vdc_coords(0, win->cy);

	char x = win->cx, rx = win->wx - 1;

	copy_fwd(sp + x, sp + x + 1, cp + x, cp + x + 1, rx - x);

	char y = win->cy + 1;
	while (y < win->wy)
	{
		vdc_mem_write_at(sp + rx, vdc_mem_read_at(sp + vdc_state.width));
		vdc_mem_write_at(cp + rx, vdc_mem_read_at(cp + vdc_state.width));

		sp += vdc_state.width;
		cp += vdc_state.width;

		copy_fwd(sp, sp + 1, cp, cp + 1, rx);

		y++;
	}

	vdc_mem_write_at(sp + rx, ' ');
}

int vdcwin_getch(void)
// Get character function
{
	__asm
	{
		L1:
			jsr	0xffe4
			cmp	#0
			beq	L1
			sta	accu
			lda	#0
			sta	accu + 1
	}
}

int vdcwin_checkch(void)
// Check character functions
{
	__asm
	{
		L1:
			jsr	0xffe4
			sta	accu
			lda	#0
			sta	accu + 1
	}
}

bool vdcwin_edit_char(struct VDCWin *win, char ch)
// Edit the window position using the char as the input
{
	switch (ch)
	{
	case 13:
	case 3:
	case 27:
		return true;

	case 19:
		win->cx = 0;
		win->cy = 0;
		return false;

	case 147:
		vdcwin_clear(win);
		win->cx = 0;
		win->cy = 0;
		return false;

	case 17:
		vdcwin_cursor_down(win);
		return false;

	case 145: // CRSR_UP
		vdcwin_cursor_up(win);
		return false;

	case 29:
		vdcwin_cursor_forward(win);
		return false;

	case 157:
		vdcwin_cursor_backward(win);
		return false;

	case 20:
		if (vdcwin_cursor_backward(win))
			vdcwin_delete_char(win);
		return false;

	default:
		if (ch >= 32 && ch < 128 || ch >= 160)
		{
			if (win->cy + 1 < win->wy || win->cx + 1 < win->wx)
			{
				vdcwin_insert_char(win);
				vdcwin_put_char(win, ch);
			}
		}
		return false;
	}
}

char vdcwin_edit(struct VDCWin *win)
// Edit the window using keyboard input, returns the key the exited the edit, either return or stop
{
	for (;;)
	{
		vdcwin_cursor_toggle(win);
		char ch = vdcwin_getch();
		vdcwin_cursor_toggle(win);

		if (vdcwin_edit_char(win, ch))
			return ch;
	}
}

void vdcwin_scroll_left(struct VDCWin *win, char by)
// Scroll the window left, does not fill the new empty space
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx - by;

	vdc_wait_vblank();
	for (char y = 0; y < win->wy; y++)
	{
		// if(y==0)
		//{
		//	vdc_wait_vblank();
		// }
		// if(y==1)
		//{
		//	vdc_wait_no_vblank();
		// }
		copy_bwd(sp, sp + by, cp, cp + by, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
	vdc_wait_no_vblank();
}

void vdcwin_scroll_right(struct VDCWin *win, char by)
// Scroll the window right, does not fill the new empty space
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx - by;

	for (char y = 0; y < win->wy; y++)
	{
		copy_bwd(sp + by, sp, cp + by, cp, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

void vdcwin_scroll_up(struct VDCWin *win, char by)
// Scroll the window up, does not fill the new empty space
{
	unsigned sp = win->sp;
	unsigned cp = win->cp;

	char rx = win->wx;
	int dst = vdc_state.width * by;

	for (char y = 0; y < win->wy - by; y++)
	{
		copy_fwd(sp, sp + dst, cp, cp + dst, rx);
		sp += vdc_state.width;
		cp += vdc_state.width;
	}
}

void vdcwin_scroll_down(struct VDCWin *win, char by)
// Scroll the window down, does not fill the new empty space
{
	unsigned sp = win->sp + vdc_state.width * win->wy;
	unsigned cp = win->cp + vdc_state.width * win->wy;

	char rx = win->wx;

	int dst = vdc_state.width * by;

	for (char y = 0; y < win->wy - by; y++)
	{
		sp -= vdc_state.width;
		cp -= vdc_state.width;
		copy_fwd(sp, sp - dst, cp, cp - dst, rx);
	}
}

void vdcwin_fill_rect_raw(struct VDCWin *win, char x, char y, char w, char h, char ch)
// Fill the given rectangle with the character and the active color
{
	if (w > 0)
	{
		for (char i = 0; i < h; i++)
		{
			vdc_hchar(win->sx + x, win->sy + y + i, ch, vdc_state.text_attr, w);
		}
	}
}

void vdcwin_fill_rect(struct VDCWin *win, char x, char y, char w, char h, char ch)
// Fill the given rectangle with the screen code and color
{
	vdcwin_fill_rect_raw(win, x, y, w, h, p2s(ch));
}

void vdcwin_printline(struct VDCWin *win, const char *str)
// Print string to window and set cursor at next line, scroll if last line
{
	vdcwin_put_string(win, str);
	win->cx = 0;
	if (win->cy < win->wy - 1)
	{
		win->cy++;
	}
	else
	{
		vdcwin_scroll_up(win, 1);
		vdc_clear(win->sx, win->sy + win->wy - 1, ' ', win->wx, 1);
	}
}

void vdcwin_printwrap(struct VDCWin *win, const char *str)
// Print with line wrap in window
// Adappted from
// https://github.com/sgjava/c3l/blob/main/src/conww.c
// Copyright (c) Steven P. Goldsmith. All rights reserved.
{
	/* Screen width should not exceed buffer size +1 */
	char wrapbuffer[81];
	char i = 0, wordLen, len = strlen(str);
	signed wordStart = -1, wordEnd = -1;
	char maxLine = win->wx, buf = 0, maxBuf = sizeof(wrapbuffer) - 1;
	while (i < len && buf < maxBuf)
	{
		/* Load word buffer using space delimiter */
		while (i < len && wordEnd < 0 && buf < maxBuf)
		{
			/* Find first non space char */
			if (str[i] != ' ')
			{
				if (wordStart < 0)
				{
					wordStart = i;
				}
				wrapbuffer[buf++] = str[i];
			}
			else
			{
				/* End of word including space */
				if (wordEnd < 0)
				{
					wrapbuffer[buf++] = str[i];
					wordEnd = i;
				};
			}
			i++;
		}
		if (buf > 0)
		{
			wrapbuffer[buf] = 0x00;
			wordLen = strlen(wrapbuffer);

			while (wordLen > win->wx)
			{
				vdcwin_printline(win, "");
				vdcwin_put_chars(win, wrapbuffer, win->wx);
				strcpy(wrapbuffer, wrapbuffer + win->wx);
				wordLen = strlen(wrapbuffer);
			}

			if (win->cx + wordLen > maxLine)
			{
				vdcwin_printline(win, "");
			}
			vdcwin_put_string(win, wrapbuffer);
			wordStart = -1;
			wordEnd = -1;
			buf = 0;
		}
	}
}

void vdcwin_viewport_init(struct VDCViewport *vp, char *sourcebase, unsigned sourcewidth, unsigned sourceheight, unsigned viewwidth, unsigned viewheight, char viewsx, char viewsy)
// Initialize a viewport of screen data in memory
// Inpuut: Viewport struct to use and base source dimensions, view window start coord and dimensions
{
	vp->sourcebase = sourcebase;
	vp->sourcewidth = sourcewidth;
	vp->sourceheight = sourceheight;
	vp->sourcexoffset = 0;
	vp->sourceyoffset = 0;
	vdcwin_init(&vp->view, viewsx, viewsy, viewwidth, viewheight);
}

void vdcwin_cpy_viewport(struct VDCViewport *viewport)
// Function to copy a viewport on the source screen map to the VDC
// Input: Initialised viewport struct
{
	// Charachters
	unsigned vdcbase = viewport->view.sp;
	char *address = viewport->sourcebase + (viewport->sourceyoffset * viewport->sourcewidth) + viewport->sourcexoffset;

	for (char i = 0; i < viewport->view.wy; i++)
	{
		vdc_cpytovdc(vdcbase, address, viewport->view.wx);
		vdcbase += vdc_state.width;
		address += viewport->sourcewidth;
	}

	// Attributes
	vdcbase = viewport->view.cp;
	address = viewport->sourcebase + (viewport->sourceyoffset * viewport->sourcewidth) + viewport->sourcexoffset + (viewport->sourceheight * viewport->sourcewidth) + 48;

	for (char i = 0; i < viewport->view.wy; i++)
	{
		vdc_cpytovdc(vdcbase, address, viewport->view.wx);
		vdcbase += vdc_state.width;
		address += viewport->sourcewidth;
	}
}

void vdcwin_viewportscroll(struct VDCViewport *viewport, char direction)
// Function to scroll a viewport on the source screen map on the VDC in the given direction
// Input: Initialised viewport struct and direction
{
	struct VDCViewport vp_fill;

	memcpy(&vp_fill, viewport, sizeof(vp_fill));

	if (direction & SCROLL_LEFT)
	{
		vdcwin_scroll_right(&viewport->view, 1);
		vp_fill.sourcexoffset--;
		viewport->sourcexoffset--;
		vdcwin_init(&vp_fill.view, viewport->view.sx, viewport->view.sy, 1, viewport->view.wy);
	}
	if (direction & SCROLL_RIGHT)
	{
		vdcwin_scroll_left(&viewport->view, 1);
		vp_fill.sourcexoffset += viewport->view.wx;
		viewport->sourcexoffset++;
		vdcwin_init(&vp_fill.view, viewport->view.sx + viewport->view.wx - 1, viewport->view.sy, 1, viewport->view.wy);
	}
	if (direction & SCROLL_UP)
	{
		vdcwin_scroll_down(&viewport->view, 1);
		vp_fill.sourceyoffset--;
		viewport->sourceyoffset--;
		vdcwin_init(&vp_fill.view, viewport->view.sx, viewport->view.sy, viewport->view.wx, 1);
	}
	if (direction & SCROLL_DOWN)
	{
		vdcwin_scroll_up(&viewport->view, 1);
		vp_fill.sourceyoffset += viewport->view.wy;
		viewport->sourceyoffset++;
		vdcwin_init(&vp_fill.view, viewport->view.sx, viewport->view.sy + viewport->view.wy - 1, viewport->view.wx, 1);
	}
	vdcwin_cpy_viewport(&vp_fill);
}

char vdc_softscroll_init(struct VDCSoftScrollSettings *settings, char mode)
// Initialisize virtual screen for softscroll. Returns 1 on succes, 0 in fail
{
	unsigned vdcsize = settings->width * settings->height;
	unsigned sourcesize = vdcsize + vdcsize + 48;

	// Return if virtual screen is too big to leave room for charsets
	if ((sourcesize > 8192 && !vdc_state.memextended) || (sourcesize > 57344))
	{
		return 0;
	}

	vdc_set_mode(mode);

	// Set up new vdc state
	vdc_state.base_text = 0x2000;
	vdc_state.base_attr = 0x2000 + vdcsize;
	vdc_state.char_std = 0x0000;
	vdc_state.char_alt = 0x1000;
	vdc_state.disp_skip = settings->width - vdc_state.width;
	vdc_set_multab();

	// Set up virtual sceen and copy contents to it
	vdc_cls();
	vdc_set_charset_address(vdc_state.char_std);
	vdc_restore_charsets();
	vdc_set_disp_address(vdc_state.base_text, vdc_state.base_attr);
	vdc_reg_write(VDCR_ROWINC, vdc_state.disp_skip);
	vdc_cpytovdc(vdc_state.base_text, settings->source, vdcsize);
	vdc_cpytovdc(vdc_state.base_attr, settings->source + vdcsize + 48, vdcsize);

	// Init scroll settings
	settings->addr_offset = 0;
	settings->hscroll = 0;
	settings->vscroll = 0;
	settings->vscroll_base = vdc_reg_read(VDCR_VSCROLL) & 0xf0;
	settings->hscroll_def = vdc_reg_read(VDCR_HSCROLL) & 0x0f;
	settings->hscroll_base = vdc_reg_read(VDCR_HSCROLL) & 0xf0;
	settings->xoff = 0;
	settings->yoff = 0;
	return 1;
}

void vdc_softscroll_exit(struct VDCSoftScrollSettings *settings, char mode)
// Exit soft scroll virtual screen
{
	vdc_cls();
	vdc_reg_write(VDCR_ROWINC, 0);
	vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base);
	vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll_def);
	vdc_set_mode(mode);
}

void vdc_softscroll_down(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll down
{
	vdc_pass_vblank();
	settings->vscroll += step;
	if (settings->vscroll > 8 - step)
	{
		if (settings->yoff < settings->height - vdc_state.height - 1)
		{
			settings->vscroll = 0;
			settings->yoff++;
			settings->addr_offset += settings->width;
			vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base);
			vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
		}
		else
		{
			settings->vscroll -= step;
		}
	}
	else
	{
		vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
	}
}

void vdc_softscroll_up(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll up
{
	vdc_pass_vblank();
	if (settings->vscroll > step - 1)
	{
		settings->vscroll -= step;
		vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
	}
	else
	{
		if (settings->yoff)
		{
			settings->vscroll = 8 - step;
			settings->yoff--;
			settings->addr_offset -= settings->width;
			vdc_reg_write(VDCR_VSCROLL, settings->vscroll_base + settings->vscroll);
			vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
		}
	}
}

void vdc_softscroll_right(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll right
{
	if (settings->hscroll > step - 1)
	{
		settings->hscroll -= step;
		vdc_wait_vblank();
		vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
		vdc_wait_no_vblank();
	}
	else
	{
		if ((settings->xoff + 1) < settings->width - vdc_state.width)
		{
			settings->hscroll = 8 - step + settings->hscroll_def % step;
			settings->xoff++;
			settings->addr_offset++;
			vdc_wait_no_vblank();
			vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
			vdc_wait_vblank();
			vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
		}
	}
}

void vdc_softscroll_left(struct VDCSoftScrollSettings *settings, char step)
// Do a soft scroll left
{
	settings->hscroll += step;
	if (settings->hscroll > 8 - step)
	{
		if (settings->xoff)
		{
			settings->hscroll = settings->hscroll_def % step;
			settings->xoff--;
			settings->addr_offset--;
			vdc_wait_no_vblank();
			vdc_set_disp_address(vdc_state.base_text + settings->addr_offset, vdc_state.base_attr + settings->addr_offset);
			vdc_wait_vblank();
			vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base);
		}
		else
		{
			settings->hscroll = settings->hscroll_def;
			vdc_wait_vblank();
			vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
			vdc_wait_no_vblank();
		}
	}
	else
	{
		vdc_wait_vblank();
		vdc_reg_write(VDCR_HSCROLL, settings->hscroll_base + settings->hscroll);
		vdc_wait_no_vblank();
	}
}
