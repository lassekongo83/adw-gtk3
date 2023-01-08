theme_dir = join_paths(get_option('datadir'), 'themes', meson.project_name())

conf_data = configuration_data()
conf_data.set('ThemeName', meson.project_name())
conf_data.set('VariantThemeName', meson.project_name())
configure_file(input : '../index.theme.in',
               output : 'index.theme',
               configuration : conf_data,
               install_dir: theme_dir)

install_subdir('gtk-2.0', install_dir : theme_dir, strip_directory : false)
subdir('gtk-3.0')
