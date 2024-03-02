/*
Oscar64 VDC Demo

Testing and demonstrating my C128 VDC functions for the Oscar64 C compiller

Written in 2024 by Xander Mol

https://github.com/xahmol/Oscar64Test

https://www.idreamtin8bits.com/

Credit to included music:

-   Music by Nordischsound:

    Ultimate Axel F.                    https://csdb.dk/release/?id=228585

    Faded                               https://csdb.dk/release/?id=229218

Credit to included PESTCII art:

-	PETSCII art:
	Love is the Drug, art by Lobo. https://csdb.dk/release/?id=237148

-	Text scroller PETSCII font:
	Small Round Font by Cupid. https://csdb.dk/release/?id=188169

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

// Create bootsector for building the disk images
// Credit to Scott Robison for this method    

#include <petscii.h>

#pragma section( startup, 0 )
#pragma region( startup, 0x0b00, 0x0bff, , , {startup})
#pragma region( main, 0x0bff, 0x0c00, , , {code, bss, heap, data})
#pragma heapsize(0)

#define executable "vdcse"

__export char pad[1] = {0};

__asm startup
{
	byt	"cbm"

	byt 0, 0

	byt 0
	byt 0

	byt "vdc screen editor", 0

	byt 0

    lda $BA
    and #3
    tay

    lda CMD_LO,y
    tax
    lda CMD_HI,Y
    tay

    jmp $AFA5

CMD_8:
  	byt "run", $22, executable, $22, ",u8", $00
CMD_9:
  	byt "run", $22, executable, $22, ",u9", $00
CMD_10:
  	byt "run", $22, executable, $22, ",u10", $00
CMD_11:
  	byt "run", $22, executable, $22, ",u11", $00

CMD_LO:
	byt <[CMD_8 - 1], <[CMD_9 - 1], <[CMD_10 - 1], <[CMD_11 - 1]
CMD_HI:
	byt >[CMD_8 - 1], >[CMD_9 - 1], >[CMD_10 - 1], >[CMD_11 - 1]

}

#pragma startup(startup)