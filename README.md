<div align="center">
  
# adw-gtk3
An unofficial GTK3 port of [libadwaita](https://gnome.pages.gitlab.gnome.org/libadwaita/).

<sup>*This port does not claim to be a 100% look-a-like of libadwaita. There are some limitations to what GTK3 can do.*</sup>

</div>

<p align="center">
  <a href="#how-to-use">How To Use</a> •
  <a href="#customization">Customization</a> •
  <a href="#related-projects">Related Projects</a> •
  <a href="#credits">Credits</a>
</p>

<div align="center">

| Light theme | Dark theme |
|:-----------:|:----------:|
| ![adw-gtk3-light](images/preview-light.png?raw=true) | ![adw-gtk3-dark](images/preview-dark.png?raw=true) |

<sup>*Wallpapers: [here](https://i.imgur.com/kU8D1nV.png) and [here](https://old.reddit.com/r/wallpaper/comments/1f8hlcr/wavy_mountain_3840x2160/)*</sup>

</div>

<div align="center">
  
## How to Use

</div>

<div align="center">

| Tarball | Repository | Flatpak | Source | Snap/Ubuntu |
|:---:|:---:|:---:|:---:|:---:|
| 📦 [Download](https://github.com/lassekongo83/adw-gtk3/releases/latest)  | ⬇️ [See info below](#repositories) | 📦 [See info below](#flatpak) | 🔧 [More information](src/README.md) | 📦 [See info below](#snap)

If you download the tarball, then extract the content of the file to: `~/.local/share/themes/`

</div>

### Repositories
On some distributions you can install the theme with the package manager.

<div align="center">

| Distribution | Command/Info |
|:--|:--|
| Fedora |`dnf install adw-gtk3-theme` |
| Arch | `pacman -S adw-gtk-theme` |
| Manjaro | `pamac install adw-gtk3` |
| Debian | [3rd party repo](https://gitlab.com/julianfairfax/package-repo#how-to-add-repository-for-debian-based-linux-distributions) |

<sub>These are maintained by [contributors](#credits).</sub>

</div>

### Flatpak
Flatpak applications will not be styled unless you choose **one** of the installation options below.

* Install themes from Flathub:
    * Does not work with non-libadwaita GTK4 apps.

```bash
flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
```

* Use flatpak override:
    * Works with non-libadwaita GTK4 apps if the theme is installed in `~/.local/share/themes`

```bash
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3-dark
```

### Snap

Snap apps only use themes that are provided by a theme Snap.
* You can install the Snap version via the Snap Store or using this command:
```bash
sudo snap install gtk-theme-adw-gtk3
```

The official version of adw-gtk3 can be viewed by clicking the button below.

<a href="https://snapcraft.io/gtk-theme-adw-gtk3">
    <img alt="Get it from the Snap Store" src=https://snapcraft.io/en/dark/install.svg />
  </a>


#### How to activate the theme

1. Install `gnome-tweaks` and set the theme under *Appearance > Legacy Applications*. For dark themes, adjust in `gnome-control-center` > *Appearance*.
2. Optional: You can also use `gsettings` to switch themes:

Light theme:
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'
```
Dark theme:
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```
Revert to default:
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' && gsettings set org.gnome.desktop.interface color-scheme 'default'
```

<div align="center">

## Customization
Adw-gtk3 and libadwaita can be customized with GTK named colors. See [adw-colors](https://github.com/lassekongo83/adw-colors) for more info.

<sub>If you want to change the accent color for most applications in GNOME 47 or later, you can use a small CLI program [accent-color-changer](https://github.com/lassekongo83/adw-colors/tree/main/scripts/accent-color-change).</sub>

![adw-gtk3-customized](images/preview-customized.png?raw=true)

<sup>*Wallpaper: [here](https://i.imgur.com/ZbyNlmh.png)* | *Customization: [Peninsula-dark](https://github.com/lassekongo83/adw-colors/tree/main/themes/Peninsula-dark)*</sup>

</div>

<div align="center">

## Related Projects

</div>

<div align="center">

| Software | URL |
|:---|:---|
| GTK2 | https://github.com/eylles/adw-gtk2-colorizer |
| Gimp 3 | https://github.com/dp0sk/adw-gimp3 |
| Kvantum | https://github.com/GabePoel/KvLibadwaita |
| Firefox | https://github.com/rafaelmardojai/firefox-gnome-theme |
| Thunderbird | https://github.com/rafaelmardojai/thunderbird-gnome-theme |
| Steam | https://github.com/tkashkin/Adwaita-for-Steam |
| VSCode | https://github.com/piousdeer/vscode-adwaita |
| Discord | https://github.com/ricewind012/discord-gnome-theme |
| Obsidian | https://github.com/birneee/obsidian-adwaita-theme |
| xfwm4 | https://github.com/FabianOvrWrt/adw-xfwm4 |

</div>

<div align="center">

## Credits

</div>

Special thanks to:

* [@Pryka](https://github.com/Pryka) (Flatpak)
* [@solopasha](https://github.com/solopasha) (Fedora)
* [@dusansimic](https://github.com/dusansimic) (AUR)
* [@julianfairfax](https://github.com/julianfairfax)
