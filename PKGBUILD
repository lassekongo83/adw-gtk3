# Maintainer: Nora Amita <qiangtianxing@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk-color-git
_pkgname=adw-gtk3
pkgver=6.4.r10.g34a69db
pkgrel=1
pkgdesc="The theme from libadwaita ported to GTK-3 with accent color variants"
arch=('any')
url="https://github.com/lassekongo83/adw-gtk3"
license=('LGPL-2.1-or-later')
makedepends=(
	'dart-sass'
	'git'
)
provides=("adw-gtk-theme-git")
conflicts=("adw-gtk-theme-git" "adw-gtk-theme" "${_pkgname}")
source=('git+https://github.com/lassekongo83/adw-gtk3.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"

	# Accent colors to build
	COLORS=("blue" "teal" "green" "yellow" "orange" "red" "pink" "purple" "slate")

	# Hex codes from adw-gtk3-colorizer
	declare -A HEX_MAP
	HEX_MAP=(
		["blue"]="#3584e4"
		["teal"]="#2190a4"
		["green"]="#3a944a"
		["yellow"]="#c88800"
		["orange"]="#ed5b00"
		["red"]="#e62d42"
		["pink"]="#d56199"
		["purple"]="#9141ac"
		["slate"]="#6f8396"
	)

	# Root directory of adw-gtk3
	SRC_DIR="src"
	VARIANTS_DIR="variants"

	mkdir -p "$VARIANTS_DIR"

	# Original files to override
	DEFAULTS_SCSS="$SRC_DIR/sass/_defaults.scss"
	TWEAKS_SCSS="$SRC_DIR/sass/gtk4/libadwaita-tweaks.scss"

	for color in "${COLORS[@]}"; do
		hex=${HEX_MAP[$color]}
		echo "Building theme variant: $color ($hex)..."

		# --- LIGHT VARIANT ---
		VARIANT_NAME="adw-gtk3-$color"
		OUT_DIR="$VARIANTS_DIR/$VARIANT_NAME"
		mkdir -p "$OUT_DIR/gtk-3.0" "$OUT_DIR/gtk-4.0"

		# 1. index.theme
		sed "s/@VariantThemeName@/adw-gtk3-$color/g" "$SRC_DIR/index.theme.in" >"$OUT_DIR/index.theme"

		# 2. Apply SASS overrides
		# We use git checkout to restore original files before each color to avoid cumulative changes
		git checkout "$DEFAULTS_SCSS" "$TWEAKS_SCSS"

		# Override @define-color accent_bg_color in _defaults.scss
		sed -i "s/@define-color accent_bg_color @blue_3;/@define-color accent_bg_color $hex;/g" "$DEFAULTS_SCSS"
		# Override in libadwaita-tweaks.scss
		sed -i "s/@define-color accent_bg_color @blue_3;/@define-color accent_bg_color $hex;/g" "$TWEAKS_SCSS"
		# Update GTK4 accent variable in tweaks
		sed -i "s/--accent-bg-color: var(--accent-blue);/--accent-bg-color: var(--accent-$color);/g" "$TWEAKS_SCSS"

		# 3. Compile GTK3 CSS
		echo "  Compiling GTK3..."
		sass --no-source-map -I "$SRC_DIR/sass" "$SRC_DIR/sass/gtk.scss" "$OUT_DIR/gtk-3.0/gtk.css"
		sass --no-source-map -I "$SRC_DIR/sass" "$SRC_DIR/sass/gtk-dark.scss" "$OUT_DIR/gtk-3.0/gtk-dark.css"

		# 4. Compile GTK4 CSS
		echo "  Compiling GTK4..."
		cp "$SRC_DIR/theme-light/gtk4/libadwaita.css" "$OUT_DIR/gtk-4.0/libadwaita.css"
		sass --no-source-map -I "$SRC_DIR/sass" "$SRC_DIR/sass/gtk4/libadwaita-tweaks.scss" "$OUT_DIR/gtk-4.0/libadwaita-tweaks.css"

		echo "@import url('libadwaita.css');" >"$OUT_DIR/gtk-4.0/gtk.css"
		echo "@import url('libadwaita-tweaks.css');" >>"$OUT_DIR/gtk-4.0/gtk.css"
		cp "$OUT_DIR/gtk-4.0/gtk.css" "$OUT_DIR/gtk-4.0/gtk-dark.css"

		# 5. Copy Assets
		cp -r "$SRC_DIR/assets" "$OUT_DIR/gtk-3.0/"
		cp "$SRC_DIR/theme-light/thumbnail-light.png" "$OUT_DIR/gtk-3.0/thumbnail.png"

		# --- DARK VARIANT ---
		VARIANT_NAME_DARK="adw-gtk3-$color-dark"
		OUT_DIR_DARK="$VARIANTS_DIR/$VARIANT_NAME_DARK"
		mkdir -p "$OUT_DIR_DARK/gtk-3.0" "$OUT_DIR_DARK/gtk-4.0"

		# 1. index.theme
		sed "s/@VariantThemeName@/adw-gtk3-$color-dark/g" "$SRC_DIR/index.theme.in" >"$OUT_DIR_DARK/index.theme"

		# 2. GTK3 CSS (For standalone dark, gtk.css is the dark one)
		cp "$OUT_DIR/gtk-3.0/gtk-dark.css" "$OUT_DIR_DARK/gtk-3.0/gtk.css"
		cp "$OUT_DIR/gtk-3.0/gtk-dark.css" "$OUT_DIR_DARK/gtk-3.0/gtk-dark.css"

		# 3. GTK4 CSS
		cp "$OUT_DIR/gtk-4.0/"* "$OUT_DIR_DARK/gtk-4.0/"

		# 4. Assets
		cp -r "$SRC_DIR/assets" "$OUT_DIR_DARK/gtk-3.0/"
		cp "$SRC_DIR/theme-dark/thumbnail-dark.png" "$OUT_DIR_DARK/gtk-3.0/thumbnail.png"
	done

	# Final restoration to leave the tree clean
	git checkout "$DEFAULTS_SCSS" "$TWEAKS_SCSS"
}

package() {
	cd "${_pkgname}"
	install -d "$pkgdir/usr/share/themes"
	cp -a variants/* "$pkgdir/usr/share/themes/"
}
