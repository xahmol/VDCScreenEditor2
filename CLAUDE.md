# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

VDC Screen Editor 2 is a screen editor for the Commodore 128 80-column VDC mode, written in C using the Oscar64 cross-compiler targeting the `c128e` system. It produces `.prg` files and bootable disk images (`.d64`, `.d71`, `.d81`) for real C128 hardware or the VICE emulator.

## Oscar64 Compiler

**This is an Oscar64 project.** Follow all Oscar64 rules from the global `~/.claude/CLAUDE.md`. Use `oscar64manual.md` in this directory as the primary reference for compiler flags, pragmas, language extensions, library APIs, and gotchas.

Key Oscar64 facts relevant to this project:
- Target system: `c128e` (Commodore 128, 80-column mode)
- `#pragma compile("file.c")` in a header is how Oscar64 pulls in a `.c` file — this is used for all library modules and overlays
- `#pragma region(name, start, end, ...)` defines a memory region for code/data placement
- `__noinline` is required on banking functions called across overlay boundaries
- `volatile` is required for hardware-mapped register pointers

## Build Commands

```bash
# Full build: all programs + bootable disk images + ZIP
make

# Build individual programs only
make vdcse.prg       # Main editor
make vdcse2prg.prg   # PRG generator utility
make vdcse2prgvwc.prg # Viewer utility

# Build disk images
make d64
make d71
make d81

# Clean build artifacts
make clean

# Run in VICE emulator
make vice            # Launches x128 with the D81 disk image

# Deploy to Ultimate II+ cartridge via FTP
make deploy          # Uses ULTHOST = ftp://192.168.1.19/usb1/temp/
```

The compiler is at `/home/xahmol/oscar64/bin/oscar64`. Common flags: `-i=include -tm=c128e -O2 -dNOFLOAT -dHEAPCHECK`.

Disk image manipulation uses `c1541` (VICE tool). Distribution ZIPs are created automatically by `make all`.

## Architecture Reference

Full architecture documentation — memory maps, file formats, overlay system, VDC attribute layout, banking layer API, and global state table — is in **[ARCHITECTURE.md](ARCHITECTURE.md)**. Consult it before making changes to memory layout, file I/O, or screen map handling.

## Architecture Summary

### Three Executables

- **`vdcse`** (`src/main.c`) — The main screen editor. Occupies address `0x1C80`–`0xBFFF` minus overlay space.
- **`vdcse2prg`** (`src/prg_gen.c`) — Standalone PRG generator utility: converts VDCSE project files into standalone display programs.
- **`vdcse2prgvwc`** (`src/view.c`) — Viewer utility for screen files.
- **`bootsect`** (`src/bootsect.c`) — Boot sector binary written to track 1 sector 0 of disk images.

### Overlay System

The main editor (`vdcse`) uses 6 code overlays to work within the C128's memory constraints. Overlays are loaded on demand via `load_overlay()` from `banking.c`. Each overlay is `OVERLAYSIZE` (0x1400 bytes) stored at `OVERLAYLOAD` (0xAC00). Overlay storage banks:

- Bank 0 at `OVERLAYBANK0` (0xC000)
- Bank 1 at `OVERLAYBANK1` (0xD000)

Overlay content by file:
- `overlay1.c` — Write mode, color write, palette, canvas resize
- `overlay2.c` — Visual plot, line/box drawing, move mode, select mode, try mode
- `overlay3.c` — Background color, screen mode selection, PRG/SEQ import/export, screen map load/save
- `overlay4.c` — Project save/load, charset load/save, character editor
- `overlay5.c` — Version info display (and likely other functions)
- `overlay6.c` — Additional functions

Each overlay has a matching `.h` file in `src/` that uses `#pragma compile("overlayN.c")` — Oscar64's mechanism to include the file in the build.

### Memory Banking

The C128 has two 64KB banks. All cross-bank access goes through `banking.c`/`banking.h` (`bnk_readb`, `bnk_writeb`, `bnk_memcpy`, `bnk_memset`, `bnk_load`, `bnk_save`, etc.). Key memory layout (Bank 1):

| Symbol | Address | Purpose |
|---|---|---|
| `WINDOWBASEADDRESS` | 0x2000 | Window system data (8KB) |
| `CHARSETSYSTEM` | 0x4000 | System charset |
| `CHARSETNORMAL` | 0x4800 | Normal charset |
| `CHARSETALTERNATE` | 0x5000 | Alternate charset |
| `SCREENMAPBASE` | 0x5800 | Screen map data |
| `MEMORYLIMIT` | 0xCFFF | Upper limit of usable area |

`bank_minimal.c`/`bank_minimal.h` provides a stripped-down version of the banking layer used by the utilities (`vdcse2prg`, `vdcse2prgvwc`).

### VDC Layer (`vdc_core.c`, `vdc_win.c`, `vdc_menu.c`)

`vdc_core.c` — Low-level VDC (8563) chip access: register reads/writes, block fill/copy, charset management, multiple screen modes (`VDC_TEXT_80x25_PAL`, `80x50_PAL`, `80x70_PAL`, NTSC variants). State held in `struct VDCStatus vdc_state`.

`vdc_win.c` — Windowing system built on top of `vdc_core`: `struct VDCWin` (positioned text window with cursor), `struct VDCViewport` (scrollable view into a bank-1 screen map), popup windows with background save (`vdcwin_win_new`/`vdcwin_win_free`). Max 3 simultaneous windows (`WIN_MAX_NR`).

`vdc_menu.c` — Pulldown menu system built on the window layer.

`vdc_nobnk.c` / `vdcwin_nobnk.c` — Variants of the VDC/window layers without banking, used by the standalone utilities.

### Screen Map Format

The canvas (`struct VDCViewport canvas`) points into Bank 1 starting at `SCREENMAPBASE`. Screen data and attribute data are stored separately: `screenmap_screenaddr()` and `screenmap_attraddr()` in `main.h` compute the correct pointers given row, col, width, and height. Each cell has a screencode byte and an attribute byte (color | blink | underline | reverse | altchar flags).

### Global State (`include/defines.h`, `src/main.c`)

All editor state is in file-scope globals defined in `main.c` and declared `extern` in `defines.h`. Key globals: `screen_col`/`screen_row` (canvas size), `plotscreencode`/`plotcolor`/`plotreverse`/`plotunderline`/`plotblink`/`plotaltchar` (current plot attributes), `canvas` (the viewport), `Undo[41]` (undo stack).

### Include Path

Headers live in `include/`. Overlay `.h` files live in `src/` alongside their `.c` files. VSCode IntelliSense is configured to include `/home/xahmol/oscar64/include/` and `${workspaceFolder}/include`.
