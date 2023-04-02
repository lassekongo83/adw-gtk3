#!/bin/sh
set -eu

theme_dir="${MESON_INSTALL_DESTDIR_PREFIX}/$1"
project_name="$2"

install -m755 -d "${theme_dir}"
for ver in gtk-4.0; do
  install -m755 -d "${theme_dir}/${ver}"
  cp -r "gtk/src/${project_name}/${ver}/gtk-dark.css" "${theme_dir}/${ver}/gtk.css"
  cp -r "gtk/src/${project_name}/${ver}/gtk-dark.css" "${theme_dir}/${ver}/gtk-dark.css"
done
