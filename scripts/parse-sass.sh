#! /bin/bash

# This is only used for testing 
# Use meson to build the theme

if [ ! "$(which sass 2> /dev/null)" ]; then
  echo "sass needs to be installed to generate the css."
  exit 1
fi

SASSC_OPT="--style=expanded --no-source-map"

echo "Generating the css..."

sass $SASSC_OPT ../src/sass/gtk.scss ../src/gtk.css
sass $SASSC_OPT ../src/sass/gtk-dark.scss ../src/gtk-dark.css
