meson.add_install_script('install-dark-theme.sh', theme_dir, meson.project_name())

gtk3_dark_dir = join_paths(theme_dir, 'gtk-3.0')

# Install asset files to themes/ThemeName/gtk-3.0/assets
install_subdir('../../adw-gtk3/gtk-3.0/assets', install_dir : gtk3_dark_dir, strip_directory : false)
