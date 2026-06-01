# Oscar64 Cross-Compiler Manual

Oscar64 is a C99/C++ cross-compiler for the 6502 processor family, targeting Commodore 64, C128, PLUS4, VIC20, NES, Commander X16, and more.

- **Local installation:** `/home/xahmol/oscar64/`
- **Tutorials (local clone):** `/home/xahmol/OscarTutorials/`
- **Source / docs:** https://github.com/drmortalwombat/oscar64
- **Tutorials:** https://github.com/drmortalwombat/OscarTutorials

---

## Table of Contents

1. [Quick Start](#quick-start)
2. [Compiler Flags](#compiler-flags)
3. [Target Machines](#target-machines)
4. [Language Extensions](#language-extensions)
5. [Pragma Directives](#pragma-directives)
6. [Inline Assembly](#inline-assembly)
7. [Embedded Data (#embed)](#embedded-data-embed)
8. [Preprocessor Extensions](#preprocessor-extensions)
9. [PETSCII and Screen Codes](#petscii-and-screen-codes)
10. [Memory Model and Linker Sections](#memory-model-and-linker-sections)
11. [C++ Support](#c-support)
12. [Standard C Library](#standard-c-library)
13. [C64 Hardware Libraries](#c64-hardware-libraries)
14. [C128 Libraries](#c128-libraries)
15. [PLUS4 Libraries](#plus4-libraries)
16. [NES Libraries](#nes-libraries)
17. [Commander X16 Libraries](#commander-x16-libraries)
18. [VIC20 Libraries](#vic20-libraries)
19. [Graphics Libraries (gfx/)](#graphics-libraries-gfx)
20. [Audio Libraries (audio/)](#audio-libraries-audio)
21. [C++ Template Library (opp/)](#c-template-library-opp)
22. [Sample Programs](#sample-programs)
23. [Tips and Gotchas](#tips-and-gotchas)
24. [Tutorials Reference](#tutorials-reference)

---

## Quick Start

```bash
# Basic compile to C64 PRG
oscar64 -tm=c64 -tf=prg -O2 -o=output.prg main.c

# With include path (typical project layout)
oscar64 -tm=c64 -tf=prg -O2 -i=include -o=build/prog.prg src/main.c

# Run in built-in emulator after compile
oscar64 -tm=c64 -tf=prg -e src/main.c

# Create D64 disk image with embedded resource files
oscar64 -tm=c64 -tf=prg -d64=output.d64 -fz=resource.bin src/main.c

# No floating-point (saves space, use fixmath.h instead)
oscar64 -tm=c64 -tf=prg -O2 -dNOFLOAT src/main.c
```

**Multi-file projects:** Oscar64 follows `#pragma compile("file.c")` chains automatically. Put the pragma in each `.h` file. Only include the top-level `.h` in your source — the compiler finds everything else.

---

## Compiler Flags

### Output format (`-tf=`)

| Flag | Output |
|------|--------|
| `-tf=prg` | Commodore PRG (default) |
| `-tf=crt` | EasyFlash CRT (code expanded from bank 0) |
| `-tf=crt8` | Generic 8 KB CRT (0x8000–0xa000, autostart) |
| `-tf=crt16` | Generic 16 KB CRT (0x8000–0xc000, autostart) |
| `-tf=bin` | Raw binary |

### Optimization (`-O`)

| Flag | Effect |
|------|--------|
| `-O0` | No optimization |
| `-O1` / `-O` | Default optimizations |
| `-O2` | Aggressive speed + auto-inline small functions |
| `-O3` | Most aggressive speed |
| `-Os` | Optimize for size |
| `-Oi` | Auto-inline small functions |
| `-Oa` | Optimize inline assembler |
| `-Oz` | Auto-place globals in zero page |
| `-Op` | Optimize constant parameters |
| `-Oo` | Size optimization via outliner |
| `-Ox` | Optimize pointer arithmetic |

### Common flags

| Flag | Effect |
|------|--------|
| `-o=file` | Output filename (default: `output.prg`) |
| `-i=path` | Additional include path |
| `-g` | Debug info: `.lbl` (VICE labels) + `.dbj` (JSON) |
| `-gp` | Debug + static profile data (`.csz`) |
| `-e` | Run in integrated emulator after compile |
| `-ep` | Run + profile in emulator |
| `-pp` | Enable C++ mode |
| `-strict` | Strict ANSI C parsing |
| `-v` / `-v2` | Verbose / more verbose output |
| `-n` | Pure native 6502 code (default) |
| `-bc` | Bytecode for all functions |
| `-xz` | Extended zero page usage |
| `-psci` | PETSCII encoding for all string literals |
| `-rt=file` | Alternative runtime library |
| `-rmp` | Generate error files on linker failure |

### Disk image flags

| Flag | Effect |
|------|--------|
| `-d64=file` | Create D64 disk image |
| `-f=file` | Add raw binary file to disk image |
| `-fz=file` | Add LZO-compressed binary to disk image |

### Cartridge flags

| Flag | Effect |
|------|--------|
| `-cid=n` | Cartridge type ID (for VICE) |
| `-csub=n` | Cartridge sub-type |
| `-cname=s` | Cartridge name |

### Preprocessor defines (`-dSYMBOL` or `-D NAME=VALUE`)

| Symbol | Effect |
|--------|--------|
| `-dNOFLOAT` | Disable float support in `printf` (saves significant code space) |
| `-dNOLONG` | Disable long integer support in `printf` |
| `-dHEAPCHECK` | Check heap alloc/free; JAM if full |
| `-dNOBSSCLEAR` | Don't clear BSS segment on startup |
| `-dNOZPCLEAR` | Don't clear zero page BSS on startup |

### Output files generated

| Extension | Contents |
|-----------|---------|
| `.prg` / `.crt` / `.bin` | Executable |
| `.map` | Memory region, section, and object layout |
| `.asm` | Assembler listing with source line references |
| `.int` | Intermediate code listing |
| `.lbl` | VICE debugger label file (with `-g`) |
| `.dbj` | Full JSON debug info (with `-g`) |
| `.csz` | Annotated code size (with `-gp`) |

---

## Target Machines

| Flag | Machine | Address range |
|------|---------|--------------|
| `c64` | Commodore 64 | 0x0800–0xa000 |
| `c128` | C128 | 0x1c00–0xfc00 |
| `c128b` | C128 first 16 KB | 0x1c00–0x4000 |
| `c128e` | C128 first 48 KB | 0x1c00–0xc000 |
| `plus4` | PLUS4 | 0x1000–0xfc00 |
| `vic20` | VIC20 (no expansion) | 0x1000–0x1e00 |
| `vic20+3` / `+8` / `+16` / `+24` | VIC20 with expansion RAM | — |
| `pet` / `pet16` / `pet32` | PET variants | — |
| `nes` | NES (NROM, MMC1, MMC3 variants available) | — |
| `atari` | Atari 8-bit | 0x2000–0xbc00 |
| `x16` | Commander X16 | 0x0800–0x9f00 |
| `mega65` | MEGA65 | 0x2000–0xc000 |

---

## Language Extensions

Oscar64 extends C with several keywords for 6502-specific features.

### Storage class qualifiers

```c
// Place global in zero page (0x80–0xff). No initialization; incompatible with kernal.
__zeropage int counter;

// Striped array layout: bytes of each field stored contiguously rather than interleaved.
// Faster indexed access on 6502 (no multiply needed).
// LLLLLLLLHHHHHHHH instead of LHLHLHLHLHLHLHLH
__striped struct Sprite sprites[16];
auto p = sprites + i;     // Use 'auto' pointer for striped arrays

// Force symbol into output even if unreferenced
__export char tiles[] = { ... };

// Prevent/force inlining
__noinline void slowfunc(void);
__forceinline void fastfunc(void);

// Compile function to 6502 native code (vs bytecode)
__native void criticalLoop(void);
```

### Interrupt handlers

```c
// __interrupt: saves zero page registers only (lightweight, for software interrupts)
__interrupt void myHandler(void) { ... }

// __hwinterrupt: saves CPU registers, exits with RTI (use for CIA/VIC hardware IRQs)
__hwinterrupt void irqHandler(void) { ... }
```

### Memory consistency

```c
// __memmap volatile: prevents the compiler from reordering memory accesses
// around bank-switching writes
*((volatile __memmap char *)0x01) = MMAP_NO_BASIC;
```

### Compiler hints

```c
__assume(false);         // Mark code path as unreachable
__assume(x < 10);        // Tell optimizer x is bounded (enables faster code)
__assume(p != nullptr);  // Tell optimizer pointer is non-null
```

### Bank queries

```c
int id   = __bankof(someFunction);  // Get bank ID of a function
int mine = __bankof(0);             // Get bank ID of the calling code
```

### `__dynstack`

```c
// Marks a function as using a dynamic stack frame (required for setjmp/longjmp)
__dynstack int setjmp(jmp_buf env);
```

---

## Pragma Directives

### Build system

```c
// Auto-compile a .c file when this header is included (replaces makefile rules)
#pragma compile("mylib.c")

// Force native 6502 compilation for one function
#pragma native(MyFunction)

// Force linker to include a symbol even if unreferenced
#pragma reference(someSymbol)
```

### Optimizer control

```c
#pragma optimize(push)                // Save current optimizer settings
#pragma optimize(pop)                 // Restore saved settings
#pragma optimize(0|1|2|3)            // Set optimization level
#pragma optimize(speed|size)         // Optimize for speed or size
#pragma optimize(inline|noinline)    // Control function inlining
#pragma optimize(autoinline)         // Enable auto-inlining
#pragma optimize(asm|noasm)          // Enable/disable asm optimization
#pragma optimize(outline|nooutline)  // Enable/disable code outliner
#pragma optimize(constparams|noconstparams)

// Unroll the immediately following loop
#pragma unroll(full)    // Fully unroll
#pragma unroll(page)    // Unroll to page boundary
for (char i = 0; i < 8; i++)
    data[i] = 0;
```

### Memory layout

```c
// Align a variable or function to a power-of-two boundary
#pragma align(myArray, 256)     // Page-align myArray
#pragma align(myFunc, 256)      // Useful for page-crossing avoidance

// Define a linker section in a specific bank
#pragma section(bcode1, 0)

// Define a memory region (name, start, end, flags, bank, {sections} [,runtime_addr])
#pragma region(main, 0x0a00, 0xd000, , , {code, data, bss, heap, stack})

// Redirect code/data/bss to a named section
#pragma code(mySection)
#pragma data(mySection)
#pragma bss(mySection)

// Stack and heap sizes
#pragma stacksize(4096)
#pragma heapsize(4096)
// NOTE: heapsize alone is not enough — `heap` must also appear in the region section list:
//   #pragma region(main, 0x0A00, 0xC000, , , {code, data, bss, heap, stack})
// Without `heap` in the section list, Oscar64 places it at $10000 (invalid) and malloc() returns NULL.

// Overlay definition
#pragma overlay(ovl1, 1)
```

### Character mapping

```c
// Remap character constants for custom charsets
// #pragma charmap(from_char, to_code [, count])
#pragma charmap(97, 65, 26)   // Map a–z to PETSCII uppercase
#pragma charmap(65, 97, 26)   // Map A–Z to PETSCII lowercase
```

### Diagnostics

```c
#pragma warning(disable: 2000,2001)   // Suppress specific warnings
#pragma message("Build info: v1.0")   // Print message at compile time
```

### Inline call hint

```c
// Hint to the compiler to inline the immediately following function call
#pragma callinline()
oscar_expand_lzo((char *)0xe800, data);
```

---

## Inline Assembly

Oscar64 supports inline 6502 assembler directly in C source.

```c
__asm {
    lda variable       // Local variables and parameters are zero-page registers
    bne w1
    lda #13
w1:
    jsr 0xffd2
}

// Prevent the optimizer from removing or reordering asm blocks
__asm volatile {
    lda #0
    sta 0xd020
}

// Return a value from inline asm (place result in accu, bytes 0x00–0x03)
char getChar(void) {
    return __asm {
        jsr 0xffcf
        sta accu
        lda #0
        sta accu + 1
    };
}

// Access struct member by compile-time offset
struct Obj {
    byte x, y;
    void move(void) {
        auto self = this;
        __asm {
            lda #1
            ldy #Obj::y
            sta (self),y
        }
    }
};
```

**Notes:**
- Local variables and function parameters live in zero-page registers, addressable by name.
- Global variables use absolute addressing.
- Return values go in `accu` (address 0x00–0x03, up to 4 bytes).
- Labels in `__asm` blocks are local to that block.
- `#pragma optimize(noasm)` disables asm optimizer for a scope.

### Runtime 6502 assembler (`c64/asm6502.h`)

For generating code at runtime (e.g. self-modifying code):

```c
#include <c64/asm6502.h>

// Addressing mode helpers:
asm_np(ASM_NOP)            // Implied
asm_im(ASM_LDA, 0x42)      // Immediate
asm_zp(ASM_STA, 0x80)      // Zero page
asm_ab(ASM_JSR, 0xffd2)    // Absolute
asm_ax(ASM_STA, 0x0400)    // Absolute,X
asm_iy(ASM_STA, 0xfb)      // (Indirect),Y
asm_rl(ASM_BNE, target)    // Relative branch
```

---

## Embedded Data (`#embed`)

Include binary files directly into arrays at compile time:

```c
#include <oscar.h>

// Raw binary
byte gfx[] = { #embed "charset.bin" };

// With byte limit and offset: #embed <limit> <offset> "file"
byte partial[] = { #embed 2048 256 "bigfile.bin" };

// LZO compressed (expand at runtime with oscar_expand_lzo)
char gfxPacked[] = { #embed 0 0 lzo "charset.bin" };
// At runtime:
oscar_expand_lzo(gfxPacked, gfxPacked);  // Expand in-place

// RLE compressed
char gfxRle[] = { #embed 0 0 rle "data.bin" };
oscar_expand_rle(gfxRle, gfxRle);

// 16-bit word array
unsigned indices[] = { #embed 0 0 word "index.bin" };
```

### Charpad (.ctm) and Spritepad (.spd) imports

```c
// Charpad CTM tiles and maps:
const char chars[]   = { #embed ctm_chars lzo "tiles.ctm" };    // Character data
const char tiles8[]  = { #embed ctm_tiles8 "tiles.ctm" };       // 8-bit tile indices
const unsigned tiles16[] = { #embed ctm_tiles16 word "tiles.ctm" }; // 16-bit indices
const char tilessw[] = { #embed ctm_tiles8sw "tiles.ctm" };     // Reordered dimensions
const char map8[]    = { #embed ctm_map8 "tiles.ctm" };         // 8-bit map
const unsigned map16[] = { #embed ctm_map16 word "tiles.ctm" }; // 16-bit map
const char attr[]    = { #embed ctm_attr1 "tiles.ctm" };        // Attribute layer 1

// Spritepad SPD sprites:
const char sprites[] = { #embed spd_sprites lzo "sprites.spd" };
const char stiles[]  = { #embed spd_tiles "sprites.spd" };
```

---

## Preprocessor Extensions

Oscar64 adds several compile-time directives beyond standard C:

```c
// Assign a computed value to a macro
#assign NEXT_VALUE CURRENT_VALUE + 1

// Repeat a block with a counter (compile-time loop)
#assign ry 0
#repeat
    fillRow(ry);
#assign ry ry + 1
#until ry == 25
#undef ry

// Expand a comma-separated sequence
// #for(<iterator>, <count>) <expression>
const char * const ScreenRows[] = {
    #for(i, 25) Screen + 40 * i,
};
// Expands to: Screen+0, Screen+40, Screen+80, ... Screen+960,
```

---

## PETSCII and Screen Codes

```c
// String prefix 'p' or 'P' — PETSCII encoding
printf(p"Hello World\n");
char msg[] = p"Press RETURN";

// Character prefix 's' or 'S' — screen code
char ch = s'A';    // Screen code value for 'A'

// Switch console I/O to PETSCII mode
#include <conio.h>
iocharmap(IOCHM_PETSCII_2);
printf("Now using PETSCII\n");

// Global PETSCII: compile with -psci flag (all string literals become PETSCII)

// Character remapping (in source file, affects subsequent string constants)
#pragma charmap(97, 65, 26)   // a–z → PETSCII uppercase values
#pragma charmap(65, 97, 26)   // A–Z → PETSCII lowercase values
```

---

## Memory Model and Linker Sections

### Default C64 PRG layout

| Address range | Purpose |
|--------------|---------|
| `0x0002–0x007f` | Compiler-managed zero page registers |
| `0x0080–0x00ff` | `__zeropage` variables (if used) |
| `0x0801–0x0900` | BASIC stub + bytecode interpreter header |
| `0x0900–0x0a00` | Bytecode interpreter jump table |
| `0x0a00–0xa000` | **Main region:** code → data → BSS → heap → stack |

### Expanding the available memory

```c
#include <c64/memmap.h>

// Extend main region into BASIC RAM (removes BASIC ROM)
#pragma region(main, 0x0800, 0xd000, , , {code, data, bss, heap, stack})

int main(void) {
    mmap_set(MMAP_NO_BASIC);   // Switch out BASIC ROM
    // Now have ~53 KB of code/data space
}
```

### Cartridge banking example

```c
#pragma section(bcode1, 0)
#pragma section(bdata1, 0)
#pragma region(bank1, 0x8000, 0xc000, , 1, { bcode1, bdata1 })

#pragma code(bcode1)
void bankCode(void) { ... }
```

### Custom zero page / zeropage BSS clear

```
-dNOBSSCLEAR   // Skip BSS zero-init (faster startup, must zero manually)
-dNOZPCLEAR   // Skip zero-page BSS zero-init
```

---

## C++ Support

Enable with `-pp` flag.

**Supported features:** namespaces, references, member functions, constructors/destructors, operator overloading, single inheritance, `const` members, virtual functions, `new`/`delete`/`new[]`/`delete[]`, templates, lambda functions, `auto` type deduction, range-based `for`, `constexpr`, parameter packs, default parameters.

See [C++ Template Library (opp/)](#c-template-library-opp) for available containers.

---

## Standard C Library

### Types (`stdint.h`, `c64/types.h`)

```c
// stdint.h — portable types
int8_t   uint8_t
int16_t  uint16_t
int32_t  uint32_t
intptr_t uintptr_t  // = int / unsigned int on 6502

// c64/types.h — shorthand aliases
byte  = unsigned char
word  = unsigned int
dword = unsigned long
sbyte = signed char
```

### `stdio.h`

`printf`, `sprintf`, `vprintf`, `vsprintf` — Formatted output (float/long support requires not using `-dNOFLOAT`/`-dNOLONG`)  
`scanf`, `sscanf` — Formatted input  
`putchar`, `getchar`, `puts`, `gets` — Character/string I/O  
`fopen`, `fclose`, `fread`, `fwrite`, `fprintf`, `fgetc`, `fputc`, `fgets`, `fputs` — File I/O  
`fseek`, `ftell`, `rewind`, `feof` — File position

### `stdlib.h`

```c
// Memory
void * malloc(unsigned size);
void   free(void *ptr);
void * calloc(unsigned n, unsigned size);
void * realloc(void *ptr, unsigned size);
unsigned heapfree(void);   // Returns free heap bytes

// Random
int  rand(void);  void srand(unsigned seed);
long lrand(void); void lsrand(unsigned long seed);

// Conversion
char * itoa(int val, char *buf, int radix);
int    atoi(const char *s);
char * ftoa(float val, char *buf, int decimals);
float  atof(const char *s);
long   strtol(const char *s, char **end, int radix);
float  strtof(const char *s, char **end);
```

### `string.h`

```c
char * strcpy(char *dst, const char *src);
char * strncpy(char *dst, const char *src, unsigned n);
int    strcmp(const char *a, const char *b);
unsigned strlen(const char *s);
char * strcat(char *dst, const char *src);
char * strchr(const char *s, char c);
char * strstr(const char *haystack, const char *needle);

void * memcpy(void *dst, const void *src, unsigned n);
void * memset(void *dst, int c, unsigned n);
int    memcmp(const void *a, const void *b, unsigned n);
void * memmove(void *dst, const void *src, unsigned n);
void   memclr(void *dst, unsigned n);   // Oscar64 extension: zero fill
void * memchr(const void *s, int c, unsigned n);
```

### `math.h`

```c
// Disable with -dNOFLOAT to save ~2 KB of code

#define PI  3.141592653f

float fabs(float x);
float floor(float x);   float ceil(float x);
float sqrt(float x);
float sin(float x);     float cos(float x);    float tan(float x);
float asin(float x);    float acos(float x);   float atan(float x);
float atan2(float y, float x);
float exp(float x);     float log(float x);    float log10(float x);
float pow(float x, float y);
bool  isinf(float x);   bool isfinite(float x);
```

### `fixmath.h` — Fixed-point math (alternative to float)

```c
// 16-bit integer multiply
long lmul16u(unsigned a, unsigned b);
long lmul16s(int a, int b);
long lmul16f16(long a, long b);      // 16.16 fixed-point

// Mixed fixed-point multiplies
long lmul12f4s(int a, int b);        // 12.4 fixed-point
long lmul8f8s(int a, int b);         // 8.8 fixed-point
long lmul4f12s(int a, int b);        // 4.12 fixed-point

// Division
long ldiv16u(unsigned a, unsigned b);
long ldiv16s(int a, int b);
long ldiv16f16(long a, long b);

unsigned lmuldiv16u(unsigned a, unsigned b, unsigned c);  // a*b/c
int      lmuldiv16s(int a, int b, int c);

unsigned usqrt(unsigned x);           // Integer square root
```

### `conio.h` — Console I/O

```c
// Color constants:
// BLACK, WHITE, RED, CYAN, PURPLE, GREEN, BLUE, YELLOW,
// ORANGE, BROWN, LT_RED, DARK_GREY, MED_GREY, LT_GREEN, LT_BLUE, LT_GREY

bool   kbhit(void);         // Non-blocking key check
char   getch(void);         // Wait for key (with processing)
char   getchx(void);        // Wait for key (raw)
void   putch(char c);
void   putpch(char c);      // Raw PETSCII output
char   getpch(void);        // Raw PETSCII input

void   clrscr(void);
void   gotoxy(byte x, byte y);
byte   wherex(void);  byte wherey(void);
void   textcursor(bool on);

void   textcolor(byte c);
void   bgcolor(byte c);
void   bordercolor(byte c);
void   revers(bool on);
```

### `ctype.h`

`isctrnl`, `isprint`, `isspace`, `isblank`, `isgraph`, `ispunct`, `isalnum`, `isalpha`, `isupper`, `islower`, `isdigit`, `isxdigit`  
`char tolower(char c)`, `char toupper(char c)`

### `time.h`

```c
typedef long clock_t;
#define CLOCKS_PER_SEC  60L
clock_t clock(void);    // Elapsed time in 1/60 second ticks
```

### `setjmp.h`

```c
int  setjmp(jmp_buf env);              // Save execution context
int  setjmpsp(jmp_buf env, void *sp);  // Save with explicit stack pointer
void longjmp(jmp_buf env, int value);  // Restore context
```

### `oscar.h` — Decompression and debug

```c
// Expand LZO-compressed data
void oscar_expand_lzo(char *dst, const char *src);
void oscar_expand_lzo_buf(char *dst, const char *src);  // Uses stack buffer

// Expand RLE-compressed data
void oscar_expand_rle(char *dst, const char *src);

// VICE debugger support
void breakpoint(void);    // Trigger VICE breakpoint
void debugcrash(void);    // Trigger debug crash
```

---

## C64 Hardware Libraries

All in `include/c64/`. Include only the `.h` — `#pragma compile` handles the `.c` automatically.

### `vic.h` — VIC-II Graphics Chip

```c
extern struct VIC *vic;   // Memory-mapped at 0xd000

// Display modes
typedef enum { VICM_TEXT, VICM_TEXT_MC, VICM_TEXT_ECM, VICM_HIRES, VICM_HIRES_MC } VICMode;

// Colors: VCOL_BLACK(0)..VCOL_LT_GREY(15)

void vic_setbank(byte bank);   // 0–3; sets CIA2 port A bits
void vic_setmode(VICMode mode, char *screen, char *charset);

// Sprite position
void vic_sprxy(byte spr, int x, byte y);
int  vic_sprgetx(byte spr);

// Beam synchronization
void vic_waitBottom(void);   // Wait past last visible line
void vic_waitTop(void);      // Wait before first visible line  
void vic_waitFrame(void);    // Full frame sync (combines above)
void vic_waitLine(byte line);
void vic_waitBelow(byte line);
void vic_waitRange(byte from, byte to);
bool vic_isBottom(void);
void vic_waitFrames(int n);

// Control register flags (OR together and write to vic->ctrl1/ctrl2):
// VIC_CTRL1_RSEL, VIC_CTRL1_DEN, VIC_CTRL1_BMM, VIC_CTRL1_ECM, VIC_CTRL1_RST8
// VIC_CTRL2_CSEL, VIC_CTRL2_MCM, VIC_CTRL2_RES

// Interrupt flags: VIC_INTR_RST, VIC_INTR_MBC, VIC_INTR_MMC, VIC_INTR_ILP, VIC_INTR_IRQ
```

### `sid.h` — SID Sound Chip

```c
extern struct SID *sid;   // Memory-mapped at 0xd400

// Voice struct: sid->v[0], sid->v[1], sid->v[2]
//   .freq   (word)  — frequency
//   .pwm    (word)  — pulse width
//   .ctrl   (byte)  — control / waveform
//   .attdec (byte)  — attack/decay
//   .susrel (byte)  — sustain/release

// Waveform bits (OR together into ctrl):
// CTRL_GATE, CTRL_SYNC, CTRL_RING, CTRL_TEST
// CTRL_TRI, CTRL_SAW, CTRL_RECT, CTRL_NOISE

// ADSR attack times: SID_ATK_2MS .. SID_ATK_8000MS (15 values)
// ADSR decay/release times: SID_DKY_6MS .. SID_DKY_24000MS (15 values)

// Filter: SID_FILTER_1/2/3 (channel routing); SID_FMODE_LP/BP/HP/3DB_OFF

// Reference clocks:
// SID_CLOCK_PAL = 985248, SID_CLOCK_NTSC = 1022730
// SID_CLKSCALE_PAL, SID_CLKSCALE_NTSC

// Note frequency macros (octave 0–10):
// NOTE_C(o), NOTE_CS(o), NOTE_D(o), ... NOTE_B(o)

// Example: play middle-C on voice 0, sawtooth, full volume
sid->v[0].freq   = NOTE_C(4);
sid->v[0].attdec = (SID_ATK_2MS << 4) | SID_DKY_24MS;
sid->v[0].susrel = 0xf0;          // Full sustain, fast release
sid->v[0].ctrl   = CTRL_SAW | CTRL_GATE;
sid->volume      = 15;
```

### `sprites.h` — Hardware and Virtual Sprites

**Hardware sprites (8 hardware sprites, index 0–7):**

```c
void spr_init(char *screen);       // Init; screen is where sprite pointers are stored

void spr_set(byte spr, bool show, int x, byte y,
             byte img, byte color, bool xexp, bool yexp);
void spr_move(byte spr, int x, byte y);
void spr_show(byte spr, bool show);
void spr_image(byte spr, byte img);
void spr_color(byte spr, byte color);
void spr_expand(byte spr, bool xexp, bool yexp);
int  spr_posx(byte spr);
byte spr_posy(byte spr);
void spr_move16(byte spr, int x, int y);   // 16-bit position
```

**Virtual sprites (up to 16, multiplexed via raster IRQ):**

```c
void vspr_init(byte numSprites);
void vspr_shutdown(void);
void vspr_screen(char *screen);

void vspr_set(byte spr, bool show, int x, byte y, byte img, byte color);
void vspr_move(byte spr, int x, byte y);
void vspr_movex(byte spr, int x);
void vspr_movey(byte spr, byte y);
void vspr_image(byte spr, byte img);
void vspr_color(byte spr, byte color);
void vspr_hide(byte spr);

// Call each frame, in order:
void vspr_sort(void);     // Sort by Y-position
void vspr_update(void);   // Commit to raster IRQ
// Then call rirq_sort() to apply
```

### `cia.h` — CIA1 and CIA2

```c
extern struct CIA *cia1;   // at 0xdc00
extern struct CIA *cia2;   // at 0xdd00

// CIA struct members:
// .pra, .prb        — Port A/B data registers
// .ddra, .ddrb      — Data direction registers
// .talo, .tahi      — Timer A (low, high)
// .tblo, .tbhi      — Timer B (low, high)
// .tod10, .todsec, .todmin, .todhr — Time-of-day (BCD)
// .sdr              — Serial data register
// .icr              — Interrupt control register (read: status, write: mask)
// .cra, .crb        — Control register A/B

void cia_init(void);
```

### `joystick.h`

```c
extern sbyte joyx[2], joyy[2];   // -1, 0, or +1 for each axis
extern bool  joyb[2];             // Button state (true = pressed)

void joy_poll(byte port);          // port 0 or 1; updates globals above
```

### `keyboard.h`

```c
extern char keyb_codes[128];   // PETSCII: [0..63] normal, [64..127] shifted
extern char keyb_matrix[8];    // Raw 8×8 keyboard matrix
extern char keyb_key;          // Last key pressed (PETSCII)

void keyb_poll(void);           // Scan matrix, update globals
bool key_pressed(char key);    // Check if a specific PETSCII key is down
bool key_shift(void);          // Check if shift is held

// Scan code constants: KSCAN_DEL, KSCAN_RETURN, KSCAN_CRSR_RIGHT, KSCAN_F7,
//                      KSCAN_F1, KSCAN_F3, KSCAN_F5, KSCAN_CRSR_DOWN,
//                      KSCAN_3, KSCAN_W, KSCAN_A, ... (full 64-key matrix)
// Qualifier: KSCAN_QUAL_SHIFT (0x40), KSCAN_QUAL_DOWN (0x80 — key-down bit)
// PETSCII codes: CSR_DOWN, CSR_RIGHT, F1..F8, HOME, RETURN, DELETE, etc.
```

### `rasterirq.h` — Raster Interrupt System

This library manages up to 16 raster interrupt slots, sorted by scan line, executing writes or calls at specific beam positions.

```c
// Build an interrupt code block (static or dynamic allocation)
void rirq_build(RIRQCode *rc, byte numOps);    // Static (stack/global)
void rirq_alloc(RIRQCode *rc, byte numOps);    // Dynamic (heap)

// Add operations to the block:
void rirq_write(RIRQCode *rc, byte idx, void *addr, byte data);  // Write a byte
void rirq_call(RIRQCode *rc, byte idx, void (*fn)(void));         // Call a function
void rirq_addr(RIRQCode *rc, byte idx, void *addr);    // Update address of an op
void rirq_addrhi(RIRQCode *rc, byte idx, void *addr);  // Update address high byte
void rirq_data(RIRQCode *rc, byte idx, byte data);     // Update data of an op
void rirq_delay(RIRQCode *rc, byte cycles);            // Burn cycles (horizontal pos)

// Manage slots (0–15):
void rirq_set(byte slot, byte line, RIRQCode *rc);  // Assign IRQ to raster line
void rirq_clear(byte slot);
void rirq_move(byte slot, byte line);

// Initialize (choose one):
void rirq_init(bool kernal);     // kernal=true keeps KERNAL ROM mapped
void rirq_init_kernal(void);
void rirq_init_crt(void);
void rirq_init_memmap(void);

void rirq_start(void);   // Activate IRQ system
void rirq_stop(void);

// Each frame (after updating slot parameters):
void rirq_sort(void);        // Re-sort slots by line number
void rirq_wait(void);        // Wait for IRQ pass to complete
void rirq_wait_done(void);   // Wait for specific slot to fire
```

### `reu.h` — RAM Expansion Unit

```c
// Detect installed REU memory
int reu_count_pages(void);    // Returns number of 64 KB pages (0 if no REU)

// DMA transfers
void reu_store(void *reu_dst, const void *c64_src, unsigned len);  // C64 → REU
void reu_load(void *c64_dst, const void *reu_src, unsigned len);   // REU → C64
void reu_fill(void *reu_dst, byte val, unsigned len);               // Fill REU

// 2D transfers (useful for tiled graphics with stride)
void reu_load2d(void *dst, unsigned dstStride,
                const void *src, unsigned srcStride,
                unsigned w, unsigned h);
void reu_load2dpage(void *dst, unsigned dstStride,
                    const void *src, unsigned srcPage,
                    unsigned w, unsigned h);

// REU register flags:
// Status:  REU_STAT_IRQ, REU_STAT_EOB, REU_STAT_FAULT, REU_STAT_SIZE, REU_STAT_VERSION
// Command: REU_CMD_EXEC, REU_CMD_AUTO, REU_CMD_FF00
//          REU_CMD_STORE, REU_CMD_LOAD, REU_CMD_SWAP, REU_CMD_VERIFY
// IRQ:     REU_IRQ_ENABLE, REU_IRQ_EOB, REU_IRQ_FAULT
// Control: REU_CTRL_FIXL, REU_CTRL_FIXR
```

### `memmap.h` — Memory Mapping

```c
// Memory map constants (value written to address 0x01):
#define MMAP_ROM       0x37   // BASIC + I/O + KERNAL (power-on default)
#define MMAP_NO_BASIC  0x36   // I/O + KERNAL (no BASIC ROM)
#define MMAP_NO_ROM    0x35   // I/O only (no BASIC, no KERNAL)
#define MMAP_RAM       0x30   // All RAM (no ROMs, no I/O)
#define MMAP_CHAR_ROM  0x31   // CHAR ROM visible, no other ROMs/I/O
#define MMAP_ALL_ROM   0x33   // All ROM, no I/O

void mmap_trampoline(void);    // Install IRQ/NMI trampoline (needed if changing maps)
char mmap_set(char pla);       // Set map, return previous map value
```

### `charwin.h` — Character Window

A windowed character-mode display abstraction with cursor tracking.

```c
typedef struct { ... } CharWin;

void cwin_init(CharWin *w, char *screen, byte x, byte y, byte width, byte height);
void cwin_clear(CharWin *w);
void cwin_fill(CharWin *w, char ch, byte color);

// Cursor movement
void cwin_cursor_left(CharWin *w);
void cwin_cursor_right(CharWin *w);
void cwin_cursor_up(CharWin *w);
void cwin_cursor_down(CharWin *w);
void cwin_cursor_forward(CharWin *w);
void cwin_cursor_backward(CharWin *w);
void cwin_cursor_newline(CharWin *w);

// Character output (at cursor or at x,y)
void cwin_put_char(CharWin *w, char ch);
void cwin_put_char_color(CharWin *w, char ch, byte color);
void cwin_putat_char(CharWin *w, byte x, byte y, char ch);
void cwin_putat_char_color(CharWin *w, byte x, byte y, char ch, byte color);

// Character input
char cwin_get_char(CharWin *w);
char cwin_getat_char(CharWin *w, byte x, byte y);

// Rectangle block copy
void cwin_put_rect(CharWin *w, byte x, byte y, byte width, byte height, char *data);
void cwin_get_rect(CharWin *w, byte x, byte y, byte width, byte height, char *data);

// Scrolling
void cwin_scroll_left(CharWin *w);
void cwin_scroll_right(CharWin *w);
void cwin_scroll_up(CharWin *w);
void cwin_scroll_down(CharWin *w);

// High-level console mode
void cwin_console_init(CharWin *w, ...);
void cwin_console_printf(CharWin *w, const char *fmt, ...);
void cwin_console_edit_line(CharWin *w, char *buf, byte maxlen);
```

### `kernalio.h` — Kernal File I/O

```c
// Error codes: KRNIO_OK, KRNIO_DIR, KRNIO_TIMEOUT, KRNIO_SHORT, KRNIO_LONG,
//              KRNIO_VERIFY, KRNIO_CHKSUM, KRNIO_EOF, KRNIO_NODEVICE
extern char krnio_pstatus[16];   // Per-device status byte

void krnio_setnam(const char *name);
void krnio_setnam_n(const char *name, byte len);
void krnio_setbnk(byte filebank, byte namebank);  // C128 only

bool krnio_open(byte lfn, byte device, byte secondary);
void krnio_close(byte lfn);
byte krnio_status(void);

bool krnio_load(const char *name, byte device, void *dest);
bool krnio_save(const char *name, byte device, const void *src, unsigned len);

// Stream I/O
bool krnio_chkout(byte lfn);   // Select output stream
bool krnio_chkin(byte lfn);    // Select input stream
void krnio_clrchn(void);       // Restore default streams
void krnio_chrout(char c);
char krnio_chrin(void);

// File byte I/O
bool krnio_getch(byte lfn, char *c);
bool krnio_putch(byte lfn, char c);
int  krnio_write(byte lfn, const char *data, unsigned len);
int  krnio_read(byte lfn, char *data, unsigned len);
bool krnio_puts(byte lfn, const char *str);
bool krnio_gets(byte lfn, char *str, unsigned maxlen);
bool krnio_read_lzo(byte lfn, char *dst);   // Read + decompress LZO
```

### `iecbus.h` — Low-Level IEC Serial Bus

```c
// Status codes: IEC_OK, IEC_EOF, IEC_QUEUED, IEC_ERROR, IEC_TIMEOUT, IEC_DATA_CHECK

int  iec_write(byte data);
int  iec_read(void);
void iec_atn(bool state);
void iec_talk(byte device, byte sa);
void iec_untalk(void);
void iec_listen(byte device, byte sa);
void iec_unlisten(void);
bool iec_open(byte device, byte sa, const char *name, byte len);
bool iec_close(byte device, byte sa);
int  iec_write_bytes(const char *data, unsigned len);
int  iec_read_bytes(char *data, unsigned len);
```

### `flossiec.h` — Fast IEC Loader

```c
// Build-time feature flags (define before including):
// FLOSSIEC_BORDER    — Show border activity
// FLOSSIEC_NODISPLAY — Disable display during load
// FLOSSIEC_NOIRQ     — Disable IRQ during load
// FLOSSIEC_CODE, FLOSSIEC_BSS — Section placement

// With KERNAL
void flosskio_init(byte device);
void flosskio_shutdown(void);
bool flosskio_open(byte sa, const char *name);
void flosskio_close(byte sa);
void flosskio_mapdir(floss_blk *blocks, byte count);  // Map filenames to blocks

// Without KERNAL (faster)
void flossiec_init(byte device);
void flossiec_shutdown(void);
bool flossiec_open(byte sa, const char *name);
void flossiec_close(byte sa);
void flossiec_mapdir(floss_blk *blocks, byte count);

bool flossiec_eof(void);
int  flossiec_get(void);                              // Read one byte
int  flossiec_get_lzo(void);                          // Read one byte (LZO stream)
int  flossiec_read(char *dst, unsigned len);
int  flossiec_read_lzo(char *dst, unsigned len);      // Read + decompress LZO
```

### `mouse.h`

```c
extern sbyte mouse_dx, mouse_dy;   // Relative movement delta since last poll
extern bool  mouse_lb, mouse_rb;   // Button state

void mouse_init(byte port);   // port: 0 or 1
void mouse_arm(void);          // Arm potentiometers (4 ms settle, call before poll)
void mouse_poll(void);         // Update globals
```

---

## C128 Libraries

### `c128/vdc.h` — VDC 80-Column Chip

```c
extern struct VDC *vdc;   // at 0xd600 (.addr and .data registers)

// Register enum: VDCR_HTOTAL, VDCR_HDISPLAY, VDCR_HSMOOTH, VDCR_VSYNC,
//                VDCR_CTRL, VDCR_CURSTART, VDCR_CUREND,
//                VDCR_DISPH, VDCR_DISPL, VDCR_CURH, VDCR_CURL,
//                VDCR_LPENH, VDCR_LPENL, VDCR_UPH, VDCR_UPL,
//                VDCR_ATTR, VDCR_CHARH, VDCR_VSCROLL, VDCR_HSCROLL,
//                VDCR_COLOR, VDCR_ROWADDR, VDCR_CHARBASE, VDCR_WORDCOUNT,
//                VDCR_DATA, VDCR_ROWINCR, VDCR_VSMOOTH, VDCR_CURBG

void vdc_reg(byte reg);
void vdc_write(byte val);
byte vdc_read(void);
void vdc_reg_write(byte reg, byte val);
byte vdc_reg_read(byte reg);

void vdc_mem_addr(unsigned addr);
void vdc_mem_write(byte val);
byte vdc_mem_read(void);
void vdc_mem_write_at(unsigned addr, byte val);
byte vdc_mem_read_at(unsigned addr);
void vdc_mem_write_buffer(unsigned addr, const char *buf, unsigned len);
void vdc_mem_read_buffer(unsigned addr, char *buf, unsigned len);
```

### `c128/mmu.h` — Memory Management Unit

```c
extern struct MMU  *mmu;   // at 0xff00: cr, bank0, bank1, bank14, bankx
extern struct XMMU *xmmu;  // at 0xd500: cr, pcr[4], mcr, rcr, page0, page1, vr

char mmu_set(char config);   // Set configuration register, return previous value
```

### `c128/bank1.h` — Bank 1 Access

```c
void bnk1_init(void);

byte          bnk1_readb(void *addr);
unsigned      bnk1_readw(void *addr);
unsigned long bnk1_readl(void *addr);
void          bnk1_readm(void *dst, const void *src, unsigned len);

void bnk1_writeb(void *addr, byte val);
void bnk1_writew(void *addr, unsigned val);
void bnk1_writel(void *addr, unsigned long val);
void bnk1_writem(void *dst, const void *src, unsigned len);
```

---

## PLUS4 Libraries

### `plus4/ted.h` — TED Chip

```c
extern struct TED *ted;   // at 0xff00

typedef enum { TEDM_TEXT, TEDM_TEXT_MC, TEDM_TEXT_ECM, TEDM_HIRES, TEDM_HIRES_MC } TEDMode;

void ted_setmode(TEDMode mode, char *screen, char *charset);
void ted_waitBottom(void);
void ted_waitTop(void);
void ted_waitFrame(void);
void ted_waitLine(byte line);

// Control flags:
// TED_CTRL1_RSEL, TED_CTRL1_DEN, TED_CTRL1_BMM, TED_CTRL1_ECM
// TED_CTRL2_CSEL, TED_CTRL2_MCM, TED_CTRL2_RES, TED_CTRL2_NTSC, TED_CTRL2_INV
// Sound: TED_SND_SQUARE1, TED_SND_SQUARE2, TED_SND_NOISE2, TED_SND_DA
// Interrupt: TED_INTR_RST, TED_INTR_LPEN, TED_INTR_CNT1/2/3, TED_INTR_IRQ
```

---

## NES Libraries

### `nes/nes.h` — NES PPU and APU Hardware

```c
extern struct PPU  *ppu;   // at 0x2000
extern struct NESIO *nesio; // at 0x4000

// PPU control bits: NT_0/1/2/3, INC_1/32, SPR_0/1, BG_0/1, NMI
// PPU mask bits: GREYSCALE, BG8, SPR8, BG_ON, SPR_ON, EM_RED/GREEN/BLUE
// APU channels via nesio: 2 square, 1 triangle, 1 noise, 1 DMC
```

### `nes/neslib.h` — NES Game Library

```c
// Palette
void pal_all(const char *p);      // Set full 32-byte palette
void pal_bg(const char *p);       // Set 16-byte background palette
void pal_spr(const char *p);      // Set 16-byte sprite palette
void pal_col(byte idx, byte val);
void pal_clear(void);
void pal_bright(byte level);      // Adjust virtual brightness

// PPU control
void ppu_wait_nmi(void);
void ppu_wait_frame(void);
void ppu_off(void);
void ppu_on_all(void);
void ppu_on_bg(void);
void ppu_on_spr(void);

// OAM / Sprites
void oam_clear(void);
void oam_size(byte size);          // SIZE_8 or SIZE_16
void oam_spr(byte x, byte y, byte tile, byte attr, byte id);
void oam_meta_spr(byte x, byte y, const byte *data);  // data ends with x=128
void oam_hide_rest(byte from);

// Audio
void music_play(byte song);
void music_stop(void);
void music_pause(bool on);
void sfx_play(byte sfx, byte channel);
void sample_play(byte smp);

// Input (returns bitmask of PAD_A/B/SELECT/START/UP/DOWN/LEFT/RIGHT)
byte pad_poll(byte pad);       // Poll and return state
byte pad_trigger(byte pad);    // Return edge-triggered (new presses only)
byte pad_state(byte pad);      // Return last polled state without re-polling

// Scrolling
void scroll(unsigned x, unsigned y);
void split(unsigned x, unsigned y);

// CHR banking
void bank_spr(byte bank);
void bank_bg(byte bank);

// Random
byte rand8(void);  unsigned rand16(void);  void set_rand(unsigned seed);

// VRAM (use with rendering disabled)
void vram_adr(unsigned adr);
void vram_put(byte val);
void vram_fill(byte val, unsigned len);
void vram_read(unsigned adr, char *buf, unsigned len);
void vram_write(unsigned adr, const char *buf, unsigned len);
void vram_unrle(const char *data);
void vram_unlz4(const char *data, unsigned adr);

// VRAM update buffer (use with rendering enabled)
// Buffer format: [MSB, LSB, byte] per single-byte update
//                [MSB|NT_UPD_HORZ/VERT, LSB, count, bytes...] for runs
void set_vram_update(byte *buf);
void flush_vram_update(byte *buf);

// Nametable address macros
// NTADR_A(x,y), NTADR_B(x,y), NTADR_C(x,y), NTADR_D(x,y)
// NAMETABLE_A=0x2000, NAMETABLE_B=0x2400, NAMETABLE_C=0x2800, NAMETABLE_D=0x2c00
```

### `nes/mmc1.h` and `nes/mmc3.h`

See header files for bank-switching helpers for MMC1 and MMC3 cartridge mappers.

---

## Commander X16 Libraries

### `cx16/vera.h` — VERA Video Chip

```c
extern struct VERA *vera;  // at 0x9f20

// Color macro: 4-4-4 RGB packed into 16 bits
#define VERA_COLOR(r, g, b)   // r, g, b each 0–15

// VRAM access
void     vram_addr(unsigned long adr, byte step);
void     vram_addr0(unsigned long adr, byte step);
void     vram_put(byte val);
void     vram_putw(unsigned val);
byte     vram_get(void);
void     vram_put_at(unsigned long adr, byte val);
void     vram_putn(unsigned long adr, const char *buf, unsigned len);
void     vram_fill(unsigned long adr, byte val, unsigned len);

// Sprites
void vera_spr_set(byte id, bool show, int x, int y, byte img, byte pal, byte size);
void vera_spr_flip(byte id, bool xflip, bool yflip);
void vera_spr_move(byte id, int x, int y);
void vera_spr_image(byte id, byte img);

// Palette
void     vera_pal_put(byte idx, unsigned color);
unsigned vera_pal_get(byte idx);
void     vera_pal_putn(byte idx, const unsigned *colors, byte n);
void     vera_pal_getn(byte idx, unsigned *colors, byte n);
```

---

## VIC20 Libraries

### `vic20/vic.h` — VIC Chip

```c
extern struct VICI *vici;  // at 0x9000
// Members: hpos, vpos, ncols, nrows, beam, mempos,
//          hlpen, vlpen, xpaddle, ypaddle, oscfreq[4], volcol, color
```

---

## Graphics Libraries (`gfx/`)

### `gfx/bitmap.h` — Hires Bitmap Graphics

```c
typedef struct {
    char    *data;
    byte     cwidth, cheight;   // Size in characters
    unsigned pwidth;             // Width in pixels
} Bitmap;

typedef struct { int left, top, right, bottom; } ClipRect;

// Blit operations (for fills and blits):
// SET, RESET, NOT, XOR, OR, AND, AND_NOT, COPY, NCOPY, PATTERN, PATTERN_AND_SRC

// 9 dithering patterns:
// NineShadesOfGrey[9][8]  — index 0=white, 8=black

Bitmap * bm_alloc(int w, int h);
void     bm_free(Bitmap *bm);
void     bm_init(Bitmap *bm, char *data, int w, int h);
void     bm_fill(Bitmap *bm, byte pattern);

// Pixel
void bm_set(Bitmap *bm, int x, int y);
void bm_clr(Bitmap *bm, int x, int y);
bool bm_get(Bitmap *bm, int x, int y);
void bm_put(Bitmap *bm, int x, int y, bool v);

// Lines
void bmu_line(Bitmap *bm, int x0, int y0, int x1, int y1, byte pat, LineOp op);
void bm_line(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, byte pat, LineOp op);

// Rectangles
void bm_rect_fill(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte pat, BlitOp op);
void bm_rect_clear(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h);
void bm_rect_pattern(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte pat);
void bm_rect_copy(Bitmap *bm, const ClipRect *cr, int sx, int sy, int dx, int dy, int w, int h);

// Shapes (all have clipped and unclipped `bmu_` variants)
void bm_circle_fill(Bitmap *bm, const ClipRect *cr, int cx, int cy, int r, byte pat, BlitOp op);
void bm_triangle_fill(Bitmap *bm, const ClipRect *cr, int x0, int y0, int x1, int y1, int x2, int y2, byte pat, BlitOp op);
void bm_polygon_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte pat, BlitOp op);    // Convex
void bm_polygon_nc_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte pat, BlitOp op); // Arbitrary

// Blitting
void bmu_bitblit(Bitmap *dst, int dx, int dy, const Bitmap *src, int sx, int sy, int w, int h, BlitOp op);
void bm_bitblit(Bitmap *dst, const ClipRect *cr, int dx, int dy, const Bitmap *src, int sx, int sy, int w, int h, BlitOp op);

// Text rendering
void bmu_text(Bitmap *bm, int x, int y, const char *s, byte color);
void bm_put_string(Bitmap *bm, const ClipRect *cr, int x, int y, const char *s);
unsigned bmu_text_size(const char *s);

// Rotation/scaling transformation
void bm_transform(Bitmap *dst, const ClipRect *cr, int cx, int cy,
                  const Bitmap *src, int sx, int sy,
                  const int *mat2x2, BlitOp op);
```

### `gfx/mcbitmap.h` — Multicolor Bitmap Graphics

Like `bitmap.h` but for multicolor mode (2 horizontal pixels per color pixel).

```c
// Dithering patterns: MixedColors[4][4][8]

// Pixel access (x in multicolor units, i.e. 0–159 for a 320-pixel-wide bitmap)
void bmmc_put(Bitmap *bm, int x, int y, byte color);
byte bmmc_get(Bitmap *bm, int x, int y);

// All bmu/bm functions exist as bmmc variants:
void bmmcu_line(Bitmap *bm, int x0, int y0, int x1, int y1, byte color);
void bmmc_line(Bitmap *bm, const ClipRect *cr, ...);
void bmmc_circle_fill(Bitmap *bm, const ClipRect *cr, int cx, int cy, int r, byte pat, byte color);
void bmmc_triangle_fill(Bitmap *bm, const ClipRect *cr, ...);
void bmmc_polygon_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte color);    // Convex
void bmmc_polygon_nc_fill(Bitmap *bm, const ClipRect *cr, const int *pts, byte n, byte color); // Arbitrary
void bmmc_flood_fill(Bitmap *bm, const ClipRect *cr, int x, int y, byte color);
void bmmcu_rect_fill(Bitmap *bm, int x, int y, int w, int h, byte color);
void bmmc_rect_fill(Bitmap *bm, const ClipRect *cr, int x, int y, int w, int h, byte color);
```

> **Important:** `bmmc_*` coordinates use multicolor pixel units. The bitmap's effective horizontal resolution is half the pixel width. When feeding coordinates from a hires context, divide x by 2. Passing raw hires pixel x values causes double-width rendering.

### `gfx/vector3d.h` — 3D Vector and Matrix Math

All functions are inline for maximum speed on 6502.

```c
// Types:
// Vector2 = float[2],  Matrix2 = float[4]
// Vector3 = float[3],  Matrix3 = float[9]
// Vector4 = float[4],  Matrix4 = float[16]
// F12Vector3 = int[3], F12Matrix3 = int[9]  ← fixed-point 4.12 (faster, no FPU)

// Vector3 operations
void  vec3_set(Vector3 v, float x, float y, float z);
void  vec3_add(Vector3 dst, const Vector3 a, const Vector3 b);
void  vec3_sub(Vector3 dst, const Vector3 a, const Vector3 b);
void  vec3_scale(Vector3 dst, const Vector3 v, float s);
float vec3_dot(const Vector3 a, const Vector3 b);
void  vec3_cross(Vector3 dst, const Vector3 a, const Vector3 b);
float vec3_length(const Vector3 v);
void  vec3_norm(Vector3 v);

// Project 3D point to 2D screen via 4×4 matrix
void vec3_project(Vector2 dst, const Matrix4 m, const Vector3 v);

// Matrix3 operations
void mat3_ident(Matrix3 m);
void mat3_mmul(Matrix3 dst, const Matrix3 a, const Matrix3 b);
void mat3_set_rotate_x(Matrix3 m, float angle);
void mat3_set_rotate_y(Matrix3 m, float angle);
void mat3_set_rotate_z(Matrix3 m, float angle);
void mat3_invert(Matrix3 dst, const Matrix3 src);

// Matrix4 operations
void mat4_ident(Matrix4 m);
void mat4_mmul(Matrix4 dst, const Matrix4 a, const Matrix4 b);
void mat4_perspective(Matrix4 m, float fov, float aspect, float near, float far);
void mat4_translate(Matrix4 m, float x, float y, float z);
void mat4_scale(Matrix4 m, float x, float y, float z);

// Fixed-point 4.12 (use when float is too slow)
void f12mat3_ident(F12Matrix3 m);
void f12mat3_mmul(F12Matrix3 dst, const F12Matrix3 a, const F12Matrix3 b);
void f12mat3_set_rotate_x(F12Matrix3 m, int angle);   // angle: fixed-point radians
void f12mat3_set_rotate_y(F12Matrix3 m, int angle);
void f12mat3_set_rotate_z(F12Matrix3 m, int angle);
void f12vec3_mmul(F12Vector3 dst, const F12Matrix3 m, const F12Vector3 v);
```

### `gfx/tinyfont.h`

```c
extern const byte TinyFont[];   // Small bitmap font, used with bm_put_string()
```

---

## Audio Libraries (`audio/`)

### `audio/sidfx.h` — SID Sound Effects Engine

A 3-channel prioritized SID sound effect system with per-frame modulation.

```c
typedef struct {
    word freq, pwm;          // Current frequency and pulse width
    byte ctrl, attdec, susrel; // Current SID register values
    int  dfreq, dpwm;        // Per-frame delta (pitch slide, PWM sweep)
    byte time1, time0;       // Duration counters
    byte priority;           // Higher = overrides lower-priority channel
} SIDFX;

void sidfx_init(void);                              // Initialize (3 channels)
void sidfx_play(byte ch, const SIDFX *fx, byte n);  // Play effect on channel
void sidfx_stop(byte ch);                            // Stop channel
bool sidfx_idle(byte ch);                            // True if channel is free
byte sidfx_cnt(byte ch);                             // Remaining frames on channel
void sidfx_loop(void);                               // Update — call once per frame
void sidfx_loop_2(void);                             // Alternate update variant
```

---

## C++ Template Library (`opp/`)

Include with `-pp` flag.

| Header | Template | Notes |
|--------|----------|-------|
| `array.h` | `array<T, N>` | Fixed-size array; `size()`, `at()`, `[]`, `fill()`, iterators |
| `vector.h` | `vector<T>` | Dynamic array; `push_back()`, `pop_back()`, `resize()`, `reserve()`, `insert()`, `erase()` |
| `static_vector.h` | `static_vector<T, N>` | Fixed-capacity vector (no heap alloc); same interface as vector |
| `list.h` | `list<T>` | Doubly-linked list; `push/pop_front/back()`, bidirectional iterator |
| `string.h` | `string` | Dynamic string; `+=`, `+`, `find()`, `substr()`, `to_int()`, `to_string()` |
| `hashmap.h` | `hashmap<K, T>` | Hash map; `at()`, `insert()`, `erase()`, `find()` |
| `span.h` | `span<T, N>` | Non-owning view; `subspan()`, `first()`, `last()` |
| `optional.h` | `optional<T>` | Maybe type; `operator bool()`, `*`, `->` |
| `slab.h` | `slab<T, N>` | Static slab allocator; `alloc()`, `free()` |
| `iostream.h` | `cin`/`cout` | `<<`, `>>`, `endl`, `setw()`, `setprecision()`, `setfill()` |
| `algorithm.h` | — | `sort()`, `copy()`, `find()` |
| `utility.h` | — | `swap()`, `move()` |
| `numeric.h` | — | Numeric algorithms |
| `iterator.h` | — | Iterator utilities |
| `functional.h` | — | Function objects |
| `bidxlist.h` | — | Bidirectional index list |
| `boundint.h` | — | Bounded integer type |

---

## Sample Programs

All samples in `/home/xahmol/oscar64/samples/`.

| Directory | What it demonstrates |
|-----------|---------------------|
| `fractals/mbhires.c` | Mandelbrot in hires mode (floating-point) |
| `fractals/mbfixed.c` | Mandelbrot with fixed-point math (faster) |
| `fractals/mbmulti.c` | Mandelbrot in multicolor mode |
| `fractals/mbzoom.c` | Scrollable/zoomable Mandelbrot |
| `hires/bitblit.c` | Blit operations (SET, XOR, AND, OR, COPY, etc.) |
| `hires/cube3d.c` | 3D wireframe cube using vector3d.h |
| `hires/fractaltree.c` | Recursive fractal tree |
| `hiresmc/floodfill.c` | Flood fill on multicolor bitmap |
| `hiresmc/func3d.c` | 3D function surface (multicolor) |
| `hiresmc/paint.c` | Interactive paint program |
| `sprites/joycontrol.c` | Joystick-controlled sprite |
| `sprites/multiplexer.c` | Virtual sprite multiplexing (16 sprites via raster IRQ) |
| `sprites/creditroll.c` | Scrolling credits sequence |
| `rasterirq/colorbars.c` | Per-line color changes via raster IRQ |
| `rasterirq/movingbars.c` | Animated horizontal bars |
| `rasterirq/autocrawler.c` | Automatic text crawler |
| `scrolling/colorram.c` | Color RAM scrolling synchronized to beam |
| `scrolling/bigfont.c` | Large font horizontal scroll |
| `scrolling/cgrid8way.c` | 8-direction character grid scroll |
| `games/breakout.c` | Complete Breakout game |
| `games/connectfour.c` | Complete Connect Four game |
| `games/hscrollshmup.c` | Horizontal-scrolling shoot-em-up |
| `kernalio/fileread.c` | Read struct data from disk via Kernal |
| `kernalio/filewrite.c` | Write data to disk |
| `kernalio/diskdir.c` | Directory listing |
| `kernalio/hiresread.c` | Load bitmap from disk |
| `memmap/allmem.c` | Use all available RAM by switching maps |
| `memmap/charsetcopy.c` | Copy CHAR ROM to RAM |
| `particles/fireworks_hires.c` | Particle effects in hires mode |
| `stdio/helloworld.c` | Basic `printf` usage |

---

## Tips and Gotchas

### Multi-file builds — use `#pragma compile`, not makefiles
Each `.h` should contain `#pragma compile("corresponding.c")`. Oscar64 follows these chains automatically. Only `src/main.c` needs to be passed to the compiler.

### Speed: zero page is your friend
Hot variables (loop counters, frequently-dereferenced pointers) go in zero page. Use `__zeropage` explicitly, or `-Oz` to let the compiler choose. Zero page access is 1 byte shorter and 1 cycle faster than absolute addressing.

### Speed: `__striped` arrays for structs
```c
// Bad for 6502 (requires multiply to index):
struct Sprite { int x, y; byte color; } sprites[32];

// Good (index each field as plain byte array — no multiply):
__striped struct Sprite { int x, y; byte color; } sprites[32];
auto p = sprites + i;   // Always use 'auto' pointer for striped access
```

### Speed: `__native` and `#pragma native` for hot functions
Mark inner-loop functions `__native` or `#pragma native(FnName)` to compile them as native 6502 rather than bytecode. Use `-O2` for auto-inlining.

### Hardware registers: always use `volatile`
```c
// Wrong — compiler may cache the read:
unsigned char *vic_border = (unsigned char *)0xd020;

// Correct:
volatile unsigned char *vic_border = (volatile unsigned char *)0xd020;
```

### `mcbitmap.h` coordinate convention
`bmmc_*` functions use **multicolor pixel units** where x=0–159 (for a 320-wide bitmap). If you compute coordinates in hires pixel space (0–319), you must divide x by 2 before passing to mc functions. Forgetting this causes double-width rendering artifacts.

### Raster IRQ + virtual sprites: order matters
Each frame, call in this exact order:
```c
vspr_sort();     // 1. Sort virtual sprites by Y
vspr_update();   // 2. Commit positions to IRQ handler
rirq_sort();     // 3. Re-sort all raster IRQ slots by line
```

### Interrupt handler choice
- `__hwinterrupt` — saves all CPU registers + uses RTI. Use for real hardware interrupts (CIA, VIC raster). Slightly more overhead.
- `__interrupt` — saves zero page registers only. Use for lightweight software callbacks.

**Critical: never use `__interrupt` on a $0314 chain handler that ends with `jmp`.**
`__interrupt` pushes all ZP pseudo-registers to the hardware stack in a prologue.
If the function body ends with `__asm { jmp (saved_vector) }`, the epilogue that
pops them is dead code — the JMP exits first. `$EA7E` then pops ZP garbage as A/X/Y
and RTI crashes.

Correct pattern for a $0314 chain handler (e.g. CIA1 Timer A MOD player):
```c
// Entry: __asm function — no C prologue/epilogue, hardware stack untouched
__asm modplay_irq
{
    lda $dc0d           // read + acknowledge CIA1 ICR
    and #$01            // Timer A flag?
    beq irq_exit
    jsr modplay_tick    // __interrupt worker: saves ZP, runs body, restores ZP, RTS
irq_exit:
    jmp (mod_saved_irq) // chain → $EA31 → $EA7E (pop A/X/Y) → RTI
}
// Worker callable via JSR — __interrupt handles its own ZP save/restore
__interrupt void modplay_tick(void) { /* all logic here */ }
```

### Float costs code space
Using `math.h` or any float arithmetic pulls in a FPU emulation library (~2–3 KB). For performance-critical code, use `fixmath.h` or the fixed-point types in `vector3d.h` (F12Vector3/F12Matrix3).

### D64 images with resources
```bash
oscar64 -tm=c64 -tf=prg -d64=game.d64 -fz=level1.bin -fz=sprites.bin src/main.c
# -fz: LZO-compress file before embedding into D64
# -f:  embed uncompressed file
```

### `__assume` for tighter code
```c
// Tell optimizer a value is bounded (enables faster modulo, range-check removal):
__assume(frame < 60);
```

### PETSCII string pitfall
If your strings print garbage, check whether you need PETSCII encoding. Use `p"..."` prefix per-string, or compile with `-psci` to flip all literals to PETSCII globally.

---

## Tutorials Reference

Local clone: `/home/xahmol/OscarTutorials/`  
Online: https://github.com/drmortalwombat/OscarTutorials

Tutorials are numbered — higher numbers build on earlier ones. The sections below cover the non-obvious patterns worth knowing; straightforward tutorials are listed in the index at the end.

---

### SID Music Playback from .sid file

A standard .sid file has a 0x7e-byte header followed by 6510 machine code. Load the code to its native address using a custom region, then call init (`+$0000`) and play (`+$0003`) via inline assembly.

```c
// 1. Define a memory region for the music data
#pragma section(music, 0)
#pragma region(music, 0xa000, 0xc000, , , {music})

// 2. Embed the .sid file, skipping the 0x7e-byte header
#pragma data(music)
__export const char music[] = {
    #embed 0x2000 0x7e "../Resources/song.sid"
};
#pragma data(data)   // Return to default data section

// 3. Init and play helpers
void music_init(char tune) { __asm { lda tune; jsr 0xa000; } }
void music_play(void)       { __asm { jsr 0xa003; } }

// 4a. Call directly from main loop (1 frame per call)
music_init(0);
for (;;) { music_play(); vic_waitFrame(); }

// 4b. Or drive from raster IRQ for independence from main loop
__interrupt void music_irq(void) { music_play(); }
RIRQCode music_rirq;
rirq_build(&music_rirq, 1);
rirq_call(&music_rirq, 0, music_irq);
rirq_set(0, 250, &music_rirq);    // Fire in vblank area
rirq_sort();
rirq_start();
```

The `#pragma region` address (0xa000) must match the `.sid` file's load address field in its header.

---

### Raster IRQ Turbo Mode (U64 / SCPU compatible)

Use raster IRQ to enable CPU turbo in the vblank/border region only, keeping visible area at 1 MHz for stable raster timing.

```c
#include <c64/rasterirq.h>

RIRQCode rirq_on, rirq_off;

void setup_turbo_irq(void) {
    rirq_init_kernal();

    // Enable turbo at line 250 (vblank / lower border)
    rirq_build(&rirq_on, 1);
    rirq_write(&rirq_on, 0, (char *)0xd030, 1);    // 0xd030 = turbo enable
    rirq_set(0, 250, &rirq_on);

    // Disable turbo at line 49 (just before visible area)
    rirq_build(&rirq_off, 1);
    rirq_write(&rirq_off, 0, (char *)0xd030, 0);
    rirq_set(1, 49, &rirq_off);

    rirq_sort();
    rirq_start();
}
```

Extend this to control `$D031` speed index (bits 0–3) for full U64 turbo control. See `TURBOCONTROLMANUAL.md` in UltimateDemo2026 for U64-specific details.

---

### Raster IRQ with C Function Call

`rirq_call()` places a JSR into the IRQ code block, calling a C function from within the raster IRQ. The function must be declared `__interrupt`.

```c
__interrupt void my_irq_handler(void) {
    // Runs at the configured raster line
    vic.color_border++;
    do_work();
    vic.color_border--;
}

RIRQCode my_rirq;
rirq_build(&my_rirq, 1);
rirq_call(&my_rirq, 0, my_irq_handler);
rirq_set(slot, line, &my_rirq);
```

Practical uses: update virtual sprites mid-frame, drive SID music, trigger DMA.

---

### Virtual Sprite Multiplexer — Full Frame Lifecycle

```c
// Setup (once)
vspr_init(Screen);                  // Screen = pointer to screen RAM
for (char i = 0; i < 16; i++)
    vspr_set(i, true, x, y, img, color);

rirq_sort();
rirq_start();

// Each frame — ORDER MATTERS:
for (char i = 0; i < 16; i++)
    vspr_move(i, new_x[i], new_y[i]);

vspr_sort();       // 1. Sort by Y-position
rirq_wait();       // 2. Wait for previous IRQ pass to finish
vspr_update();     // 3. Commit to IRQ handler
rirq_sort();       // 4. Re-sort raster slots
```

For IRQ-driven update (safer, no tearing):

```c
__interrupt void spr_irq(void) {
    vspr_update();
    rirq_sort();    // Automatically called inside interrupt context
}
RIRQCode sprirq;
rirq_build(&sprirq, 1);
rirq_call(&sprirq, 0, spr_irq);
rirq_set(VSPRITES_MAX - 8, 250, &sprirq);
```

---

### Sprite-Background Collision Detection

The VIC hardware collision register only detects sprite-sprite or sprite-background collisions generically. For per-character collision (e.g. wall blocking), test manually:

```c
// Convert pixel coordinate to screen character
char char_at_pixel(int x, int y) {
    return Screen[40 * (y >> 3) + (x >> 3)];
}

// Detect: check four corners of sprite bounding box
bool sprite_hits_wall(int spx, int spy) {
    return char_at_pixel(spx,     spy    ) >= WALL_CHAR_MIN ||
           char_at_pixel(spx + 7, spy    ) >= WALL_CHAR_MIN ||
           char_at_pixel(spx,     spy + 7) >= WALL_CHAR_MIN ||
           char_at_pixel(spx + 7, spy + 7) >= WALL_CHAR_MIN;
}

// Block movement: precheck before updating position
if (joyx[0] < 0 && spx > 0 && !sprite_hits_wall(spx - 1, spy))
    spx--;
```

For circular/ball sprites, use distance-based collision around the center:

```c
bool ball_hits_char(int cx, int cy, int px, int py) {
    if (char_at_pixel(px, py) < WALL_CHAR_MIN) return false;
    // Snap to char-cell top-left
    int cx2 = (px & ~7) + 4;
    int cy2 = (py & ~7) + 4;
    int dx = cx2 - cx, dy = cy2 - cy;
    return (dx * dx + dy * dy) < RADIUS * RADIUS;
}
```

---

### Sprite Band Multiplexing (manual, no vspr_*)

For full control: divide screen into N horizontal bands; at each band boundary, reprogram all 8 VIC sprite registers via raster IRQ.

```c
#define BANDS 4
RIRQCode * rirq_bands[BANDS];

void setup_bands(void) {
    for (char b = 0; b < BANDS; b++) {
        rirq_bands[b] = rirq_alloc(8 * 2 + 2);  // 8 y-pos + 8 img-ptr writes
        for (char s = 0; s < 8; s++) {
            rirq_write(rirq_bands[b], 2 + s,      &vic.spr_pos[s].y, ypos[b][s]);
            rirq_write(rirq_bands[b], 2 + 8 + s,  Screen + 0x3f8 + s, img[b][s]);
        }
        rirq_set(b, 50 + b * 50, rirq_bands[b]);
    }
}

// Each frame: update band data
for (char b = 0; b < BANDS; b++)
    for (char s = 0; s < 8; s++)
        rirq_data(rirq_bands[b], 2 + s, new_ypos[b][s]);
```

---

### Per-Tile and Per-Character Color with CharPad Tiles

CharPad exports `ctm_attr1` — one byte per tile (or per character) giving the color attribute.

```c
// 1. Embed assets
const char Charset[]    = { #embed ctm_chars lzo "tiles.ctm" };
const char TileMap[]    = { #embed ctm_map8      "tiles.ctm" };  // tile index per screen pos
const char TileDefs[]   = { #embed ctm_tiles8    "tiles.ctm" };  // 4×4 chars per tile
const char TileColors[] = { #embed ctm_attr1     "tiles.ctm" };  // 1 color per tile

// 2. Expand charset
oscar_expand_lzo(CharsetRAM, Charset);

// 3. Render screen
for (char ty = 0; ty < TILE_ROWS; ty++) {
    for (char tx = 0; tx < TILE_COLS; tx++) {
        char ti = TileMap[ty * TILE_COLS + tx];     // Tile index
        const char *td = TileDefs + 16 * ti;        // 4×4 char block
        char col = TileColors[ti];                   // Per-tile color

        for (char y = 0; y < 4; y++) {
            for (char x = 0; x < 4; x++) {
                char ch = td[4 * y + x];
                Screen[40 * (ty*4+y) + (tx*4+x)] = ch;
                Color [40 * (ty*4+y) + (tx*4+x)] = col;  // same for per-tile
                // For per-char color: Color[...] = TileColors[ch];
            }
        }
    }
}
```

---

### Large Memory Layouts

**Remove BASIC ROM (+8 KB, up to ~40 KB):**
```c
#include <c64/memmap.h>
#pragma region(main, 0x0880, 0xd000, , , {code, data, bss, heap, stack})

int main(void) {
    mmap_set(MMAP_NO_BASIC);
    // 0x0800–0xcfff now available
}
```

**Remove all ROMs and I/O (+full ~50 KB, no kernal):**
```c
#pragma region(main,  0x1000, 0xff80, , , {code, data, bss, heap})
#pragma region(stack, 0x0880, 0x1000, , , {stack})
#pragma stacksize(0x0780)

int main(void) {
    mmap_trampoline();      // Install IRQ/NMI trampoline before removing kernal
    mmap_set(MMAP_RAM);     // All RAM — no ROMs, no I/O at $d000
    void *big = malloc(50000);
}
```

**Resource regions (data in separate address range):**
```c
#pragma section(resources, 0)
#pragma region(resreg, 0xb000, 0xc000, , , {resources})
#pragma data(resources)
const char LevelData[] = { #embed lzo "level1.bin" };
#pragma data(data)
```

---

### Inlay Levels (Code Overlays)

Compress multiple code sections into constants, expand on demand into a shared RAM window.

```c
#pragma section(icode0, 0)
#pragma region(isec0, 0xc000, 0xd000, , Inlay0, {icode0})

#pragma code(icode0)
void Level0_Entry(void) {
    // Level-specific code; lives at 0xc000 when expanded
}
#pragma code(code)   // Back to main code section

// Runtime: expand then call
oscar_expand_lzo((char *)0xc000, Inlay0);
Level0_Entry();      // Now callable at its address

// Multiple inlays share the same RAM window — only one loaded at a time
```

---

### CORDIC Algorithms (Fast Trigonometry, No FPU)

CORDIC iteratively rotates a vector to compute atan2, sin/cos, or distance. Much faster than float on 6502.

**atan2 — 16-bit, 7 iterations (~8-bit angle output):**
```c
static const int arortab[8] = {8192, 4836, 2555, 1297, 651, 325, 162, 81};

// Returns angle as 0–255 (full circle)
int cordic_atan2(int dx, int dy) {
    int sum = 0;
    if (dx < 0) { dx = -dx; dy = -dy; sum = -32768; }
    for (char i = 0; i < 7; i++) {
        int sx = dx >> i, sy = dy >> i;
        if (dy > 0)      { dx += sy; dy -= sx; sum += arortab[i]; }
        else if (dy < 0) { dx -= sy; dy += sx; sum -= arortab[i]; }
    }
    return (sum >> 8) & 0xff;
}
```

**atan2 — 8-bit, 6 iterations (fastest, lower precision):**
```c
static const char arortab8[6] = {32, 19, 10, 5, 3, 1};

char cordic_atan2_byte(char dx, signed char dy) {
    signed char sum = 0;
    if (dx & 0x80) { dx >>= 1; dy >>= 1; }   // Prevent overflow
    for (char i = 0; i < 6; i++) {
        char sx = dx >> i;
        signed char sy = dy >> i;
        if (dy > 0)      { dx += sy; dy -= sx; sum += arortab8[i]; }
        else if (dy < 0) { dx -= sy; dy += sx; sum -= arortab8[i]; }
    }
    return (char)sum;
}
```

**sin/cos — 8 iterations:**
```c
__striped static const int arortab[8] = {8192, 4836, 2555, 1297, 651, 326, 163, 81};

void cordic_sincos(int w, signed char *si, signed char *co) {
    int dx = 9945, dy = 0;        // Unit vector scaled by CORDIC gain (~0.6073)
    if (w > 16384 || w < -16384) { w ^= 0x8000; dx = -dx; }  // Quadrant adjust
    for (char i = 0; i < 8; i++) {
        int sx = dx >> i, sy = dy >> i;
        if (w > 0) { dx += sy; dy -= sx; w -= arortab[i]; }
        else       { dx -= sy; dy += sx; w += arortab[i]; }
    }
    *si = dy >> 8;
    *co = dx >> 8;
}
```

**Distance (vector magnitude) — 4 iterations:**
```c
// Much faster than sqrt() for game physics
int cordic_dist(int dx, int dy) {
    char ux = (dx < 0) ? -dx : dx;
    signed char uy = dy;
    #pragma unroll(full)
    for (char i = 0; i < 4; i++) {
        char sx = ux >> i;
        signed char sy = uy >> i;
        if (uy > 0) { ux += sy; uy -= sx; }
        else        { ux -= sy; uy += sx; }
    }
    // Compensate for CORDIC gain: multiply by ~0.6073
    return (ux + (ux >> 2) - (ux >> 6)) >> 1;
}
```

Performance note: use `__striped` on rotation tables and `#pragma unroll(full)` on the inner loop for maximum speed.

---

### Fractional Sprite Positions (Sub-Pixel Motion)

Store position at higher precision than pixels, display truncated. Gives smooth movement without fractional pixel support in hardware.

```c
#define FRAC_BITS 4                   // 4 fractional bits = 1/16 pixel precision
#define FRAC_SCALE (1 << FRAC_BITS)

int sx = initial_x << FRAC_BITS;     // Store position * 16
int vx = velocity_pixels_per_frame;  // Also in 1/16ths (e.g. 8 = 0.5 px/frame)

// Each frame:
sx += vx;
spr_move(0, 24 + (sx >> FRAC_BITS), sy >> FRAC_BITS);
```

---

### Horizontal Scroll with Spread Row Updates

For smooth pixel scrolling, update only a fraction of the back buffer each frame to stay within the frame budget:

```c
// Scroll state
char xf = 0;   // Fine scroll offset (0–7 pixels)
int  xp = 0;   // Coarse column position in map

void scroll_right(void) {
    // Each frame: update only 3 rows out of 25 (rotated round-robin)
    char y0 = xf * 3;
    for (char y = y0; y < y0 + 3; y++) {
        memmove(Back + 40*y + 1, Back + 40*y, 39);  // Shift row right
        Back[40*y] = Map[y][xp];                     // Fill new left column
    }
    vic_waitBottom();
    vic.ctrl2 = (vic.ctrl2 & 0xf8) | xf;            // Fine scroll register
    xf++;
    if (xf == 8) {
        xf = 0;
        memcpy(Screen, Back, 1000);  // Flip: copy back-buffer to screen
        xp = (xp - 1) & MAP_WIDTH_MASK;
    }
}
```

Key: `vic.ctrl2` bits 0–2 control fine horizontal scroll (0–7 pixels). Crossing 8 pixels requires copying one more column and resetting the fine scroll.

---

### CharPad Full Pipeline

```c
// Embed all CharPad exports from a single .ctm file
const char RawChars[]   = { #embed ctm_chars  lzo "level.ctm" };  // Character bitmaps
const char TileIndices[]= { #embed ctm_map8       "level.ctm" };  // Tile per screen pos
const char TileDefs[]   = { #embed ctm_tiles8     "level.ctm" };  // 4×4 chars per tile
const char TileAttrs[]  = { #embed ctm_attr1      "level.ctm" };  // Color per tile

// Or for 16-bit tile and map indices (> 256 tiles):
const unsigned TileIndices16[] = { #embed ctm_map16   word "level.ctm" };
const unsigned TileDefs16[]    = { #embed ctm_tiles16 word "level.ctm" };

// ctm_tiles8sw — alternative tile layout with reordered x/y dimensions

// At runtime:
oscar_expand_lzo(CharsetRAM, RawChars);
// Then render TileDefs + TileIndices + TileAttrs into Screen/ColorRAM
```

---

### Spritepad Pipeline

```c
// Embed sprite animation frames
const char SpriteFrames[] = { #embed spd_sprites lzo "sprites.spd" };
const char SpriteTiles[]  = { #embed spd_tiles       "sprites.spd" };

// Expand to sprite area (e.g. at $3800 in screen bank)
oscar_expand_lzo(SpriteRAM, SpriteFrames);

// Animate: update frame pointer each tick
byte frame = 0, timer = 0;
if (++timer >= FRAMES_PER_ANIM) {
    timer = 0;
    frame = (frame + 1) % TOTAL_FRAMES;
}
spr_image(0, BASE_IMG + frame);
```

---

### C++ Double-Buffered Bitmap Animation

```cpp
#include <gfx/bitmap.h>

// Two hires buffers; displayed alternately
static char Hires[2][8000];
static char Color[2][1000];

Bitmap screen[2];
byte   active = 0;

void init(void) {
    bm_init(&screen[0], Hires[0], 40, 25);
    bm_init(&screen[1], Hires[1], 40, 25);
}

void draw_frame(byte buf) {
    bm_fill(&screen[buf], 0);                                       // Clear
    bm_line(&screen[buf], &clip, x0, y0, x1, y1, 0xff, LINOP_OR);  // Draw
}

void flip(void) {
    vic_waitBottom();
    vic_setmode(VICM_HIRES, Color[active], Hires[active]);
    active ^= 1;
}

// XOR mode (draw twice = erase, no explicit clear needed):
bm_line(&screen[0], &clip, x0, y0, x1, y1, 0xff, LINOP_XOR);

// Template-based fast clear (generates absolute address per buffer — no indirect ptr):
template <int N>
void clear_buffer(void) {
    #pragma unroll(page)
    for (int i = 0; i < 8000; i++)
        Hires[N][i] = 0;
}
void clear(byte buf) {
    switch (buf) {
        case 0: clear_buffer<0>(); break;
        case 1: clear_buffer<1>(); break;
    }
}
```

---

### Bitmap Scrolling (Double-Buffered)

Smooth pixel scrolling in hires/multicolor mode. The key constraints: the VIC-II reads bitmap and color RAM simultaneously, so both must be updated in sync and swapped at vblank.

```c
// Define two pairs of hires + color buffers at fixed addresses
#pragma region(main, 0x0900, 0x8c00, , , {code, data, bss, heap, stack})
static char * const Hires1 = (char *)0xe000;
static char * const Hires2 = (char *)0xa000;
static char * const Color1 = (char *)0xc000;   // color for Hires1
static char * const Color2 = (char *)0x8c00;   // color for Hires2
static char * const ColorR = (char *)0xd800;   // real color RAM

// To avoid tearing, split the 8000-byte copy into 5 chunks of 1600 bytes
// spread across consecutive frames before flipping.
// Fine scroll: write to vic.ctrl1 bits 0–2 while keeping BMM and DEN set.

// Fine vertical scroll register (0–7 pixels):
vic.ctrl1 = VIC_CTRL1_DEN | VIC_CTRL1_BMM | fine_scroll_y;
```

---

## Tutorial Index

All tutorials are in `/home/xahmol/OscarTutorials/`. Resources (`.ctm`, `.spd`, `.sid`, `.bin`) are in `Resources/`.

| Number | Directory | Topic |
|--------|-----------|-------|
| 0010 | HelloWorld | `printf` to screen |
| 0020 | Diagonals | Screen memory diagonal fill |
| 0030 | KeyWait | `getch()` keyboard wait |
| 0040 | Lowercase | PETSCII lowercase charset |
| 0050 | Salutation | User input + formatted output |
| 0060 | ColorChars | Fill screen with colored chars |
| 0070 | Guessing | Number guessing game |
| 0100 | ScreenMem | Direct screen memory pointer (`0x0400`) |
| 0110 | ColorMem | Direct color memory pointer (`0xd800`) |
| 0200 | CursorMove | Manual cursor with screen/color RAM |
| 0300 | Labyrinth | Simple maze game |
| 0400 | PeekAndPoke | Direct register write for border color |
| 0410 | NoPeekAndPoke | Same via `vic.h` struct |
| 1000 | BorderColor | `vic.color_border`, `vic.color_back` |
| 1010 | RasterLine | `vic_waitLine()`, raster position read |
| 1100 | CharRom | Copy char ROM to RAM via `mmap_set` |
| 1110 | CustomChar | Define custom charset in RAM |
| 1120 | CopyChars | `memcpy` chars between memory areas |
| 1130 | CharResource | `#embed lzo` binary font |
| 1140 | CharPadResource | `#embed ctm_chars lzo` from .ctm |
| 1150 | CharPadScreen | Full screen from .ctm (chars + map + color) |
| 1160 | CharPadTileSet | Tiles from .ctm with `ctm_tiles8` |
| 1200 | ScrollUp | Character vertical scroll up |
| 1210 | ScrollUpFast | Fast scroll with `memcpy` |
| 1220 | ScrollUpFine | Fine-grain smooth vertical scroll |
| 1230 | ScrollLeft | Character horizontal left scroll |
| 1240 | ScrollRight | Character horizontal right scroll |
| 1245 | ScrollHSegmentUpdate | Spread row updates for pixel-smooth H scroll |
| 1250 | ScrollDown | Character vertical scroll down |
| 1260 | Scroll4Way | 4-direction scroll with joystick |
| 1270 | ScrollTileSet | Scroll with tile expansion |
| 1280 | FastScrollTileSet | Optimized tile-based scroll |
| 1300 | StaticSprite | Place sprite with `spr_set()` |
| 1310 | MovingSprite | Joystick-controlled sprite |
| 1320 | ReflectingSprite | Sprite bounce off edges |
| 1330 | CollidingSprite | Sprite–sprite collision |
| 1340 | FractionalSpritePos | Fractional fixed-point sprite position |
| 1350 | GravitySprite | Gravity + bounce physics |
| 1360 | BouncingSprite | Physics bounce |
| 1370 | AnimatedSprite | Multi-frame animation |
| 1380 | SpriteResource | `#embed spd_sprites` from .spd |
| 1400 | RasterIRQ | Basic raster IRQ setup |
| 1410 | RasterIRQBars | Color bars via IRQ writes |
| 1420 | RasterIRQMoving | Moving bar with math |
| 1425 | RasterIRQTurbo | **Turbo mode toggle via raster IRQ** |
| 1430 | ScrollText | Horizontal scroll text effect |
| 1440 | SplitScroll | Split-screen independent scroll |
| 1450 | ParallaxHScroll | Horizontal parallax layers |
| 1460 | ParallaxVScroll | Vertical parallax layers |
| 1470 | Parallax2DScroll | 2D parallax |
| 1480 | ParallaxTileScroll | Parallax with tile layers |
| 1500 | BitmapPixels | Individual pixel in hires bitmap |
| 1520 | BitmapColorImage | Bitmap with color overlay |
| 1530 | SplitScreenColorImage | Split-screen bitmap |
| 1540 | BitmapScroll | **Double-buffered bitmap pixel scroll** |
| 1600 | SpriteBackCollision | Sprite–background char collision |
| 1610 | SpriteBackBlocking | Collision-based movement blocking |
| 1620 | BigSpriteBlocking | Large sprite H/V edge blocking |
| 1630 | BallSpriteBlocking | Distance-based ball collision |
| 1700 | SpriteMuxBands | Manual band multiplexing (32 sprites) |
| 1710 | VSpriteMux | Virtual sprite mux, 16 sprites |
| 1720 | VSpriteMux32 | Virtual sprite mux, 32 sprites |
| 1750 | VSpriteMuxIRQ | Virtual sprite update from IRQ |
| 1800 | TilesPerTileColor | Per-tile color from `ctm_attr1` |
| 1810 | TilesPerCharColor | Per-character color lookup |
| 1820 | TilesBitmapPerTileColor | Tile bitmap with per-tile color |
| 2000 | SIDMusicPlayback | **Load + play .sid file synchronously** |
| 2010 | SIDMusicInterrupt | **SID music driven by raster IRQ** |
| 3000 | AdventureTokens | Text tokenizer |
| 3010 | AdventureParse | Text adventure parser |
| 3020 | AdventureMap | Room map navigation |
| 3030 | AdventureItems | Item pickup/drop |
| 3040 | AdventureDoors | Door/lock mechanics |
| 3050 | AdventureKeys | Key management |
| 4000 | FloatNumbers | Basic float arithmetic |
| 4010 | FixPointNumbers | Fixed-point struct ops |
| 4020 | FixPointMult | 8.8 fixed-point multiply |
| 4030 | FixPointTable | Precomputed sin/cos table |
| 4200 | AtanFloat | `atan2()` baseline |
| 4210 | AtanTable | Lookup table atan |
| 4220 | AtanCordic | **CORDIC atan2, 16-bit** |
| 4230 | AtanCordicByte | **CORDIC atan2, 8-bit (fastest)** |
| 4240 | CosinFloat | `cos()` baseline |
| 4250 | CosinTable | Lookup table cos |
| 4260 | CosinCordic | **CORDIC sin/cos** |
| 4270 | DistanceSqrt | `sqrt()` distance baseline |
| 4280 | DistanceTable | Lookup table distance |
| 4290 | DistanceCordic | **CORDIC distance (fastest)** |
| 4500 | LargeMemoryLayout | `#pragma region` + MMAP_NO_BASIC |
| 4510 | FullMemory | Maximum 50 KB + dedicated stack region |
| 4520 | ResourceRegions | Data in separate address regions |
| 4530 | InlayLevels | **Compressed code overlays** |
| 5000 | VectorAnimXor | C++ bitmap animation, XOR draw/erase |
| 5010 | VectorAnimXorDelay | XOR with delayed erase |
| 5020 | VectorAnimDoubleBuffer | **C++ double-buffered animation** |
| 5030 | VectorAnimDBuffClear | **Template-based fast buffer clear** |
