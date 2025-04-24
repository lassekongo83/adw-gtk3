theme_dir       = join_paths(get_option('datadir'), 'themes', meson.project_name())
theme_dir_dark  = join_paths(get_option('datadir'), 'themes', meson.project_name() + '-dark')
# GTK3
gtk3_dir        = join_paths(theme_dir, 'gtk-3.0')
gtk3_dir_dark   = join_paths(theme_dir_dark, 'gtk-3.0')
# GTK4
gtk4_dir        = join_paths(theme_dir, 'gtk-4.0')
gtk4_dir_dark   = join_paths(theme_dir_dark, 'gtk-4.0')

sass = find_program('sass')

# Files can't have the same names in the build dir, so I need to put the meson junk in 2 dirs
subdir('theme-light')
subdir('theme-dark')
