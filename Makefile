SYSCONFDIR ?= /etc
PREFIX ?= /usr/

ifeq ($(INSTALL_USER),true)
OPENTYPE_DIR = $(HOME)/.fonts
X11_DIR = $(HOME)/.fonts
FONTS_CONF_DIR = $(HOME)/.fonts.conf.d
INDEX ?= index rehash
else
OPENTYPE_DIR = $(PREFIX)/share/fonts/opentype/kakwafont/
X11_DIR = $(PREFIX)/share/fonts/X11/misc/
FONTS_CONF_DIR = $(SYSCONFDIR)/fonts/conf.d
endif

default: all-fonts

# Convert BDF to PCF
%.pcf: %.bdf
	@echo "Generating $@"
	bdftopcf $^ > $@

%.pcf.gz: %.pcf
	@echo "Generating $@"
	cat $^ | gzip > $@

# Convert PCF to OTB (OpenType Bitmap)
%.otb: %.bdf
	@echo "Generating $@"
	fontforge -lang=ff -c 'Open("$^"); Import("$^"); Generate("$@"); Close ();'

otb: kakwafont-12-n.otb kakwafont-12-b.otb

pcf.gz: kakwafont-12-n.pcf.gz kakwafont-12-b.pcf.gz

pcf: kakwafont-12-n.pcf kakwafont-12-b.pcf

clean:
	rm -f *.otb *.pcf.gz *.pcf

# Build all font formats
all-fonts: otb pcf pcf.gz

index: install-fonts install-conf
	mkfontdir $(DESTDIR)$(X11_DIR)/

rehash: install-fonts install-conf
	-xset fp rehash
	-fc-cache -fr

noindex:

install-fonts: all-fonts
	mkdir -p $(DESTDIR)$(OPENTYPE_DIR)/
	install -m644 *.otb $(DESTDIR)$(OPENTYPE_DIR)/
	mkdir -p $(DESTDIR)$(X11_DIR)/
	install -m644 *.pcf.gz $(DESTDIR)$(X11_DIR)/

install-conf:
	mkdir -p $(DESTDIR)$(FONTS_CONF_DIR)/
	install -m644 fc-conf/71-enable-kakwafont.conf $(DESTDIR)$(FONTS_CONF_DIR)/

install: install-fonts install-conf $(INDEX)

.PHONY: all all-fonts install install-fonts install-conf index noindex rehash clean default otb pcf pcf.gz
