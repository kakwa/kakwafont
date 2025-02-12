PREFIX ?= /usr/local
PENTYPE_DIR = $(PREFIX)/share/fonts/opentype/kakwa-font/
X11_DIR = $(PREFIX)/share/fonts/X11/misc/
USER_FONT_DIR = $(HOME)/.fonts

ifeq ($(INDEX),true)
RULE_INDEX = index
else
RULE_INDEX = noindex
endif

default: all-fonts

# Convert BDF to PCF.GZ
%.pcf: %.bdf
	@echo "Generating $@"
	bdftopcf $^ > $@

%.pcf.gz: %.pcf
	@echo "Generating $@"
	cat $^ | gzip > $@

# Convert PCF to OTB (OpenType Bitmap)
%.ttf: %.bdf
	@echo "Generating $@"
	fonttosfnt -v -b -c -g 2 -m 2 -o $@ $^

%.otb: %.bdf
	@echo "Generating $@"
	fontforge -lang=ff -c 'Open("$^"); Import("$^"); Generate("$@"); Close ();'

otb: %.otb

ttf: %.ttf

pcf.gz: %.pcf.gz

clean:
	rm -f *.ttf *.otb *.pcf.gz *.pcf

# Build all font formats
all-fonts: kakwafont-12-n.pcf.gz kakwafont-12-n.ttf kakwafont-12-n.otb \
	kakwafont-12-b.pcf.gz kakwafont-12-b.ttf kakwafont-12-b.otb

index:
ifeq ($(INSTALL_USER),true)
	mkfontdir $(USER_FONT_DIR)
else
	mkfontdir $(DESTDIR)/$(X11_DIR)/
endif

rehash:
	xset fp rehash
	fc-cache -fvr

noindex:

install-fonts: all-fonts
ifeq ($(INSTALL_USER),true)
	mkdir -p $(USER_FONT_DIR)
	install -m644 *.ttf $(USER_FONT_DIR)/
	install -m644 *.otb $(USER_FONT_DIR)/
	install -m644 *.pcf.gz $(USER_FONT_DIR)/
else
	mkdir -p $(DESTDIR)/$(PENTYPE_DIR)/
	install -m644 *.ttf $(DESTDIR)/$(PENTYPE_DIR)/
	install -m644 *.otb $(DESTDIR)/$(PENTYPE_DIR)/
	mkdir -p $(DESTDIR)/$(X11_DIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(X11_DIR)/
endif

install: install-fonts $(RULE_INDEX)

.PHONY: all all-fonts install install-fonts index noindex rehash clean default otb ttf pcf.gz
