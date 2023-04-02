theme_dir = join_paths(get_option('datadir'), 'themes', meson.project_name()+'-dark')

conf_data = configuration_data()
conf_data.set('ThemeName', meson.project_name())
conf_data.set('VariantThemeName', meson.project_name()+'-dark')
configure_file(input : '../index.theme.in',
               output : 'index.theme',
               configuration : conf_data,
               install_dir: theme_dir)

subdir('gtk-3.0')
subdir('gtk-4.0')
