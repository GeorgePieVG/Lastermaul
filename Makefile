# SPDX-License-Identifier: BSD-3-Clause

# Lastermaul build script

VERSION=$(shell git describe --abbrev=8 --dirty 2>/dev/null || echo unknown)
WADS=wads
SNDCURVE=scripts/blasphemer_sndcurve.py
CPP=scripts/simplecpp
DEUTEX=deutex
DEUTEX_BASIC_ARGS=-v0 -rate accept
DEUTEX_ARGS=$(DEUTEX_BASIC_ARGS) -hexen bootstrap/

LASTERMAUL=$(WADS)/lastermaul.wad

OBJS=$(LASTERMAUL)

all: deutex-check $(OBJS)

subdirs:
	# $(MAKE) VERSION=$(VERSION) -C lumps/text
	$(MAKE) -C lumps/genmidi
	$(MAKE) -C lumps/dmxgus
	$(MAKE) -C lumps/textures

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
# lastermaul (1.1) iwad

wadinfo_lastermaul.txt: buildcfg.txt subdirs lumps/lstrmaul.lmp
	$(CPP) -P -DLASTERMAUL < $< > $@

$(LASTERMAUL): wadinfo_lastermaul.txt subdirs
	@mkdir -p $(WADS)
	$(RM) $@
	$(DEUTEX) $(DEUTEX_ARGS) -iwad -build wadinfo_lastermaul.txt $@

clean: 
	rm $(LASTERMAUL)
	rmdir $(WADS)
	rm wadinfo_lastermaul.txt
	
	# $(MAKE) -C lumps/text clean
	$(MAKE) -C lumps/genmidi clean
	$(MAKE) -C lumps/dmxgus clean
	$(MAKE) -C lumps/textures clean

prefix?=/usr/local
docdir?=/share/doc
mandir?=/share/man
waddir?=/share/games/doom
target=$(DESTDIR)$(prefix)

install:
	install -Dm 644 $(LASTERMAUL) -t "$(target)$(waddir)"

uninstall:
	rm "$(target)$(waddir)/lastermaul.wad"
