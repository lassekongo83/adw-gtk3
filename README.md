# adw-gtk3
The default theme from [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/) ported to GTK-3

Note that this is not a 100% accurate port.

![adw-gtk3](screenshot.png?raw=true)

## Installation from tarball

Go to the [releases](https://github.com/lassekongo83/adw-gtk3/releases) section and download the latest `tar.xz` file.

* For a local install: Unpack the file to `~/.local/share/themes/`
* For a global install: Unpack the file to `/usr/share/themes/`

## Installation from source (Recommended)

This will install the latest version from the main branch.

ArchLinux users can skip the below steps and install it from AUR: https://aur.archlinux.org/packages/adw-gtk3-git/ (Maintained by 3rd party)

### Requirements

- GTK 3.24.13+

* Debian/Ubuntu/Mint/PopOS - `apt install ninja-build git meson sassc`
* Fedora - `dnf install ninja-build git meson sassc`
* Arch/Manjaro - `pacman -S ninja git meson sassc`
* OpenSuse - `zypper in ninja git meson sassc`

Other distros may have named the above packages differently.

When the above requirements are installed, simply run these commands:
```bash
git clone https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson build
sudo ninja -C build install
```
The theme(s) will be installed in: `/usr/share/themes/`

### Local installation

Install the theme(s) locally if you for some reason can't run as a sudo user. Fedora Silverblue users can use this install option.

```bash
git clone https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson -Dprefix="${HOME}/.local" build
ninja -C build install
```

### Updating the theme

Navigate to the `adw-gtk3` folder that was originally cloned. (If you removed it, do the steps above instead).
Then run:

For a global install:
```bash
git pull
sudo ninja -C build install
```

For a local install:
```bash
git pull
ninja -C build install
```

### Flatpak

If you want to use this theme in flatpak applications, run these commands:

* Light theme: `flatpak install org.gtk.Gtk3theme.adw-gtk3`
* Dark theme: `flatpak install org.gtk.Gtk3theme.adw-gtk3-dark`

The above commands assumes that you have the flathub respository active. If not: `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

Thanks to [@dusansimic](https://github.com/dusansimic) for the help.

## How to change themes

Use `gnome-tweaks` to change your GTK3 themes.

You can also change your GTK3 themes using the terminal:
```bash
# Change the theme to adw-gtk3
gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3

# Reverting the change to the default GNOME theme
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
```

#### How to remove the theme(s)

To be safe from any crashes or weirdness, change the theme to another one before running the command below.

For a global install: `sudo rm -r /usr/share/themes/adw-gtk3*`

For a local install: `rm -r ~/.local/share/themes/adw-gtk3*`

