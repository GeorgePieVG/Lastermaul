# SPDX-License-Identifier: BSD-3-Clause

# Zauberer build script

VERSION=$(shell git describe --abbrev=8 --dirty 2>/dev/null || echo unknown)
WADS=wads
SNDCURVE=scripts/blasphemer_sndcurve.py
CPP=scripts/simplecpp
DEUTEX=deutex
DEUTEX_BASIC_ARGS=-v0 -rate accept
DEUTEX_ARGS=$(DEUTEX_BASIC_ARGS) -hexen bootstrap/

ZAUBERER=$(WADS)/zauberer.wad

OBJS=$(ZAUBERER)

all: deutex-check $(OBJS)

subdirs:
	# $(MAKE) VERSION=$(VERSION) -C graphics/text
	# $(MAKE) -C lumps/textures

#---------------------------------------------------------
# Build checks

# Make sure deutex supports PNG
deutex-check:
	@$(DEUTEX) -h | grep -qw PNG || { \
	echo "$(DEUTEX) does not support PNG. Try building deutex with the PNG"; \
	echo "libraries (libpng and libpng-devel or similar packages) installed."; \
	echo "deutex can be downloaded from https://github.com/Doom-Utils/deutex."; \
	echo "The full path to duetex can be specified by passing"; \
	echo "DEUTEX=/the/path/to/deutex to make when building Blasphemer."; \
	exit 1; }

# Make sure that no PNG files are modified if scripts are to modify them.
pngs-modified-check:
	@{ ! git status -s | grep -q \\.png$ ; }  || { \
	echo "PNG fix targets can not be run if there are modified PNGs." ; \
	exit 1; }

#---------------------------------------------------------
# SNDCURVE lump generation
lumps/sndcurve.lmp: scripts/blasphemer_sndcurve.py
	python scripts/blasphemer_sndcurve.py

#---------------------------------------------------------
# zauberer (1.1) iwad

wadinfo_zauberer.txt: buildcfg.txt subdirs lumps/zauberer.lmp
	$(CPP) -P -DZAUBERER < $< > $@

$(ZAUBERER): wadinfo_zauberer.txt subdirs
	@mkdir -p $(WADS)
	$(RM) $@
	$(DEUTEX) $(DEUTEX_ARGS) -iwad -build wadinfo_zauberer.txt $@

clean: 
	rm $(ZAUBERER)
	rmdir $(WADS)
	rm wadinfo_zauberer.txt

prefix?=/usr/local
docdir?=/share/doc
mandir?=/share/man
waddir?=/share/games/doom
target=$(DESTDIR)$(prefix)

install:
	install -Dm 644 $(ZAUBERER) -t "$(target)$(waddir)"

uninstall:
	rm "$(target)$(waddir)/zauberer.wad"
