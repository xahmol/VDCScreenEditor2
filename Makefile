
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
VERSION_MAJOR = 1
VERSION_MINOR = 1
VERSION_TIMESTAMP = $(shell date "+%Y%m%d-%H%M")
VERSION = v$(VERSION_MAJOR)$(VERSION_MINOR)-$(VERSION_TIMESTAMP)

# Common compile flags
CFLAGS  = -i=include -tm=$(SYS) -O2 -dNOFLOAT -dVERSION="\"$(VERSION)\""

# Sources
MAINSRC = src/main.c

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

bootsect.bin: $(MAIN).prg
	$(CC) -tf=bin -rt=src/bootsect.c -o=build/bootsect.bin
	cp assets/vdcse*.prg build/

d64:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d64 $(MAIN).d64
	c1541 -cd build/ -attach $(MAIN).d64 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d64 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d64 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcselmc.prg vdcsemlc
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcseovl1.prg vdcseovl1
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcseovl2.prg vdcseovl2
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcseovl3.prg vdcseovl3
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcseovl4.prg vdcseovl4
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsefalt.prg vdcsefalt
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsefstd.prg vdcsefstd
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsetscr.prg vdcsetscr
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsehsc1.prg vdcsehsc1
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsehsc2.prg vdcsehsc2
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsehsc3.prg vdcsehsc3
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsehsc4.prg vdcsehsc4
	c1541 -cd build/ -attach $(MAIN).d64 -write vdcsepetv.prg vdcsepetv
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.prg vdcse2prg
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.ass.prg vdcse2prg.ass
#	c1541 -cd build/ -attach $(MAIN).d64 -write vdcse2prg.mac.prg vdcse2prg.mac

d71:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d71 $(MAIN).d71
	c1541 -cd build/ -attach $(MAIN).d71 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d71 -bpoke 18 0 4 $14 %11111110
	c1541 -cd build/ -attach $(MAIN).d71 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcselmc.prg vdcsemlc
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcseovl1.prg vdcseovl1
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcseovl2.prg vdcseovl2
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcseovl3.prg vdcseovl3
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcseovl4.prg vdcseovl4
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsefalt.prg vdcsefalt
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsefstd.prg vdcsefstd
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsetscr.prg vdcsetscr
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsehsc1.prg vdcsehsc1
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsehsc2.prg vdcsehsc2
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsehsc3.prg vdcsehsc3
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsehsc4.prg vdcsehsc4
	c1541 -cd build/ -attach $(MAIN).d71 -write vdcsepetv.prg vdcsepetv
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.prg vdcse2prg
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.ass.prg vdcse2prg.ass
#	c1541 -cd build/ -attach $(MAIN).d71 -write vdcse2prg.mac.prg vdcse2prg.mac

d81:	bootsect.bin
	c1541 -cd build/ -format "vdcse,xm" d81 $(MAIN).d81
	c1541 -cd build/ -attach $(MAIN).d81 -bwrite bootsect.bin 1 0
	c1541 -cd build/ -attach $(MAIN).d81 -bpoke 40 1 16 $27 %11111110
	c1541 -cd build/ -attach $(MAIN).d81 -bam 1 1
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcse.prg vdcse
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcselmc.prg vdcsemlc
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcseovl1.prg vdcseovl1
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcseovl2.prg vdcseovl2
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcseovl3.prg vdcseovl3
#	c1541 -cd build/ -attach $(MAIN).d81 -write vdcseovl4.prg vdcseovl4
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsefalt.prg vdcsefalt
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsefstd.prg vdcsefstd
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsetscr.prg vdcsetscr
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsehsc1.prg vdcsehsc1
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsehsc2.prg vdcsehsc2
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsehsc3.prg vdcsehsc3
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsehsc4.prg vdcsehsc4
	c1541 -cd build/ -attach $(MAIN).d81 -write vdcsepetv.prg vdcsepetv
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
deploy: $(MAIN).d64 $(MAIN).d71 $(MAIN).d81
	wput -u build/*.prg build/$(MAIN).d* $(ULTHOST)
#	wput -u build/$(MAIN).d64 $(ULTHOST2)

# To run software using VICE x128
vice: $(MAIN).d64 $(MAIN).d71 $(MAIN).d81
	x128 build/$(MAIN).d81