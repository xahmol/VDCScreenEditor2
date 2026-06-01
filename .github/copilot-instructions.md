# Copilot Instructions

## Build, test, and lint commands

This repository is built with `make` around the Oscar64 toolchain for the Commodore 128 `c128e` target. For compiler-specific questions, use `oscar64manual.md` in the repository as the primary reference for flags, pragmas, language extensions, and library behavior.

| Command | Purpose |
| --- | --- |
| `make` or `make all` | Build all PRGs, boot sector, disk images, `README.pdf`, and the release ZIP. |
| `make vdcse.prg` | Build only the main editor. |
| `make vdcse2prg.prg` | Build only the standalone PRG generator utility. |
| `make vdcse2prgvwc.prg` | Build only the viewer utility. |
| `make d64` / `make d71` / `make d81` | Build a specific bootable disk image. |
| `make docs` | Regenerate `README.pdf` from `README.md` when `pandoc` is installed. |
| `make vice` | Launch VICE `x128` with the built `build/vdcse.d81` image. |
| `make deploy` / `make deploy2` | Upload built artifacts to one or two Ultimate II+ systems configured through `.env`. |
| `make clean` | Remove files under `build/`. |

There is no automated test suite, single-test runner, or lint target in this repository. For narrow verification, build the smallest affected target (`make vdcse.prg`, `make vdcse2prg.prg`, or `make vdcse2prgvwc.prg`).

The Makefile expects Oscar64 at `/home/xahmol/oscar64/bin/oscar64`. Disk image creation uses `c1541` from VICE. Deployment targets read Ultimate II+ settings from a gitignored `.env`.

## Reference priority

When repository work depends on compiler behavior, hardware details, or the shared VDC/window/banking libraries, consult these references in this order:

1. `oscar64manual.md` in the repository root, then `~/.claude/oscar64.md`
2. `~/.claude/c128_reference.md` for C128-specific VDC, MMU, and banking details
3. `vdclib_manual.md` in this repository, then `~/.claude/vdclib_c128.md` for `vdc_core`, `vdc_win`, `vdc_menu`, `banking`, and `bank_minimal`
4. `~/.claude/menu_conventions.md` when changing the menu/window system
5. `~/.claude/makefile_conventions.md` when changing the Makefile or deployment/docs targets
6. `~/.claude/vscode_intellisense.md` when changing `.vscode` C/C++ configuration

If you discover an Oscar64 behavior or VDC library detail that is not documented, update the project copy and the corresponding shared Claude reference so later sessions inherit the correction.

## High-level architecture

The codebase produces three user-facing binaries plus a boot sector:

- `src/main.c` builds `vdcse`, the interactive editor.
- `src/prg_gen.c` builds `vdcse2prg`, which turns VDCSE project files into standalone display programs.
- `src/view.c` builds `vdcse2prgvwc`, the runtime viewer used by generated programs.
- `src/bootsect.c` builds the boot sector written into the disk images.

The editor is split between a fixed core and six overlays because it must fit within C128 memory limits. `src/main.c` owns startup, global state, and the main event loop. Feature code lives in `src/overlay1.c` through `src/overlay6.c`; `loadoverlay()` in `src/main.c` copies the requested overlay into the active overlay window at `OVERLAYLOAD`, while `include/banking.c` loads the low-memory helper overlay (`vdcselmc`) used for banked memory routines.

The shared display stack lives in `include/`:

- `vdc_core.c/.h` provides low-level 8563 VDC access and screen-mode setup.
- `vdc_win.c/.h` provides windows and viewports on top of VDC memory.
- `vdc_menu.c/.h` implements the pulldown menu system used by the editor.
- `vdc_nobnk.c` / `vdcwin_nobnk.c` are the non-banked variants used by the utilities.
- `bank_minimal.c/.h` provides the reduced banking loader used by `vdcse2prg`.

Banked editor data lives in Bank 1 and is coordinated through constants in `include/defines.h`. In particular, the screen map starts at `SCREENMAPBASE`, character and attribute planes are stored separately, and `screenmap_attraddr()` in `src/main.c` places attributes after a 48-byte padding/signature block. The editor’s mutable application state is mostly file-scope globals defined in `src/main.c` and declared `extern` in `include/defines.h`. Shared headers live in `include/`, while overlay headers stay beside their implementations in `src/`.

## Key conventions

- Oscar64 dependency wiring is header-driven here: many headers contain `#pragma compile("file.c")`. When adding or moving a module, keep the header pragma and the relevant `*_SRCS` list in `Makefile` aligned so incremental builds notice source changes.
- Memory placement is explicit. Entry points and helper overlays use `#pragma region(...)`, `#pragma overlay(...)`, and related Oscar64 section pragmas to fit within C128 memory constraints, so changes that grow code or move data need to respect the existing address layout instead of treating it like a flat desktop C program.
- Overlay-aware editor features usually span `src/main.c`, one of the `src/overlay*.c` files, and declarations in `include/main.h` / `include/defines.h`. If a new feature belongs in an overlay, declare it in the matching overlay header and make sure the call site loads that overlay before invoking it.
- Use the banking helpers (`bnk_readb`, `bnk_writeb`, `bnk_memcpy`, `bnk_load`, `bnk_save`, etc.) for cross-bank access instead of open-coding MMU register switching. Keep hardware-mapped pointers `volatile`, and keep cross-overlay banking entry points compatible with Oscar64’s `__noinline` requirement from the existing Claude guidance.
- The main editor and the standalone utilities do not use the same runtime stack: editor code uses `banking.c`, `vdc_core`, `vdc_win`, and `vdc_menu`, while the utilities use `bank_minimal` plus the `*_nobnk` VDC/window variants.
- Screen file layout matters across the editor, importer/exporter, and viewer: text bytes come first, then a 48-byte gap used for the VDCSE signature, then attribute bytes. Any code that changes screen serialization must keep those producers and consumers in sync.
