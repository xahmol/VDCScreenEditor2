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

#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <petscii.h>
#include <c64/kernalio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "c128/vdc.h"
#include "bank_minimal.h"
#include "peekpoke.h"

// Section and region for low memory area overlay
#pragma overlay(vdcse2prglmc, 1)
#pragma section(bcode1, 0)
#pragma section(bdata1, 0)
#pragma section(bbss1, 0)
#pragma region(bank1, 0x1300, 0x1b00, , 1, { bcode1, bdata1, bbss1  } )

#pragma code(code)
#pragma data(data)
#pragma bss(bss)

char bootdevice;

char getcurrentdevice()
// Return last used device number for IO operations. Default on 8 if still zero.
{
	// Feading zeropage address containg current device number ($BA)
	char curunit = *(char *)0xba;

	// Default on 8 if still zero
	if (!curunit)
	{
		curunit = 8;
	}
	return curunit;
}

void load_overlay(const char *fname)
// Loading an overlay file
{
	krnio_setbnk(0, 0);
	krnio_setnam(fname);
	if (!krnio_load(1, bootdevice, 1))
	{
		printf("loading overlay file failed.\n");
		printf("status: %d\n", krnio_pstatus[1]);
		exit(1);
	}
}

void bnk_init()
// Initialise banking functions in low memory
{
	// Get device ID used to load the program
	bootdevice = getcurrentdevice();
	printf("bootdevice: %u\n", bootdevice);

	// Set 8Kb shared memory size
	// So set MMU Ram Configuration Register at:
	// - bit 0-1:   %10 for 8 KB common RAM
	// - bit 2-3:   %01 for bootom of RAM bank 0 is common
	// - bit 7:     $0 for VIC RAM in bank 0
	xmmu.rcr = 0x06;

	// Load overlay in low memory
	printf("loading low memory code.\n");
	load_overlay("vdcse2prglmc");
}

void bnk_exit()
// Retsore to default situtation for shared memory
{
	// Set 8Kb shared memory size
	// So set MMU Ram Configuration Register at:
	// - bit 0-1:   %00 for 1 KB common RAM
	// - bit 2-3:   %01 for bootom of RAM bank 0 is common
	// - bit 7:     $0 for VIC RAM in bank 0
	xmmu.rcr = 0x04;
}

// Now switch code generation to low region
#pragma code(bcode1)
#pragma data(bdata1)
#pragma bss(bbss1)

char sid_irq[2];
char sid_oldcr;
char sid_pause;

char bnk_readb(char cr, volatile char *p)
// Function to read a byte from given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	char c = *p;
	mmu.cr = old;
	return c;
}

void bnk_writeb(char cr, volatile char *p, char b)
// Function to write a byte to given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = b;
	mmu.cr = old;
}

void bnk_memcpy(char dcr, volatile char *dp, char scr, volatile char *sp, unsigned size)
// Menory copy of size bytes from source bank/address to destination source/address
{
	char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = scr;
		char c = *sp++;
		mmu.cr = dcr;
		*dp++ = c;
		size--;
	}
	mmu.cr = old;
}

void bnk_memset(char cr, volatile char *p, char val, unsigned size)
// Fill memory from bank/address with value, size is bytes to fill
{
	char old = mmu.cr;
	mmu.cr = cr;
	while (size > 0)
	{
		*p++ = val;
		size--;
	}
	mmu.cr = old;
}

bool bnk_load(char device, char bank, const char *start, const char *fname)
// Load to the specified bank
{
	krnio_setbnk(bank, 0);
	krnio_setnam(fname);
	__asm
	{
		lda	#1
		ldx	device
		ldy #0		
		jsr	$ffba // setlfs
		
		lda #0
		ldx start
		ldy start+1
		jsr	$FFD5 // load

		lda #0
		bcs W1
		lda #1
	W1: sta accu
	}
	krnio_setbnk(0, 0);
}
#pragma native(bnk_load)

bool bnk_save(char device, char bank, const char *start, const char *end, const char *fname)
// Save from the specified bank
{
	char succes;
	krnio_setbnk(bank, 0);
	krnio_setnam(fname);
	succes = krnio_save(device, start, end);
	krnio_setbnk(0, 0);
	return succes;
}

#pragma code(code)
#pragma data(data)
#pragma bss(bss)