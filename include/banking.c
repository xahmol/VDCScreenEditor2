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
#include "banking.h"
#include "peekpoke.h"
#include "vdc_core.h"

// Section and region for low memory area overlay
#pragma overlay(vdcselmc, 1)
#pragma section(bcode1, 0)
#pragma section(bdata1, 0)
#pragma section(bbss1, 0)
#pragma region(bank1, 0x1300, 0x1b00, , 1, { bcode1, bdata1, bbss1  } )

#pragma code(code)
#pragma data(data)
#pragma bss(bss)

char bootdevice;
const char progressBar[4] = {0xA5, 0xA1, 0xA7, ' '};
const char progressRev[4] = {0, 0, 1, 1};
char disk_id_buf[5];
struct DirElement direlement_size;
struct DirElement *previous;
struct DirElement *current;
struct DirElement *next;
struct Directory cwd;
const char *value2hex = "0123456789abcdef";
const char *reg_types[] = {"SEQ", "PRG", "URS", "REL", "VRP"};
const char *oth_types[] = {"DEL", "CBM", "DIR", "LNK", "OTH", "HDR"};
char bad_type[4];
char linebuffer2[81];

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
	load_overlay("vdcselmc");
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

unsigned bnk_readw(char cr, volatile unsigned *p)
// Function to read a word from given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	unsigned w = *p;
	mmu.cr = old;
	return w;
}

void bnk_writeb(char cr, volatile char *p, char b)
// Function to write a byte to given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = b;
	mmu.cr = old;
}

void bnk_writew(char cr, volatile unsigned *p, unsigned w)
// Function to write a word to given address with specified banking config register value
{
	char old = mmu.cr;
	mmu.cr = cr;
	*p = w;
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

void bnk_cpytovdc(unsigned vdcdest, char scr, volatile char *sp, unsigned size)
// Menory copy of size bytes from source bank/address to destination VDC address
{
	char old = mmu.cr;
	mmu.cr = BNK_DEFAULT;
	vdc_mem_addr(vdcdest);

	while (size > 0)
	{
		mmu.cr = scr;
		char c = *sp++;
		mmu.cr = BNK_DEFAULT;
		vdc_write(c);
		size--;
	}
	mmu.cr = old;
}

void bnk_cpyfromvdc(char dcr, volatile char *dp, unsigned vdcsrc, unsigned size)
// Menory copy of size bytes from source VDC address to destination bank/address
{
	char old = mmu.cr;
	while (size > 0)
	{
		mmu.cr = BNK_DEFAULT;
		char c = vdc_mem_read_at(vdcsrc++);
		mmu.cr = dcr;
		*dp++ = c;
		mmu.cr = BNK_DEFAULT;
		size--;
	}
	mmu.cr = old;
}

void bnk_redef_charset(unsigned vdcdest, char scr, volatile char *sp, unsigned size)
// Function to copy charset definition from normal memory to VDC
// Input: Source normal memory address and bank config where charset defintion resides,
//		  Destination address in VDC memory,
//		  Numbers of characters to redefine.
// Takes charset definition of 8 bytes per character as input.
// Destination address should be the location pointed as character definition address
{
	char old = mmu.cr;
	mmu.cr = BNK_DEFAULT;
	vdc_mem_addr(vdcdest);

	while (size > 0)
	{
		// Copy charset data per char
		for (char i = 0; i < 8; i++)
		{
			mmu.cr = scr;
			char c = *sp++;
			mmu.cr = BNK_DEFAULT;
			vdc_write(c);
		}
		// Add 8 byte zero padding needed for charsets of 8 bytes high
		for (char i = 0; i < 8; i++)
		{
			vdc_write(0);
		}
		size--;
	}
	mmu.cr = old;
}

void freeDir()
{
    if (!cwd.name[0])
        return;

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
// Closse a directory opened for reading
{
    // Reset channels
    krnio_clrchn();

    // Close file
    krnio_close(lfn);
}

char dir_open(char lfn, unsigned char device)
// Open a directory for reading
{

    // Set name for directory
    krnio_setbnk(0, 0);
    krnio_setnam("$");

    // Open the directory
    if (krnio_open(lfn, device, 0))
    {
        // Switch input to file
        if (krnio_chkin(lfn))
        {
            // Skip BASIC load address
            krnio_chrin();
            krnio_chrin();

            if (krnio_pstatus[lfn])
            {
                dir_close(lfn);
            }
        }
        else
        {
            dir_close(lfn);
        }
    }

    // Return error code or 0 on succcess
    return krnio_pstatus[lfn];
}

char dir_readentry(const char lfn, struct DirEntry *l_dirent)
// Read the next directory entry
{
    char b, len;
    char i = 0;

    // check that device is ready
    b = krnio_chrin();
    if (!b)
    {
        // No entry found
        return 1;
    }
    if (krnio_pstatus[lfn])
    {
        return 7;
    }

    // Skip second basic link byte
    krnio_chrin();

    // read file size
    l_dirent->size = krnio_chrin();
    l_dirent->size |= (krnio_chrin()) << 8;

    // read line into linebuffer
    memset(linebuffer, 0, sizeof(linebuffer));
    while (1)
    {
        // read byte
        b = krnio_chrin();
        // EOL?
        if (b == 0)
        {
            break;
        }
        // append to linebuffer
        if (i < sizeof(linebuffer))
        {
            linebuffer[i++] = b;
        }
        // return if reading had error
        if (krnio_pstatus[lfn])
        {
            krnio_clrchn();
            return 2;
        }
    }

    // handle "B" BLOCKS FREE
    if (linebuffer[0] == 'b')
    {
        l_dirent->type = CBM_T_FREE;
        return 0;
    }

    // check that we have a minimum amount of characters to work with
    if (i < 5)
    {
        return 3;
    }

    // strip whitespace from right part of line
    for (len = i; len > 0; --len)
    {
        b = linebuffer[len];
        if (b == 0 ||
            b == ' ' ||
            b == 0xA0)
        {
            linebuffer[len] = 0;
            continue;
        }
        ++len;
        break;
    }

    // parse file name

    // skip until first "
    for (i = 0; i < sizeof(linebuffer) && linebuffer[i] != '"'; ++i)
    {
        // do nothing
    }

    // copy filename, until " or max size
    b = 0;
    for (++i; i < sizeof(linebuffer) && linebuffer[i] != '"' && b < 16; ++i)
    {
        l_dirent->name[b++] = linebuffer[i];
    }

    // check file type
    if (X('p', 'r', 'g'))
    {
        l_dirent->type = CBM_T_PRG;
    }
    else if (X('s', 'e', 'q'))
    {
        l_dirent->type = CBM_T_SEQ;
    }
    else if (X('u', 's', 'r'))
    {
        l_dirent->type = CBM_T_USR;
    }
    else if (X('d', 'e', 'l'))
    {
        l_dirent->type = CBM_T_DEL;
    }
    else if (X('r', 'e', 'l'))
    {
        l_dirent->type = CBM_T_REL;
    }
    else if (X('c', 'b', 'm'))
    {
        l_dirent->type = CBM_T_CBM;
    }
    else if (X('d', 'i', 'r'))
    {
        l_dirent->type = CBM_T_DIR;
    }
    else if (X('v', 'r', 'p'))
    {
        l_dirent->type = CBM_T_VRP;
    }
    else if (X('l', 'n', 'k'))
    {
        l_dirent->type = CBM_T_LNK;
    }
    else
    {
        // parse header
        l_dirent->type = CBM_T_HEADER;

        // skip one character which should be "
        if (linebuffer[i] == '"')
        {
            ++i;
        }
        // skip one character which should be space
        if (linebuffer[i] == ' ')
        {
            ++i;
        }

        // copy disk ID
        for (b = 0; b < DISK_ID_LEN; ++b)
        {
            if (linebuffer[i])
            {
                disk_id_buf[b] = linebuffer[i];
            }
            i++;
        }
        disk_id_buf[b] = 0;

        // strip disk name
        for (b = 15; b > 0; --b)
        {
            if (l_dirent->name[b] == 0 ||
                l_dirent->name[b] == ' ' ||
                l_dirent->name[b] == 0xA0)
            {
                l_dirent->name[b] = 0;
                continue;
            }
            break;
        }

        return 0;
    }

    // parse read-only
    l_dirent->access = (linebuffer[i - 4] == 0x3C) ? CBM_A_RO : CBM_A_RW;

    return 0;
}

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

__asm sid_interrupt
// SID play IRQ routine
{
	// Check if music is paused
	lda sid_pause
	bne sid_oldirq

	// Store old MMU config and change to bank 1 wkth I/O ($7e)
	lda $ff00
	sta sid_oldcr
	lda #BNK_1_IO
	sta $ff00
	
	// Play frame
	jsr $2003
	
	// Restore memory configuration
	lda sid_oldcr
	sta $ff00

	// jump to old irq
	lda sid_irq
	sta sid_oldirq+1
	lda sid_irq+1
	sta sid_oldirq+2
sid_oldirq:
	jmp $fa65
}

void sid_startmusic()
// Start SID music
// Assumes a SID file with:
// - init address = $2000
// - play frame address = $2003;
// - zp address use between $fc and $fe
{
	// Safeguard MMU and zeropage values and set new MMU CR
	char old = mmu.cr;
	mmu.cr = BNK_1_IO;

	// Call SID init routine and set new IRQ vector
	__asm
		{
		sei
		lda #BNK_1_IO
		sta $ff00
		lda #$00
		jsr $2000
							
		lda $314							
		sta sid_irq									
        lda #<sid_interrupt					
		sta $314							
		lda $315							
		sta sid_irq+1										
        lda #>sid_interrupt					
		sta $315
		cli
		}

	// Restore MMU and zeropage values
	mmu.cr = old;
}

void sid_resetsid()
// Resets SID and silences presently played notes
{
	// Reset SID
	__asm 
	{
		ldx #$18
        lda #$00
rst1:    
        sta $d400,x
        dex
        bpl rst1
 
        lda #$08
        sta $d404
        sta $d40b
        sta $d412 
        ldx #$03
rst2:       
        bit $d011
        bpl *-3
        bit $d011
        bmi *-3
        dex
        bpl rst2
 
        lda #$00
        sta $d404
        sta $d40b
        sta $d412
        lda #$00
        sta $d418
	}
}

void sid_stopmusic()
// Stops music and restores original IRQ vector
{
	// Restore IRQ vector
	__asm 
	{
		sei 
		ldx sid_irq
		ldy sid_irq+1
		stx $314
		sty $315
		cli
	}
	sid_resetsid();
}

void sid_pausemusic()
// Toggles pause / unpause of music
{
	sid_pause != sid_pause;
	sid_resetsid();
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

bool bnk_iec_active(char device)
// Return if device is active at specified IEC ID
{
	__asm
	{
		lda device
		ldy #0
		sty STATUS
		jsr LISTEN
		lda #$ff
		jsr SECOND
		lda STATUS
		bpl iec_pres_active
		jsr UNLSN
		lda #0
		sta accu
		rts
iec_pres_active:
		jsr UNLSN
    	lda #1
		sta accu
	}
}
#pragma native(bnk_iec_active)

#pragma code(code)
#pragma data(data)
#pragma bss(bss)