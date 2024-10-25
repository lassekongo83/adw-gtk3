gtk3_dir = join_paths(theme_dir, 'gtk-3.0')

# Install asset files to themes/ThemeName/gtk-3.0/assets
install_subdir('assets', install_dir : gtk3_dir, strip_directory : false)

# theme sources .scss files

# The files that need to be compiled
if get_option('dark')
  gtk3_scss_sources = [
    'gtk',
    'gtk-dark',
  ]
else
  gtk3_scss_sources = [
    'gtk',
    'gtk-dark',
  ]
endif

# Dependencies of the files that need to be compiled
gtk3_scss_dependencies = [
  '_functions.scss',
  '_palette.scss',
  '_defaults.scss',
  '_colors-public.scss',
  '_custom.scss',
  '_colors.scss',
  '_common.scss',
  '_drawing.scss',
  '_libhandy.scss',
  '_granite.scss',
  '_apps.scss',
]

# Generate .css files and install
gtk3_scss_dependencies = files(gtk3_scss_dependencies)
#
foreach f : gtk3_scss_sources
    custom_target('generate_' + f,
        input: f + '.scss',
        output: f + '.css',
        depend_files: gtk3_scss_dependencies,
        command: [sassc, '-M', '-t', 'compact', '@INPUT@', '@OUTPUT@'],
        build_by_default: true,
        install: true,
        install_dir: gtk3_dir,
    )
endforeach

# Provide a copy of libadwaita as is.
# In the gtk3 directory so we don't have duplicate the assets.
install_data(['libadwaita.css'], install_dir: gtk3_dir)
install_data(['libadwaita-tweaks.css'], install_dir: gtk3_dir)
