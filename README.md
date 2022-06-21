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

## Customizing
Adw-gtk3 supports some customization with named colors. See: [customizing.md](https://github.com/lassekongo83/adw-gtk3/blob/main/customizing.md) for more info.

### GTK-4
If you want to style GTK-4 apps with libadwaita see: [gtk4.md](https://github.com/lassekongo83/adw-gtk3/blob/main/gtk4.md)

## How to uninstall the theme(s)
To be safe from any crashes or weirdness, change the theme to another one before running the command(s) below.

- For a global install: `sudo rm -r /usr/share/themes/adw-gtk3*`
- For a local install: `rm -r ~/.local/share/themes/adw-gtk3*`

Flatpak: `flatpak uninstall org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
