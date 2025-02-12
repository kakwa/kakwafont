# KakwaFont

Another 12 pixel monospaced bitmap font.

## Presentation

KakwaFont is a 12 pixel monospaced bitmap font based on [Terminus](http://terminus-font.sourceforge.net/).

I found Terminus too wide, so I have changed most glyphs in order to have thin and clearly seperated characters.

I tried to make a clear difference between "(" and "{", "1" and "l", "0" and "O"...

The result is a clear font, well suited for programming and terminal.

## Examples

Ascii Table: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-1.png)

Test: 

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-2.png)

Screenshot:

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/screenshot.png)

Code example:

![Example](https://cdn.rawgit.com/kakwa/kakwafont/master/misc/ex-3.png)

## License

KakwaFont is licensed under the SIL Open Font License, Version 1.1. 

The license is available with a FAQ at [scripts.sil.org](http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).

## Download

The latest version of KakwaFont can be downloaded here:

* [KakwaFont latest](https://github.com/kakwa/kakwafont/archive/master.tar.gz)

Previous versions can be found here:

* [KakwaFont releases](https://github.com/kakwa/kakwafont/releases)

# Generate font files & Installation

## Prerequisites

### MacOS

```sh
brew install fontforge font-util
```

### Debian/Ubuntu

```sh
sudo apt install fontforge xfonts-utils
```

## Targets

### Build Targets

- `all-fonts` - Generate all formats `PCF.GZ`, `PCF`, and `OTB` formats (default).
- `pcf` - Generate `PCF`
- `pcf.gz` - Generate `PCF.GZ`
- `otb` - Generate OpenType Bitmap (`OTB`).

### Utility Targets

- `clean` - Removes generated font files.

## Installation

### Installation Targets

- `index` - Creates an X11 font index in the font directory.
- `rehash` - Refreshes the X11 and fontconfig font cache.
- `install-fonts` - Install only the fonts
- `install-conf` - Install only the fc configuration

### User Installation (Non-root)

As User:
```sh
make install INSTALL_USER=true -j
```

This installs fonts to `~/.fonts/` and the config to `~/.fonts.conf.d/`.
It also refresh `fc-cache` and X11 font cache.

### System-wide Installation

As Root:
```sh
make install -j
```

This installs fonts to:
* `otb` - `/usr/share/fonts/opentype/kakwafont/`
* `pcf.gz` - `/usr/share/fonts/X11/misc/`

And the config to `/etc/fonts/conf.d/`.

To tweak this install, use the usual variables (`PREFIX`, `SYSCONFDIR`, `DESTDIR`) or manually copy the fonts in the appropriate directories of your system.

## Fontconfig & X11/Xwayland indexation

You can test the availability of the font with the following commands:

X11:
```sh
# Check font path:
xset q

# Optionally add your ~/.fonts to X font path
xset +fp ~/.fonts/

# Check presence in X11
xlsfonts | grep kakwa
```

Fontconfig:
```sh
# Check fontconfig font path:
fc-cache -v | grep -v '^/'

# Check Presence in Wayland/fontconfig
fc-list | grep kakwa
```

# Trying KakwaFont

Here is a quick way to try KakwaFont:

```sh
# Xterm
xterm -bg black -fg white -fn -kakwa-kakwafont-Medium-R-Normal--12-120-72-72-C-60-ISO8859-1 -fb -kakwa-kakwafont-Medium-R-Bold--12-120-72-72-C-60-ISO8859-1

# Foot
foot --font kakwafont:size=10
```
