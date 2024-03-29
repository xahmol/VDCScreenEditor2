
# Target
SYS = c128e

# Just the usual way to find out if we're
# using cmd.exe to execute make rules.
ifneq ($(shell echo),)
  CMD_EXE = 1
endif

ifdef CMD_EXE
  NULLDEV = nul:
  DEL = -del /f
  RMDIR = rmdir /s /q
else
  NULLDEV = /dev/null
  DEL = $(RM)
  RMDIR = $(RM) -r
endif

# Tooling paths
CC = /home/xahmol/oscar64/bin/oscar64

# Application names
MAIN = vdcse

# Build versioning
VERSION_MAJOR = 2
VERSION_MINOR = 0
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR)$(VERSION_MINOR)-$(VERSION_TIMESTAMP)

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -O2 -dNOFLOAT -dHEAPCHECK -dVERSION="\"$(VERSION)\""

# Sources
MAINSRC = src/main.c

# Files to add to disk
OVERLAYS = -write vdcselmc.prg vdcselmc -write vdcseovl1.prg vdcseovl1 -write vdcseovl2.prg vdcseovl2 -write vdcseovl3.prg vdcseovl3 -write vdcseovl4.prg vdcseovl4 -write vdcseovl5.prg vdcseovl5
ASSETS = -write vdcsefalt.prg vdcsefalt -write vdcsefstd.prg vdcsefstd -write vdcsepetv.prg vdcsepetv
SCREENS = -write vdcsetscr.prg vdcsetscr -write vdcsehsc1.prg vdcsehsc1 -write vdcsehsc2.prg vdcsehsc2 -write vdcsehsc3.prg vdcsehsc3 -write vdcsehsc4.prg vdcsehsc4
SAMPLES = -write loveisdrug.proj.prg loveisdrug.proj -write loveisdrug.scrn.prg loveisdrug.scrn -write bcc2024.proj.prg bcc2024.proj -write bcc2024.scrn.prg bcc2024.scrn -write fjaeld24.proj.prg fjaeld24.proj -write fjaeld24.scrn.prg fjaeld24.scrn -write loveisthedrugraw.prg loveisthedrugraw -write fullackraw.prg fullackraw -write moneyislandraw.prg moneyislandraw -write morbosezraw.prg morbosezraw -write arcadevenusraw.prg arcadevenusraw -write drakardemonerraw.prg drakardemonerraw -write greatescaperaw.prg greatescaperaw -write aquamanraw.prg aquamanraw -write umlautraw.prg umlautraw 

# Hostname of Ultimate II+ target for deployment. Edit for proper IP and usb number
ULTHOST = ftp://192.168.1.19/usb1/temp/
ULTHOST2 = ftp://192.168.1.31/usb1/temp/

# ZIP file contents
ZIP = vdcse_$(VERSION).zip
README = README.pdf
ZIPLIST = build/*.* $(README)

########################################

.SUFFIXES:
.PHONY: all clean deploy vice
all: $(MAIN).prg bootsect.bin d64 d71 d81 $(ZIP)

$(MAIN).prg: $(MAINSRC)
	$(CC) $(CFLAGS) -n -o=build/$(MAIN).prg $<
#	$(CC) $(CFLAGS) -n -o=build/diskdir.prg src/diskdir.c

bootsect.bin: $(MAIN).prg
	$(CC) -tf=bin -rt=src/bootsect.c -o=build/bootsect.bin
	cp assets/vdcse*.prg build/
	cp samples/*.prg build/

d64:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d64 $(MAIN).d64
	c1541 -cd build/ -attach $(MAIN).d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d64 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d64 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d64 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d64 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d64 $(SAMPLES)
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.prg vdcse2prg
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.ass.prg vdcse2prg.ass
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.mac.prg vdcse2prg.mac

d71:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d71 $(MAIN).d71
	c1541 -cd build/ -attach $(MAIN).d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d71 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d71 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d71 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d71 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d71 $(SAMPLES)
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.prg vdcse2prg
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.ass.prg vdcse2prg.ass
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.mac.prg vdcse2prg.mac

d81:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d81 $(MAIN).d81
	c1541 -cd build/ -attach $(MAIN).d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/ -attach $(MAIN).d81 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d81 $(OVERLAYS)
	c1541 -cd build/ -attach $(MAIN).d81 $(ASSETS)
	c1541 -cd build/ -attach $(MAIN).d81 $(SCREENS)
	c1541 -cd build/ -attach $(MAIN).d81 $(SAMPLES)
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcse2prg.prg vdcse2prg
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcse2prg.ass.prg vdcse2prg.ass
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcse2prg.mac.prg vdcse2prg.mac


# Creating ZIP file for distribution
$(ZIP):
	zip -j $(ZIP) build/*.d* $(README)

# Cleaning repo of build files
clean:
	$(DEL) build/*.* 2>$(NULLDEV)

# To deploy software to UII+ enter make deploy. Obviously C128 needs to powered on with UII+ and USB drive connected.
deploy:
	wput -u build/*.prg build/$(MAIN).d* $(ULTHOST)
#	wput -u build/$(MAIN).d64 $(ULTHOST2)

# To run software using VICE x128
vice:
	x128 build/$(MAIN).d81