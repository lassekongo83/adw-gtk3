## How to customize

Adw-gtk3 supports some customization with named colors.

Here's an example on how to change the accent colors.

1. Create or open `~/.config/gtk-3.0/gtk.css`
2. Add:
```css
/* Replace @green_4 with any hex color value, or select a color from _palette.scss */
@define-color accent_color @green_4;
@define-color accent_bg_color @green_4;
```
3. Save the file. This does not change seamlessly, so you'll have to close and re-open any apps.

If you want to use the same colors in libadwaita/GTK-4 simply copy or symlink `~/.config/gtk-3.0/gtk.css` to `~/.config/gtk-4.0/gtk.css` or vice versa.

Flatpak apps may need a permission setting:
```bash
sudo flatpak override --filesystem=xdg-config/gtk-3.0 && sudo flatpak override --filesystem=xdg-config/gtk-4.0
```

### Supported named colors
```
window_bg_color # The main background color
window_fg_color # The main foreground text color
view_bg_color # A secondary background color used in icon views, text fields, etc
view_fg_color # Secondary foreground text color
accent_bg_color # Something colorful!
accent_fg_color # The text over the accent color
accent_color # Can be the same as accent_bg_color, but maybe with a slightly brighter tone
headerbar_bg_color # The headerbar background
headerbar_fg_color # The headerbar foreground text color
```
