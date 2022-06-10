# adw-gtk3
The default theme from [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/) ported to GTK-3.

Note that this is not a 100% accurate port.

![adw-gtk3](screenshot.png?raw=true)

## How to install

### Tarball
Go to the [releases](https://github.com/lassekongo83/adw-gtk3/releases) section and download the latest `tar.xz` file.

* Install for the current user only: Extract the file to `~/.local/share/themes/`
* Install for all users: Extract the file to `/usr/share/themes/`

You can then enable adw-gtk3 in the application `gnome-tweaks`.

**If you use the dark theme** you'll also need to enable the dark appearance in `gnome-control-center`.

Alternatively you can set the theme in the terminal:
```bash
# adw-gtk3 light
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'
# adw-gtk3 dark
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# Revert to GNOME's default theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' && gsettings set org.gnome.desktop.interface color-scheme 'default'
```

### Other install options
These packages are maintained by contributors. It is recommended to install the flatpak versions if you use flatpak applications and the snapcraft version if you use snap applications.

* **Flatpak:** `flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
* **Snapcraft:** https://snapcraft.io/adw-gtk3-theme
* **AUR:** https://aur.archlinux.org/packages/adw-gtk3-git/
* **Fedora copr:**
```bash
dnf copr enable nickavem/adw-gtk3
dnf install adw-gtk3
```

Thanks to [@dusansimic](https://github.com/dusansimic) (Flatpak, AUR), [@kuroehanako](https://github.com/kuroehanako) (Snapcraft), [@nickavem](https://github.com/nickavem) (Fedora copr) for the help.

### Installation from source
This will install the latest version from the main branch. Use this install method if you want to contribute.

See [CONTRIBUTING.md](https://github.com/lassekongo83/adw-gtk3/blob/main/CONTRIBUTING.md) for the instructions.

### GTK-4
This theme is a GTK-3 theme. Some apps use GTK-4 but not libadwaita. If you want these apps to use the libadwaita theme you'll have to extract it from source. On Fedora 36+ this can be done with the following:

```bash
sudo dnf install git vala gobject-introspection-devel sassc meson gtk4-devel cmake ninja-build
git clone https://gitlab.gnome.org/GNOME/libadwaita.git
cd libadwaita
meson . _build
ninja -C _build
```

1. Copy all the CSS files in `_build/src/stylesheet/` to `~/.local/share/themes/adw-gtk3/gtk-4.0` (or `adw-gtk3-dark/gtk-4.0`).
2. Rename `base.css` to `gtk.css`.
3. Open `gtk.css` in a text editor and at the top add the line: `@import 'defaults-light.css';` (or `@import 'defaults-dark.css';` depending on your color theme preference). Save and exit.

If the non-libadwaita GTK-4 app is a flatpak application you must set permissions: `flatpak override --filesystem=~/.local/share/themes`

ArchLinux users can use this AUR: https://aur.archlinux.org/packages/adw-gtk-theme which will install both adw-gtk3 and the libadwaita GTK-4 theme.

Note that the GTK-4 theme is NOT supported in adw-gtk3's issue tracker.

## How to uninstall the theme(s)
To be safe from any crashes or weirdness, change the theme to another one before running the command(s) below.

- For a global install: `sudo rm -r /usr/share/themes/adw-gtk3*`
- For a local install: `rm -r ~/.local/share/themes/adw-gtk3*`

Flatpak: `flatpak uninstall org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
