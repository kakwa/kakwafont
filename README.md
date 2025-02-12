# KakwaFont

Another 12px monospace bitmap font.

## Presentation

KakwaFont is a 12px monospace bitmap font based on [Terminus](http://terminus-font.sourceforge.net/).

I found Terminus too wide, so I have changed most glyphs in order to have thin and clearly seperated characters.

I tried to make a clear difference between "(" and "{", "1" and "l", "0" and "O"...

The result is a clear font, well suited for programming and terminal.

## Examples

Ascii Table: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-1.png)

Test: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-2.png)

Code example: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-3.png)

Screenshot:

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/screenshot.png)

## License

KakwaFont is licensed under the SIL Open Font License, Version 1.1. 

The license is available with a FAQ at [scripts.sil.org](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).

## Download

The latest version of KakwaFont can be downloaded here:

* [KakwaFont latest](https://github.com/kakwa/kakwafont/archive/master.tar.gz)

Previous versions can be found here:

* [KakwaFont releases](https://github.com/kakwa/kakwafont/releases)

# Generate & Install

## Prerequisites

### macOS
```sh
brew install fontforge font-util
```

### Debian/Ubuntu
```sh
sudo apt install fontforge xfonts-utils
```

## Targets

### Build Targets
- `all-fonts` - Generate all formats `PCF.GZ`, `TTF`, and `OTB` formats.
- `pcf` - Generate `PCF`
- `pcf.gz` - Generate `PCF.GZ`
- `ttf` - Generate TrueType font (`TTF`).
- `otb` - Generate OpenType Bitmap (`OTB`).

### Utility Targets
- `clean` - Removes generated font files.
- `index` - Creates an X11 font index in the font directory.
- `rehash` - Refreshes the X11 font cache.
- `noindex` - No-op target used in conditional rules.

## Installation

### System-wide Installation

As Root:
```sh
make install PREFIX=/usr
```
This installs fonts to `/usr/local/share/fonts/`.

### User Installation (Non-root)

As User:
```sh
make install INSTALL_USER=true
```
This installs fonts to `~/.fonts/`.

## Fontconfig

You can test the availability of the font with the following commands:

```sh
# Check presence in X11
xlsfonts | grep kakwafont
```

```sh
# Check Presence in Wayland/fontconfig
fc-list | grep kakwafont
```

If you encounter issues, install `misc/71-enable-kakwafont.conf` in the appropriate directory (`/etc/fonts/conf.d` on Debian).

And then, rescan the fonts `fc-cache -fvr`.

# Using

# Using

## XTerm

```sh
xterm -bg black -fg white -fn -kakwa-kakwafont-Medium-R-Normal--12-120-72-72-C-60-ISO8859-1 -fb -kakwa-kakwafont-Medium-R-Bold--12-120-72-72-C-60-ISO8859-1
```

## Foot
```sh
foot --font kakwafont:size=10
```
