<div align="center">

# adw-gtk3
An unofficial GTK3 port of [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/).

<sup>*This port does not claim to be a 100% look-a-like of libadwaita. There are some limitations to what GTK3 can do.*</sup>

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
2. Extract the file to `~/.local/share/themes/` (or `/usr/share/themes` if you want to install it for all users.)

**Note:** Do not extract it to multiple locations. Only use one path.

3. If you use flatpak applications it's recommended to install the flatpak themes. From a terminal run:
```bash
flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
```

You can then enable adw-gtk3 in the application `gnome-tweaks`. (Some applications may require a relog.)

**If you use the dark theme** you'll also need to enable the dark appearance in `gnome-control-center`.

Alternatively you can set the theme with your terminal:
```bash
# Change the theme to adw-gtk3 light
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'
# Change the theme to adw-gtk3-dark
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# Revert to GNOME's default theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' && gsettings set org.gnome.desktop.interface color-scheme 'default'
```

### Other installation options
These are maintained by contributors.

* **Snapcraft:** https://snapcraft.io/adw-gtk3-theme
* **AUR:** https://aur.archlinux.org/packages/adw-gtk3-git/
* **Manjaro**: `pamac install adw-gtk3`
* **Fedora copr:** ([Instructions for Fedora Silverblue](https://github.com/lassekongo83/adw-gtk3/issues/194))
```bash
dnf copr enable nickavem/adw-gtk3
dnf install adw-gtk3
```

Thanks to [@dusansimic](https://github.com/dusansimic) (Flatpak, AUR), [@kuroehanako](https://github.com/kuroehanako) (Snapcraft), [@nickavem](https://github.com/nickavem) (Fedora copr) for the help.

### Installation from source
This will install the latest version from the main branch. Use this installation method if you want to contribute and help testing the theme.

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
- **VSCode:** https://github.com/piousdeer/vscode-adwaita
- **Discord:** https://github.com/GeopJr/DNOME
- **Obsidian:** https://github.com/birneee/obsidian-adwaita-theme
<div align="center">

## How to uninstall the theme(s)

</div>

- For a local installation: `rm -r ~/.local/share/themes/adw-gtk3*`
- For a global installation: `sudo rm -r /usr/share/themes/adw-gtk3*`

Flatpak: `flatpak uninstall org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark`
