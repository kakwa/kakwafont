FONTDIR=/usr/share/fonts/X11/misc

ifeq ($(INDEX),true)
RULE_INDEX=index
else
RULE_INDEX=noindex
endif

fonts: kakwafont-12-b.pcf.gz kakwafont-12-n.pcf.gz


%.pcf.gz: %.bdf
	bdftopcf $^ | gzip > $@

index:
	mkfontdir $(DESTDIR)/$(FONTDIR)/
	-xset fp rehash

noindex:

install-fonts: fonts
	mkdir -p $(DESTDIR)/$(FONTDIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(FONTDIR)/

install: install-fonts $(RULE_INDEX)

