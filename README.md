# adw-gtk3
The default theme from [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/) ported to GTK-3

Note that this is not a 100% accurate port.

![adw-gtk3](screenshot.png?raw=true)

## Installation from source

Use this option if you want to contribute, or use the latest version from the main branch.

ArchLinux AUR: https://aur.archlinux.org/packages/adw-gtk3-git/ (Maintained by 3rd party)

### Requirements

- GTK 3.24.13+

Some of these packages may already be installed by default on some distros.

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

### Flatpak

If you want to use this theme in flatpak applications, run these commands:

* Light theme: `flatpak install org.gtk.Gtk3theme.adw-gtk3`
* Dark theme: `flatpak install org.gtk.Gtk3theme.adw-gtk3-dark`

The above commands assumes that you have the flathub respository active. If not: `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo`

Thanks to [https://github.com/dusansimic](dusansimic) for the help.

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

## Changing themes

Use `gnome-tweaks` to change themes.

You can also change your GTK themes using a terminal.
```bash
# Changing the theme to adw-gtk3
gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3

# Reverting the change to the default GNOME theme
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
```

#### Removing the theme(s)

To be safe from any crashes or weirdness, change the theme to another one before running the command below.

Run `sudo rm -r /usr/share/themes/adw-gtk3*`

