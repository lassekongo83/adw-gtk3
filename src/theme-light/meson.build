# Configure our index.theme file
light_conf_data = configuration_data()
light_conf_data.set('ThemeName', meson.project_name())
light_conf_data.set('VariantThemeName', meson.project_name())
configure_file(input: '../index.theme.in', output: 'index.theme.light', configuration: light_conf_data)
install_data(meson.current_build_dir() / 'index.theme.light', install_dir: theme_dir, rename: 'index.theme')

# Make sure we have depend files so ninja can detect changes
sass_path = '../sass'
sass_depend_files = run_command(
  'find',
  sass_path,
  '-name', '*.scss',
  check : true
).stdout().split()

# Compile the CSS
gtk_light_css_target = custom_target('generate_gtk_light_css',
  input: '../sass/gtk.scss',
  output: 'gtk.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk3_dir,
  depend_files: sass_depend_files
)

gtk_light_dark_css_target = custom_target('generate_gtk_light_dark_css',
  input: '../sass/gtk-dark.scss',
  output: 'gtk-dark.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk3_dir,
  depend_files: sass_depend_files
)

# GTK4

gtk4_asset_dir = join_paths(gtk4_dir, 'assets')

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
  input: '../sass/gtk4/theme-light.scss',
  output: 'libadwaita-tweaks.css',
  command: [sass, '--no-source-map', '@INPUT@', '@OUTPUT@'],
  build_by_default: true,
  install: true,
  install_dir: gtk4_dir,
  depend_files: sass_depend_files
)

install_data(gtk4_css, install_dir: gtk4_dir)
install_data(gtk4_assets, install_dir: gtk4_asset_dir)

# Misc
install_subdir('../assets', install_dir : gtk3_dir, strip_directory : false)
install_data(['thumbnail-light.png'], install_dir: gtk3_dir, rename: ['thumbnail.png'])
