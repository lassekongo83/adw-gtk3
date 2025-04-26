# Configure our index.theme file
dark_conf_data = configuration_data()
dark_conf_data.set('ThemeName', meson.project_name())
dark_conf_data.set('VariantThemeName', meson.project_name() + '-dark')
configure_file(input: '../index.theme.in', output: 'index.theme.dark', configuration: dark_conf_data)
install_data(meson.current_build_dir() / 'index.theme.dark', install_dir: theme_dir_dark, rename: 'index.theme')

# Make sure we have depend files so ninja can detect changes
sass_path = '../sass'
sass_depend_files = run_command(
  'find',
  sass_path,
  '-name', '*.scss',
  check : true
).stdout().split()

# Compile the CSS
gtk_dark_css_target = custom_target('generate_gtk_dark_css',
  input: '../sass/gtk-dark.scss',
  output: 'gtk.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk3_dir_dark,
  depend_files: sass_depend_files
)

gtk_dark_dark_css_target = custom_target('generate_gtk_dark_dark_css',
  input: '../sass/gtk-dark.scss',
  output: 'gtk-dark.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk3_dir_dark,
  depend_files: sass_depend_files
)

# GTK4

gtk4_asset_dir = join_paths(gtk4_dir_dark, 'assets')

gtk4_assets = [
  '../assets/bullet-symbolic.svg',
  '../assets/bullet-symbolic.symbolic.png',
  '../assets/bullet@2-symbolic.symbolic.png',
  '../assets/check-symbolic.svg',
  '../assets/check-symbolic.symbolic.png',
  '../assets/check@2-symbolic.symbolic.png',
  '../assets/dash-symbolic.svg',
  '../assets/dash-symbolic.symbolic.png',
  '../assets/dash@2-symbolic.symbolic.png',
  '../assets/devel-symbolic.svg',
]

gtk4_css = [
  'gtk4/gtk.css',
  'gtk4/gtk-dark.css',
  'gtk4/libadwaita.css',
]

libadwaita_tweaks_target = custom_target('generate_libadwaita_tweaks_css',
  input: '../sass/gtk4/theme-dark.scss',
  output: 'libadwaita-tweaks.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk4_dir_dark,
  depend_files: sass_depend_files
)

install_data(gtk4_css, install_dir: gtk4_dir_dark)
install_data(gtk4_assets, install_dir: gtk4_asset_dir)

# Misc
install_subdir('../assets', install_dir : gtk3_dir_dark, strip_directory : false)
install_data(['thumbnail-dark.png'], install_dir: gtk3_dir_dark, rename: ['thumbnail.png'])
