FONTDIR=/usr/share/fonts/X11/misc

fonts: kakwafont-12-b.pcf.gz kakwafont-12-n.pcf.gz


%.pcf.gz: %.bdf
	bdftopcf $^ | gzip > $@

install: fonts
	mkdir -p $(DESTDIR)/$(FONTDIR)/
	install -m644 *.pcf.gz $(DESTDIR)/$(FONTDIR)/
	
