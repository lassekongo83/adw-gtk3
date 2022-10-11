<div align="center">

# adw-gtk3
An unofficial GTK3 port of [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/).

<sup>*Keep in mind that this port does not aim to be a 100% look-a-like of libadwaita. There are some limitations to what GTK3 can do.*</sup>

| Light theme | Dark theme |
|:-----------:|:----------:|
| ![adw-gtk3-light](preview-light.png?raw=true) | ![adw-gtk3-dark](preview-dark.png?raw=true) |

<sup>*Wallpapers: [here](https://imgur.com/a/Bcw5L) and [here](https://i.imgur.com/bb6B3tL.jpg)*</sup>

</div>

<div align="center">

## How to install

</div>

### Tarball
1. Go to the [releases](https://github.com/lassekongo83/adw-gtk3/releases) section and download the latest `tar.xz` file.
2. Extract the file to `~/.local/share/themes/` (or `~/.themes/` if you use Fedora Silverblue).

If you need to use applications with admin privileges it's recommended to extract the file to `/usr/share/themes`

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
These are maintained by contributors. It is recommended to install the flatpak versions if you use flatpak applications and the snapcraft version if you use snap applications.

* **Flatpak:** `flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
* **Snapcraft:** https://snapcraft.io/adw-gtk3-theme
* **AUR:** https://aur.archlinux.org/packages/adw-gtk3-git/
* **Manjaro**: `pamac install adw-gtk3`
* **Fedora copr:**
```bash
dnf copr enable nickavem/adw-gtk3
dnf install adw-gtk3
```

Thanks to [@dusansimic](https://github.com/dusansimic) (Flatpak, AUR), [@kuroehanako](https://github.com/kuroehanako) (Snapcraft), [@nickavem](https://github.com/nickavem) (Fedora copr) for the help.

### Installation from source
This will install the latest version from the main branch. Use this install method if you want to contribute and help testing the theme.

See [CONTRIBUTING.md](https://github.com/lassekongo83/adw-gtk3/blob/main/CONTRIBUTING.md) for the instructions.

<div align="center">

## Customizing

![adw-gtk3-customized](preview-customized.png?raw=true)

<sup>*Wallpaper: [here](https://i.imgur.com/ZbyNlmh.png) | Customization: [Peninsula-dark](https://github.com/lassekongo83/adw-colors/blob/main/themes/Peninsula-dark/gtk.css)*</sup>

</div>

Adw-gtk3 and libadwaita can be customized with GTK named colors. See [adw-colors](https://github.com/lassekongo83/adw-colors) for more info. You can also use the application [Gradience](https://github.com/GradienceTeam/Gradience) to easily change colors.

<div align="center">

## For more consistency

</div>

- **GTK4:** [Info on how to extract libadwaita from source.](https://github.com/lassekongo83/adw-gtk3/blob/main/gtk4.md)
- **Kvantum:** https://github.com/GabePoel/KvLibadwaita
- **Firefox:** https://github.com/rafaelmardojai/firefox-gnome-theme
- **Steam:** https://github.com/tkashkin/Adwaita-for-Steam
<div align="center">

## How to uninstall the theme(s)

</div>

To be safe from any crashes or weirdness, change the theme to another one before running the command(s) below.

- For a global install: `sudo rm -r /usr/share/themes/adw-gtk3*`
- For a local install: `rm -r ~/.local/share/themes/adw-gtk3*`

Flatpak: `flatpak uninstall org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
