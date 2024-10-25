## Build and install the themes from source

### Requirements
* GTK `>=3.24`
* Debian/Ubuntu/Mint/PopOS - `apt install ninja-build git meson sassc`
* Fedora - `dnf install ninja-build git meson sassc`
* Arch/Manjaro/EndeavourOS - `pacman -S ninja git meson sassc`
* OpenSuse - `zypper in ninja git meson sassc`

Other distros may have named the above packages differently.

When the above requirements are installed, simply run these commands:
```bash
git clone https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson setup -Dprefix="${HOME}/.local" build
ninja -C build install
```

If you want to install the theme for all users. Remove `-Dprefix="${HOME}/.local"` and install with `sudo ninja -C build install`.

### Updating the theme from git
Navigate to the `adw-gtk3` folder that was originally cloned. (If you removed it, do the steps above instead).

Then run:
```bash
git pull
ninja -C build install
```

## More granular changes

SCSS is the actual "source code" of the theme. This is compiled into the CSS files. Edit the SCSS if you want to contribute your changes back here. SCSS is simple enough to get the hang of if you already know CSS. After making your edits in the SCSS files, you can run `ninja install` in the `adw-gtk3/build` folder. That’ll do all the compiling and installing.

The files named `assets.svg` and `assets.txt` contains the image assets used in the theme. If you change anything in `assets.svg` you'll have to make sure that the Object ID in inkscape is kept intact. Any new Object ID created must be added to `assets.txt`. Remove any old images from the assets folder and then run `render-assets.sh` to generate the new images.
