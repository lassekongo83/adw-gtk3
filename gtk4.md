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
