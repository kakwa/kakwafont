# kakwafont

Another 12px monospace bitmap font.

## Presentation

Kakwafont is a 12px monospace bitmap font based on [Terminus](http://fractal.csie.org/~eric/wiki/Terminus_font).

I found Terminus too wide, so I have changed most glyphs in order to have thin and clearly seperated characters.

I tried to make a clear difference between "(" and "{", "1" and "l", "0" and "O"...

The result is a clear font, well suited for programming and terminal.

## Examples

Ascii Table: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/img/screen1.png)

Test: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/img/screen2.png)

Code example: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/img/screen3.png)

## License

kakwafont is licensed under the SIL Open Font License, Version 1.1. The license is available with a FAQ at OFL.

## Download

The latest version of kakwafont can be downloaded here:

* [kakwafont-latest](https://github.com/kakwa/kakwafont/archive/master.tar.gz)

Previous versions can be found here:

* [kakwafont releases](https://github.com/kakwa/kakwafont/releases)

## Install

To install this font, you need *bdftopcf* and *mkfontdir* (provided by the *xfonts-utils* package in Debian/Ubuntu)

```bash
# build the .pcf.gz
$ make

# install
$ make install # DESTDIR=./installroot/ FONTDIR=/usr/share/fonts/X11/misc
```
