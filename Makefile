
# Target
SYS = c128e

# Just the usual way to find out if we're
# using cmd.exe to execute make rules.
ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  NULLDEV = nul:
  DEL     = -del /f
  RMDIR   = rmdir /s /q
  MKDIR   = mkdir
else
  NULLDEV = /dev/null
  DEL     = $(RM)
  RMDIR   = $(RM) -r
  MKDIR   = mkdir -p
endif

# Tooling paths
CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = vdcse
GEN  = vdcse2prg
VIEW = vdcse2prgvwc

# Build versioning
VERSION_MAJOR     = 2
VERSION_MINOR     = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION           = v$(VERSION_MAJOR)$(VERSION_MINOR)-$(VERSION_TIMESTAMP)

# Common compile flags
#   -i=include       : add include/ to header search path
#   -tm=c128e        : target Commodore 128 80-column mode
#   -O2              : optimise
#   -dNOFLOAT        : disable float support (saves space)
#   -dHEAPCHECK      : enable heap checking
#   -dVERSION        : pass version string to source
#   -dVDC_MENU_BORDERS : (optional) enable box-drawing borders on menus
CFLAGS  = -i=include \
          -tm=$(SYS) \
          -O2 \
          -dNOFLOAT \
          -dHEAPCHECK \
          -dVERSION="\"$(VERSION)\""

# Sources
MAINSRC  = src/main.c
GENSRC   = src/prg_gen.c
VIEWSRC  = src/view.c

# All sources reachable via #pragma compile chains from each entry point.
# Listed here so make detects changes in any transitively included file.
MAIN_SRCS = src/main.c \
            src/visualpetscii.c \
            src/overlay1.c src/overlay2.c src/overlay3.c \
            src/overlay4.c src/overlay5.c src/overlay6.c \
            include/vdc_core.c include/vdc_win.c \
            include/vdc_menu.c include/banking.c \
            include/defines.h include/main.h \
            include/vdc_core.h include/vdc_win.h \
            include/vdc_menu.h include/banking.h \
            src/overlay1.h src/overlay2.h src/overlay3.h \
            src/overlay4.h src/overlay5.h src/overlay6.h \
            src/visualpetscii.h

GEN_SRCS  = src/prg_gen.c \
            include/vdc_nobnk.c include/vdcwin_nobnk.c \
            include/bank_minimal.c \
            include/defines.h \
            include/vdc_nobnk.h include/vdcwin_nobnk.h \
            include/bank_minimal.h

VIEW_SRCS = src/view.c \
            include/vdc_nobnk.c include/vdcwin_nobnk.c \
            include/defines.h \
            include/vdc_nobnk.h include/vdcwin_nobnk.h

# Files to add to disk
PROGRAM    = -write $(MAIN).prg $(MAIN) -write $(GEN).prg $(GEN)
OVERLAYS   = -write $(MAIN)lmc.prg $(MAIN)lmc -write $(MAIN)ovl1.prg $(MAIN)ovl1 -write $(MAIN)ovl2.prg $(MAIN)ovl2 -write $(MAIN)ovl3.prg $(MAIN)ovl3 -write $(MAIN)ovl4.prg $(MAIN)ovl4 -write $(MAIN)ovl5.prg $(MAIN)ovl5 -write $(MAIN)ovl6.prg $(MAIN)ovl6 -write $(GEN)lmc.prg $(GEN)lmc
ASSETS     = -write $(MAIN)petv.prg $(MAIN)petv -write $(VIEW).prg $(VIEW)
SCREENS    = -write $(MAIN)tscr.prg $(MAIN)tscr -write $(MAIN)hsc1.prg $(MAIN)hsc1 -write $(MAIN)hsc2.prg $(MAIN)hsc2 -write $(MAIN)hsc3.prg $(MAIN)hsc3 -write $(MAIN)hsc4.prg $(MAIN)hsc4
SAMPLESPROJ = -write loveisdrug.proj.prg loveisdrug.proj -write loveisdrug.scrn.prg loveisdrug.scrn -write bcc2024.proj.prg bcc2024.proj -write bcc2024.scrn.prg bcc2024.scrn -write fjaeld24.proj.prg fjaeld24.proj -write fjaeld24.scrn.prg fjaeld24.scrn -write vf7-v2.proj.prg vf7-v2.proj -write vf7-v2.scrn.prg vf7-v2.scrn
SAMPLESRAW  = -write loveisthedrugraw.prg loveisthedrugraw -write fullackraw.prg fullackraw -write moneyislandraw.prg moneyislandraw -write morbosezraw.prg morbosezraw -write arcadevenusraw.prg arcadevenusraw -write drakardemonerraw.prg drakardemonerraw -write greatescaperaw.prg greatescaperaw -write aquamanraw.prg aquamanraw -write umlautraw.prg umlautraw -write vf7-v2raw.prg vf7-v2raw -write vf7-v2-80x50.seq vf7-v2-80x50,s
SAMPLESOWN  = -write ludo.proj.prg ludo.proj -write ludo.scrn.prg ludo.scrn -write ludo.chrs.prg ludo.chrs -write ludo.chra.prg ludo.chra -write careers.proj.prg careers.proj -write careers.scrn.prg careers.scrn -write careers.chrs.prg careers.chrs -write careers.chra.prg careers.chra -write carmscr.proj.prg carmscr.proj -write carmscr.scrn.prg carmscr.scrn -write carmscr.chrs.prg carmscr.chrs -write carmscr.chra.prg carmscr.chra -write roundfont.proj.prg roundfont.proj -write roundfont.scrn.prg roundfont.scrn -write oscardemo.proj.prg oscardemo.proj -write oscardemo.scrn.prg oscardemo.scrn

# Deployment to Ultimate II+
# Set ULTIP1 (and optionally ULTIP2) in .env — see .env for format
-include .env
ULTIP1  ?= <set_ULTIP1_in_.env>
ULTUSB  ?= usb1
ULTPATH  = /$(ULTUSB)/temp/
ULTFTP1  = ftp://$(ULTIP1)$(ULTPATH)
ifdef ULTIP2
ULTFTP2  = ftp://$(ULTIP2)$(ULTPATH)
endif

# ZIP file for distribution
ZIP    = build/$(MAIN)_$(VERSION).zip
README = README.pdf

########################################

.SUFFIXES:
.PHONY: all clean deploy deploy2 check-deploy check-deploy2 docs vice

all: $(MAIN).prg $(GEN).prg $(VIEW).prg bootsect.bin d64 d71 d81 README.pdf $(ZIP)

$(MAIN).prg: $(MAIN_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).prg $(MAINSRC)

$(GEN).prg: $(GEN_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=build/$(GEN).prg $(GENSRC)

$(VIEW).prg: $(VIEW_SRCS)
	@$(MKDIR) build 2>$(NULLDEV) ; true
	$(CC) $(CFLAGS) -n -o=build/$(VIEW).prg $(VIEWSRC)

bootsect.bin: $(MAIN).prg
	$(CC) -tf=bin -rt=src/bootsect.c -o=build/bootsect.bin
	cp assets/vdcse*.prg build/
	cp samples/*.prg build/
	cp samples/*.seq build/

d64:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d64 $(MAIN).d64
	c1541 -cd build/ -attach $(MAIN).d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d64 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d64 $(PROGRAM)
	c1541 -cd build/ -attach $(MAIN).d64 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d64 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d64 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d64 $(SAMPLESPROJ)

d71:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d71 $(MAIN).d71
	c1541 -cd build/ -attach $(MAIN).d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d71 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d71 $(PROGRAM)
	c1541 -cd build/ -attach $(MAIN).d71 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d71 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d71 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d71 $(SAMPLESPROJ) $(SAMPLESRAW) $(SAMPLESOWN)

d81:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d81 $(MAIN).d81
	c1541 -cd build/ -attach $(MAIN).d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/ -attach $(MAIN).d81 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d81 $(PROGRAM)
	c1541 -cd build/ -attach $(MAIN).d81 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d81 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d81 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d81 $(SAMPLESPROJ) $(SAMPLESRAW) $(SAMPLESOWN)

# Regenerate README.pdf from README.md (requires pandoc).
# Install: sudo apt install pandoc texlive-xetex
docs: README.pdf

README.pdf: README.md pandoc-defaults.yaml
	@if which pandoc >/dev/null 2>&1; then \
		pandoc --defaults=pandoc-defaults.yaml README.md -o README.pdf; \
	else \
		echo "WARNING: pandoc not found -- README.pdf not updated (install: sudo apt install pandoc texlive-xetex)"; \
	fi

# Creating ZIP file for distribution
$(ZIP): d64 d71 d81
	zip -j $(ZIP) build/*.d* $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# Check Ultimate II+ is reachable before deploying
check-deploy:
	@curl -s --connect-timeout 3 $(ULTFTP1)/ >/dev/null 2>&1 || \
		(echo "ERROR: Cannot reach U64 at $(ULTIP1) -- check ULTIP1 in .env" && false)

check-deploy2:
ifndef ULTIP2
	$(error ULTIP2 is not set in .env -- cannot deploy to second machine)
endif
	@curl -s --connect-timeout 3 $(ULTFTP2)/ >/dev/null 2>&1 || \
		(echo "ERROR: Cannot reach U64 at $(ULTIP2) -- check ULTIP2 in .env" && false)

# Deploy to Ultimate II+ via FTP
deploy: check-deploy $(MAIN).prg
	wput -u build/*.prg build/$(MAIN).d* $(ULTFTP1)

deploy2: check-deploy2 $(MAIN).prg
	wput -u build/*.prg build/$(MAIN).d* $(ULTFTP2)

# Run software using VICE x128
vice:
	x128 build/$(MAIN).d81
