# VDC Screen Editor 2 — Architecture Reference

This document describes the memory layout, file formats, overlay system, and data flow of VDC Screen Editor 2. It is intended as a reference for contributors and for AI coding assistants working on the codebase.

---

## Table of Contents

- [1. Executables](#1-executables)
- [2. C128 Memory Map](#2-c128-memory-map)
  - [Bank 0](#bank-0-cpu-default--what-0xaddr-normally-refers-to)
  - [Bank 1](#bank-1-accessed-via-banking-layer-only--never-directly-mapped-to-cpu)
  - [VDC (8563) Internal RAM](#vdc-8563-internal-ram)
- [3. VDC Attribute Byte](#3-vdc-attribute-byte)
- [4. Overlay System](#4-overlay-system)
  - [Constants](#constants)
  - [Overlay Storage Map](#overlay-storage-map)
  - [Loading an Overlay](#loading-an-overlay)
  - [Oscar64 Overlay Pragmas](#oscar64-overlay-pragmas)
- [5. Screen Map Format](#5-screen-map-format-bank-1-starting-at-screenmapbase--0x5800)
  - [Address Computation](#address-computation)
  - [Signature](#signature-48-bytes-at-offset-width--height)
  - [Macros](#macros)
- [6. File Formats](#6-file-formats)
  - [`.proj` — Project Metadata](#proj--project-metadata-file)
  - [`.scrn` — Screen Data](#scrn--screen-data-file)
  - [`.chrs` / `.chra` — Charset Files](#chrs--chra--charset-files)
  - [`.prg` — Standalone Viewer](#prg--standalone-viewer-program-generated-by-vdcse2prg)
  - [SEQ Files](#seq-files--petscii-sequential-files)
  - [Disk Images](#disk-images)
- [7. Banking Layer](#7-banking-layer)
  - [Bank Constants](#bank-constants)
  - [Core Functions](#core-functions)
- [8. Global Editor State](#8-global-editor-state)
- [9. Undo / Redo System](#9-undo--redo-system)
  - [Overview](#overview)
  - [VDC RAM Undo Region](#vdc-ram-undo-region)
  - [Per-Entry VDC RAM Layout](#per-entry-vdc-ram-layout)
  - [Ring Buffer and Address Wrapping](#ring-buffer-and-address-wrapping)
  - [State Variables](#undo--redo-state-variables)
  - [`redopresent` Field Values](#redopresent-field-values)
  - [Special Operations](#special-operations)
- [10. Key Structures](#10-key-structures)
- [11. Library Variants](#11-library-variants)
- [12. Build System Overview](#12-build-system-overview)

---

## 1. Executables

The project produces four binary outputs:

| Binary | Entry Point | Memory Region | Purpose |
|---|---|---|---|
| `vdcse.prg` | `src/main.c` | 0x1C80–0xABFF | Main screen editor (overlay-based) |
| `vdcse2prg.prg` | `src/prg_gen.c` | ~0x1C80 | Standalone PRG generator utility |
| `vdcse2prgvwc.prg` | `src/view.c` | 0x1CA0–0x4600 | Screen viewer (soft-scroll demo) |
| `bootsect.bin` | `src/bootsect.c` | Track 1 Sector 0 | Disk boot sector (raw binary, no load address) |

The utilities (`vdcse2prg`, `vdcse2prgvwc`) use the `*_nobnk` library variants (`vdc_nobnk.c`, `vdcwin_nobnk.c`, `bank_minimal.c`) which avoid the full banking layer needed by the main editor.

---

## 2. C128 Memory Map

### Bank 0 (CPU default — what `0xADDR` normally refers to)

| Address Range | Symbol / Name | Contents |
|---|---|---|
| 0x0000–0x00FF | Zero page | OS/KERNAL workspace + Oscar64 ZP registers |
| 0x0100–0x01FF | CPU stack | Hardware 6502 stack |
| 0x0200–0x12FF | OS workspace | KERNAL, BASIC, CIA buffers |
| 0x1300–0x1AFF | `MACOSTART` + `MACOSIZE` | Machine code area (0x800 bytes) for banking routines |
| 0x1B00–0x1C7F | Available | (gap before editor) |
| 0x1C80–0xABFF | `vdcse` region | Main editor: code → data → BSS → heap → stack |
| 0xAC00–0xBFFF | `OVERLAYLOAD` | Overlay load slot (0x1400 bytes = `OVERLAYSIZE`) |
| 0xC000–0xCFFF | `OVERLAYBANK0` | Overlay storage for overlays 1, 3, 5 (Bank 0 side) |
| 0xD000–0xDFFF | I/O / Overlay | I/O registers (when I/O mapped) or overlay storage for overlays 2, 4, 6 |
| 0xE000–0xFFFF | KERNAL ROM | C128 KERNAL |

The Oscar64 pragma that defines the main editor region:
```c
#pragma region( vdcse, 0x1c80, 0xc000 - OVERLAYSIZE, , , {code, data, bss, heap, stack} )
```
`OVERLAYSIZE` = 0x1400, so the region ends at 0xAC00 — leaving room for the overlay slot.

### Bank 1 (accessed via banking layer only — never directly mapped to CPU)

| Address | Symbol | Size | Contents |
|---|---|---|---|
| 0x2000 | `WINDOWBASEADDRESS` | 8 KB | Window system: saved screen backgrounds for up to 3 popup windows |
| 0x4000 | `CHARSETSYSTEM` | 2 KB | Copy of the original system charset (for restore-on-exit) |
| 0x4800 | `CHARSETNORMAL` | 2 KB | Standard (non-alternate) charset data (256 chars × 8 bytes) |
| 0x5000 | `CHARSETALTERNATE` | 2 KB | Alternate charset data (256 chars × 8 bytes) |
| 0x5800 | `SCREENMAPBASE` | up to ~30 KB | Screen map (see §5 for layout) |
| 0xCFFF | `MEMORYLIMIT` | — | Upper usable limit; screen map must fit below this |
| 0xD000 | `OVERLAYBANK1` | 0x3000 | Overlay storage for overlays 1–6 (Bank 1 side) |

All Bank 1 access goes through the banking layer (`banking.c`):
```c
bnk_readb(BNK_1_FULL, address)
bnk_writeb(BNK_1_FULL, address, value)
bnk_memcpy(BNK_1_FULL, dst, BNK_1_FULL, src, len)
bnk_load(device, 1, (char *)SCREENMAPBASE, filename)
```

### VDC (8563) Internal RAM

The VDC chip has its own 16–64 KB of RAM, accessed exclusively via VDC registers 18 (address high) and 19 (address low/data). All VDC RAM access goes through `vdc_mem_read_at()` / `vdc_mem_write_at()` or the block operations in `vdc_core.c`.

Default layout for **80×25 PAL** (mode 0, `VDC_TEXT_80x25_PAL`):

| VDC Address | Size | Contents |
|---|---|---|
| 0x0000–0x07CF | 2000 B | Text display area (80×25 screen codes) |
| 0x0800–0x0FCF | 2000 B | Attribute display area (80×25 attribute bytes) |
| 0x1000–0x17CF | 2000 B | Swap text buffer (used by soft-scroll) |
| 0x1800–0x1FCF | 2000 B | Swap attribute buffer |
| 0x2000–0x2FFF | 4096 B | Standard charset (256 chars × 16 bytes VDC format) |
| 0x3000–0x3FFF | 4096 B | Alternate charset (256 chars × 16 bytes VDC format) |

Modes with more rows (80×50, 80×70) require more VDC RAM and use different base addresses. The exact addresses for each mode are stored in `vdc_modes[]` (array of `struct VDCModeSet` in `vdc_core.h`):

```c
struct VDCModeSet {
    unsigned width;      // columns
    unsigned height;     // rows
    char extmem;         // 1 if 64 KB VDC RAM required
    unsigned base_text;  // VDC address of text display
    unsigned base_attr;  // VDC address of attribute display
    unsigned swap_text;  // VDC address of swap text buffer
    unsigned swap_attr;  // VDC address of swap attribute buffer
    unsigned char_std;   // VDC address of standard charset
    unsigned char_alt;   // VDC address of alternate charset
    unsigned extended;   // VDC address for extended memory (80×70 mode)
    char regset[17];     // VDC register values to set this mode
};
```

**VDC modes supported:**

| Enum Value | Mode | Columns×Rows | Requires 64 KB VDC RAM |
|---|---|---|---|
| 0 `VDC_TEXT_80x25_PAL` | 80×25 PAL | 80×25 | No (16 KB sufficient) |
| 1 `VDC_TEXT_80x50_PAL` | 80×50 PAL | 80×50 | Yes |
| 2 `VDC_TEXT_80x70_PAL` | 80×70 PAL | 80×70 | Yes |
| 3 `VDC_TEXT_80x25_NTSC` | 80×25 NTSC | 80×25 | No |
| 4 `VDC_TEXT_80x50_NTSC` | 80×50 NTSC | 80×50 | Yes |
| 5 `VDC_TEXT_80x60_NTSC` | 80×60 NTSC | 80×60 | Yes |

`vdc_state.memsize` and `vdc_state.memextended` track detected VDC RAM capacity at runtime.

---

## 3. VDC Attribute Byte

Every character cell has a corresponding attribute byte. The format (same as the VDC chip's hardware attribute format):

| Bits | Mask | Constant | Meaning |
|---|---|---|---|
| 3:0 | `0x0F` | — | Foreground color (0–15, VDC color palette) |
| 4 | `0x10` | `VDC_A_BLINK` | Blink |
| 5 | `0x20` | `VDC_A_UNDERLINE` | Underline |
| 6 | `0x40` | `VDC_A_REVERSE` | Reverse video |
| 7 | `0x80` | `VDC_A_ALTCHAR` | Use alternate charset |

VDC color palette (0–15):

| Value | Constant | Color |
|---|---|---|
| 0 | `VDC_BLACK` | Black |
| 1 | `VDC_DGREY` | Dark grey |
| 2 | `VDC_DBLUE` | Dark blue |
| 3 | `VDC_LBLUE` | Light blue |
| 4 | `VDC_DGREEN` | Dark green |
| 5 | `VDC_LGREEN` | Light green |
| 6 | `VDC_DCYAN` | Dark cyan |
| 7 | `VDC_LCYAN` | Light cyan |
| 8 | `VDC_DRED` | Dark red |
| 9 | `VDC_LRED` | Light red |
| 10 | `VDC_DPURPLE` | Dark purple |
| 11 | `VDC_LPURPLE` | Light purple |
| 12 | `VDC_DYELLOW` | Dark yellow |
| 13 | `VDC_LYELLOW` | Light yellow |
| 14 | `VDC_LGREY` | Light grey |
| 15 | `VDC_WHITE` | White |

---

## 4. Overlay System

The main editor (`vdcse`) uses 6 code overlays to stay within the C128's address space. All overlays share a single load slot and are swapped in on demand.

### Constants

```c
#define OVERLAYNUMBER  6       // Total number of overlays
#define OVERLAYSIZE    0x1400  // Each overlay: 5120 bytes
#define OVERLAYLOAD    0xAC00  // Where overlays are loaded (= 0xC000 - OVERLAYSIZE)
#define OVERLAYBANK0   0xC000  // Storage start in Bank 0
#define OVERLAYBANK1   0xD000  // Storage start in Bank 1
```

### Overlay Storage Map

Each overlay is stored in banked memory and loaded on demand into 0xAC00–0xBFFF:

| Overlay | Source File | Oscar64 Bank | Storage Location | Contents |
|---|---|---|---|---|
| 1 | `overlay1.c` | 2 | 0xC000, Bank 0 | Write mode, color write, palette editor, canvas resize |
| 2 | `overlay2.c` | 3 | 0xD000, Bank 0 | Visual plot, line/box drawing, move mode, select mode, try mode |
| 3 | `overlay3.c` | 4 | 0xC000, Bank 1 | Background color, screen mode selection, PRG/SEQ import/export, screenmap load/save |
| 4 | `overlay4.c` | 5 | 0xD000, Bank 1 | Project save/load, charset load/save, character editor |
| 5 | `overlay5.c` | 6 | (separate) | Version info display |
| 6 | `overlay6.c` | — | (separate) | SEQ file import/export (C64 and VDC modes) |

### Loading an Overlay

```c
// In main.c
void loadoverlay(char overlay_select)
{
    // Uses bnk_load to copy stored overlay into OVERLAYLOAD address
    // overlaydata[n].bank and overlaydata[n].address are set at init
}
```

Functions defined in overlays must be declared `__noinline` when called across overlay boundaries to prevent inlining.

### Oscar64 Overlay Pragmas

Each overlay file begins with:
```c
#pragma overlay(vdcseovlN, bank)
#pragma section(codeovlN, 0)
#pragma section(dataovlN, 0)
#pragma section(bssovlN, 0)
#pragma region(ovlN, OVERLAYLOAD, 0xC000, , bank, { codeovlN, dataovlN, bssovlN })
#pragma code(codeovlN)
#pragma data(dataovlN)
#pragma bss(bssovlN)
```

---

## 5. Screen Map Format (Bank 1, starting at `SCREENMAPBASE` = 0x5800)

The screen map stores the entire canvas in Bank 1. It holds screen codes, a 48-byte signature, and attribute bytes:

```
[ Screen codes: width × height bytes ]
[ Signature: 48 bytes                ]
[ Attribute bytes: width × height bytes ]
```

Total: `SCREENMAP_STORAGE_BYTES(w, h)` = `(w × h × 2) + 48` bytes.

### Address Computation

Two helper functions compute addresses within the screen map:

```c
// Screen code for cell (row, col):
char *screenmap_screenaddr(unsigned row, unsigned col, unsigned width)
    = (char *)(SCREENMAPBASE + row * width + col)

// Attribute byte for cell (row, col):
char *screenmap_attraddr(unsigned row, unsigned col, unsigned width, unsigned height)
    = (char *)(SCREENMAPBASE + row * width + col + width * height + 48)
```

### Signature (48 bytes at offset `width × height`)

A plain ASCII text string written by `placesignature()`:
```
"VDC Screen Editor vXX-YYYYMMDD-HHMM X.Mol "
```
Padded with spaces to 48 bytes. The remaining bytes of the 48-byte slot are zeroed.

### Macros

```c
#define SCREENMAP_SIGNATURE_BYTES    48UL
#define SCREENMAP_DATA_BYTES(w, h)   ((unsigned long)(w) * (unsigned long)(h))
#define SCREENMAP_STORAGE_BYTES(w, h) ((SCREENMAP_DATA_BYTES(w,h) * 2UL) + SCREENMAP_SIGNATURE_BYTES)
```

Maximum canvas size is bounded by `MEMORYLIMIT - SCREENMAPBASE` = 0x77FF = 30719 bytes total, supporting up to ~15335 cells (e.g., 80×191 or 255×60 — limited by `SCREENMAP_STORAGE_BYTES` check in the project loader).

---

## 6. File Formats

### `.proj` — Project Metadata File

23 bytes, no PRG load address. Written by `saveproject()`, read by `loadproject()` in `overlay3.c`.

| Offset | Size | Field | Description |
|---|---|---|---|
| 0 | 1 | `charsetchanged[0]` | 1 if standard charset was modified |
| 1 | 1 | `charsetchanged[1]` | 1 if alternate charset was modified |
| 2 | 1 | `screen_col` | Cursor column at save time |
| 3 | 1 | `screen_row` | Cursor row at save time |
| 4–5 | 2 | `canvas.sourcewidth` | Canvas width (big-endian: byte 4 = high, byte 5 = low) |
| 6–7 | 2 | `canvas.sourceheight` | Canvas height (big-endian) |
| 8–9 | 2 | `screentotal` | Total cells = width × height (big-endian) |
| 10 | 1 | `screenbackground` | Background color index (VDC color 0–15) |
| 11 | 1 | `mc_mb_normal` | Menu bar normal color attribute |
| 12 | 1 | `mc_mb_select` | Menu bar selected color attribute |
| 13 | 1 | `mc_pd_normal` | Pulldown menu normal color attribute |
| 14 | 1 | `mc_pd_select` | Pulldown menu selected color attribute |
| 15 | 1 | `mc_menupopup` | Popup window color attribute |
| 16 | 1 | `plotscreencode` | Current pen screencode |
| 17 | 1 | `plotcolor` | Current pen color |
| 18 | 1 | `plotreverse` | Current pen reverse flag (0 or 1) |
| 19 | 1 | `plotunderline` | Current pen underline flag (0 or 1) |
| 20 | 1 | `plotblink` | Current pen blink flag (0 or 1) |
| 21 | 1 | `plotaltchar` | Current pen altchar flag (0 or 1) |
| 22 | 1 | `vdc_state.mode` | VDCMode enum (0–5, see §2) |

Stored via `bnk_save(device, 0, projbuffer, projbuffer + 23, ...)` — note bank 0 (not Bank 1).

### `.scrn` — Screen Data File

Screen + attribute data for the canvas. Stored via `bnk_save(device, 1, SCREENMAPBASE, SCREENMAPBASE + screentotal*2 + 48, ...)`.

Oscar64's `bnk_save` prepends a 2-byte PRG load address when saving. The raw data layout is the screen map format (§5):

```
[2-byte load address: SCREENMAPBASE low, SCREENMAPBASE high]
[width × height screen codes]
[48-byte signature]
[width × height attribute bytes]
```

### `.chrs` / `.chra` — Charset Files

Standard charset (`.chrs`) and alternate charset (`.chra`). Each is exactly 2048 bytes of raw character data (256 characters × 8 bytes each in C128 Bank 1 format). Saved via `bnk_save(device, 1, CHARSETNORMAL, CHARSETNORMAL + 2048, ...)`.

**Note:** VDC charset RAM uses 16 bytes per character (each 8-byte character definition padded to 16 bytes). The Bank 1 storage uses 8 bytes per character. `bnk_redef_charset()` handles the conversion when pushing to VDC RAM.

### `.prg` — Standalone Viewer Program (generated by `vdcse2prg`)

The PRG generator (`vdcse2prg`) creates a self-contained viewer `.prg` that embeds the screen data and plays back with soft-scroll. It uses a fixed struct at address 0x1C80:

```c
struct VIEWDATA {
    char    *screen;      // Pointer to screen+attr data blob
    char    *charstd;     // Pointer to standard charset (NULL if unchanged)
    char    *charalt;     // Pointer to alternate charset (NULL if unchanged)
    unsigned width;       // Canvas width in columns
    unsigned height;      // Canvas height in rows
    unsigned screensize;  // Total cells (= width × height)
    char     mode;        // VDCMode enum (0–5)
    char     background;  // Background color index
};
```

The viewer code at 0x1CA0 reads this struct, initialises the VDC, and runs the soft-scroll display loop.

### SEQ Files — PETSCII Sequential Files

SEQ files are streams of PETSCII bytes compatible with C64/C128 sequential file readers.

**C64 SEQ mode** (`SEQ_MODE_C64`):
- Screen codes are mapped to PETSCII via `seq_map_screencode_to_petscii()`
- Reverse-video cells are normalized: `screencode -= 0x80; attr ^= VDC_A_REVERSE` via `seq_normalize_cell()`
- Color changes emit VIC color control codes from `c64_seq_color_control[16]`
- Charset changes emit 0x0E (standard) / 0x8E (alternate)
- Reverse changes emit 0x12 (RVS ON) / 0x92 (RVS OFF)
- Row terminators: `0x8d` (normal) or `0x0d` (reverse mode) — emitted between rows **only when `canvas.sourcewidth % 40 != 0`** (rows that fill an exact multiple of 40 columns auto-wrap on the C64's 40-column display without needing an explicit return)
- File starts with `CH_CLEAR` (0x93) and initial color/charset codes

**VDC SEQ mode** (`SEQ_MODE_VDC`):
- Screen codes that can be represented directly are mapped to PETSCII
- Non-representable codes use an ESC sequence: `CH_ESC` (0x1B) + `SEQ_VDC_ESC_RAW` (0x56) + raw screencode
- Underline: `CH_ESC` + `0x49` (on) / `0x4A` (off)
- Blink: `CH_ESC` + `0x4F` (on) / `0x50` (off)
- Color and reverse use the same codes as C64 mode
- No row terminators (VDC format relies on fixed-width rows)

**Import** decodes these sequences back to screen map cells via `decode_seq_byte()` in `overlay6.c`.

### Disk Images

Standard CBM disk formats (`.d64`, `.d71`, `.d81`). Built using `c1541`:
- Boot sector written to track 1 sector 0 via `-bwrite bootsect.bin 1 0`
- BAM patched to mark boot sector allocated via `-bpoke`
- Files written with CBM PETSCII filenames matching the program names

---

## 7. Banking Layer

All cross-bank access uses functions from `banking.c` (main editor) or `bank_minimal.c` (utilities).

### Bank Constants

```c
BNK_0_FULL   // Bank 0, full 64 KB access
BNK_1_FULL   // Bank 1, full 64 KB access
BNK_CHARROM  // Character ROM at 0xD000 (read-only)
```

### Core Functions

| Function | Purpose |
|---|---|
| `bnk_readb(bank, addr)` | Read one byte from banked memory |
| `bnk_writeb(bank, addr, val)` | Write one byte to banked memory |
| `bnk_memcpy(dstbank, dst, srcbank, src, len)` | Copy between banks |
| `bnk_memset(bank, addr, val, len)` | Fill banked memory |
| `bnk_cpytovdc(vdcaddr, srcbank, src, len)` | Copy from banked memory to VDC RAM |
| `bnk_cpyfromvdc(dstbank, dst, vdcaddr, len)` | Copy from VDC RAM to banked memory |
| `bnk_load(device, bank, addr, name)` | Load CBM file into banked memory |
| `bnk_save(device, bank, start, end, name)` | Save banked memory to CBM file |
| `bnk_redef_charset(vdcaddr, bank, srcaddr, count)` | Push charset data to VDC RAM |
| `bnk_iec_active(device)` | Test if a device is present on IEC bus |

---

## 8. Global Editor State

All editor state lives in file-scope globals in `src/main.c`, declared `extern` in `include/defines.h`. The most important:

| Variable | Type | Purpose |
|---|---|---|
| `canvas` | `struct VDCViewport` | The active viewport into the Bank 1 screen map |
| `screen_col`, `screen_row` | `unsigned` | Current cursor position on the canvas |
| `screentotal` | `unsigned` | Total cells = `canvas.sourcewidth × canvas.sourceheight` |
| `screenbackground` | `char` | VDC background color index |
| `plotscreencode` | `char` | Current pen screencode |
| `plotcolor` | `char` | Current pen color (VDC 0–15) |
| `plotreverse` | `char` | Current pen reverse attribute flag |
| `plotunderline` | `char` | Current pen underline attribute flag |
| `plotblink` | `char` | Current pen blink attribute flag |
| `plotaltchar` | `char` | Current pen altchar attribute flag |
| `charsetchanged[2]` | `char[]` | [0]=std charset modified, [1]=alt charset modified |
| `Undo[41]` | `struct UndoStruct[]` | Undo ring buffer; indices 1–40 active (index 0 is unused sentinel) |
| `undonumber` | `char` | Current undo slot (1–40, wraps to 1 after 40) |
| `overlaydata[6]` | `struct OverlayStruct[]` | Bank and address for each overlay's storage slot |
| `overlay_active` | `char` | Currently loaded overlay number (1–6, or 0 if none) |
| `filename[21]` | `char[]` | Current filename for file operations |
| `buffer[81]` | `char[]` | General-purpose string scratch buffer |
| `bootdevice` | `char` | Device number the program was booted from |
| `targetdevice` | `char` | Device number for file I/O operations |

### Undo System

See §9 for a full description. Summary: `Undo[41]` is a ring buffer (slots 1–40 active, index 0 unused sentinel). Undo data is stored in **VDC RAM** starting at `vdc_state.extended` — the first VDC address not used by the current screen mode.

---

## 9. Undo / Redo System

### Overview

The undo/redo system records rectangular regions of the canvas before each editing operation and can replay them forwards and backwards. It uses a ring buffer of up to 40 entries (`Undo[41]`, indices 1–40; index 0 is an unused sentinel). Undo data lives in **VDC RAM** — specifically in the portion of VDC RAM above the screen, attribute, swap, and charset areas for the current mode (`vdc_state.extended` onwards).

`undoenabled` (0 = disabled, 1 = enabled) can be toggled by the user from the menu. When a new project is loaded or created, `undoenabled` is set to 1 and `undoaddress` is reset to `vdc_state.extended`.

### VDC RAM Undo Region

`vdc_state.extended` holds the VDC RAM address where the undo buffer starts. Its value comes from `vdc_modes[mode].extended` and varies by screen mode:

| Mode | `vdc_state.extended` | VDC RAM available for undo (64 KB VDC) |
|---|---|---|
| 80×25 PAL/NTSC | 0x4000 | 48 KB |
| 80×50 PAL/NTSC | 0x6000 | 40 KB |
| 80×70 PAL / 80×60 NTSC | 0x9000 | 28 KB |

80×25 mode requires only 16 KB for display+charsets; it can operate with a 16 KB VDC chip but undo requires 64 KB VDC RAM. For modes needing 64 KB, undo is only available if `vdc_state.memextended == 1`.

`undoaddress` (a 16-bit `unsigned`) tracks the current write head within the VDC RAM undo region. It starts at `vdc_state.extended` and advances after each `undo_new()` call.

### Per-Entry VDC RAM Layout

Each undo entry is stored at `Undo[n].address` in VDC RAM. The entry layout depends on whether redo data is present (`redopresent`):

```
Offset                          Content
0                               Screen codes (undo snapshot): width × height bytes
width*height                    Attribute bytes (undo snapshot): width × height bytes
--- present only if redopresent > 0 ---
width*height*2                  Screen codes (redo snapshot): width × height bytes
width*height*3                  Attribute bytes (redo snapshot): width × height bytes
```

The `UNDO_BUFFER_BYTES` macro computes the total:
```c
#define UNDO_BUFFER_BYTES(w, h, redo)  (SCREENMAP_DATA_BYTES((w),(h)) * (2UL + 2UL*(unsigned long)(redo)))
// With redo:    4 × width × height bytes
// Without redo: 2 × width × height bytes
```

Redo space is skipped (`redopresent = 0`) if allocating the full entry would overflow `undoaddress` beyond 0xFFFF.

### Ring Buffer and Address Wrapping

`undonumber` (1–40) is the index of the most recent undo slot. It increments on each `undo_new()` call, wrapping from 40 back to 1. When a wrap occurs, `undoaddress` is also reset to `vdc_state.extended`, overwriting the oldest undo data in VDC RAM.

Termination sentinel: `Undo[undonumber].address` is set to 0 after each write to mark the next slot as empty. This is used by undo/redo navigation to detect the end of the valid range.

### Undo / Redo State Variables

| Variable | Type | Meaning |
|---|---|---|
| `undoenabled` | `char` | 0 = undo disabled, 1 = enabled |
| `undoaddress` | `unsigned` | Current VDC RAM write head for undo data |
| `undonumber` | `char` | Current ring slot (1–40) |
| `undo_undopossible` | `char` | Counter: how many undo steps are available |
| `undo_redopossible` | `char` | Counter: how many redo steps are available |
| `Undo[41]` | `struct UndoStruct[]` | Metadata ring; index 0 unused sentinel |

### `redopresent` Field Values

| Value | Meaning |
|---|---|
| 0 | No redo data stored (not enough VDC RAM) |
| 1 | Redo space reserved but not yet filled (redo data captured during a future undo) |
| 2 | Redo data valid — filled in by `undo_performundo()` |

During `undo_performundo()`, the current canvas state is copied into the redo slots (`width*height*2` and `width*height*3` offsets) before restoring the undo snapshot, so that `undo_performredo()` can replay it.

### Special Operations

- **`undo_escapeundo()`** — Called when ESC is pressed during select/move mode to cancel an in-progress undo slot without committing it. Clears `Undo[undonumber].address` and decrements `undonumber`.
- **New operation resets redo** — Calling `undo_new()` while `undo_redopossible > 0` discards the redo chain: `undo_undopossible` is reset to 1 and `undo_redopossible` to 0.

---

## 10. Key Structures

### `struct VDCViewport` (from `vdc_win.h`)

Represents a scrollable view into the Bank 1 screen map:
```c
struct VDCViewport {
    struct VDCWin view;    // The on-screen window showing the viewport
    unsigned sourcewidth;  // Full canvas width
    unsigned sourceheight; // Full canvas height
    unsigned sourcexoffset; // Horizontal scroll offset
    unsigned sourceyoffset; // Vertical scroll offset
    char *source;          // Pointer into Bank 1 screen map
};
```

### `struct VDCWin` (from `vdc_win.h`)

A positioned text window on screen:
```c
struct VDCWin {
    char wx, wy;    // Top-left corner
    char wwidth;    // Width in columns
    char wheight;   // Height in rows
    char wcx, wcy;  // Cursor position within window
};
```

### `struct UndoStruct` (from `defines.h`)

One undo entry:
```c
struct UndoStruct {
    unsigned address;    // VDC RAM address where undo (and optional redo) data is stored
    unsigned ystart;     // Canvas row where the region starts
    unsigned xstart;     // Canvas column where the region starts
    unsigned height;     // Height of saved region
    unsigned width;      // Width of saved region
    char redopresent;    // 0=no redo, 1=redo reserved, 2=redo valid (see §9)
};
```

---

## 11. Library Variants

The codebase has two variants of the core VDC and window libraries:

| Full banking | No-banking | Used by |
|---|---|---|
| `vdc_core.c` + `banking.c` | `vdc_nobnk.c` | Main editor (`vdcse`) |
| `vdc_win.c` | `vdcwin_nobnk.c` | Main editor |
| — | `bank_minimal.c` | `vdcse2prg` utility |
| — | `vdc_nobnk.c` + `vdcwin_nobnk.c` | Both utilities |

The `*_nobnk` variants implement charsets inline instead of delegating to `bnk_redef_charset`, and omit `bnk_exit()`. Minor divergences in the VDC mode table (extmem flags) exist and must be kept in sync manually when modes change.

---

## 12. Build System Overview

See the `Makefile` for full details. Key targets:

| Target | Action |
|---|---|
| `make` / `make all` | Build all PRGs + disk images + README.pdf + ZIP |
| `make vdcse.prg` | Build main editor only |
| `make d64` / `d71` / `d81` | Build disk images |
| `make deploy` | FTP upload to Ultimate II+ (requires `.env`) |
| `make vice` | Launch VICE x128 with the D81 image |
| `make test` | Run automated Python test suite via VICE |
| `make test-build` | Build with `-g -dTESTMODE` (VICE labels + breakpoints) |
| `make clean` | Remove build artifacts |

Compiler: `oscar64` at `/home/xahmol/oscar64/bin/oscar64`. Target: `c128e`. Key flags: `-O2 -dNOFLOAT -dHEAPCHECK`.

Deployment IP addresses are in `.env` (not committed): `ULTIP1` and optionally `ULTIP2`.
