.ONESHELL:
SHELL := /bin/bash
.SHELLFLAGS += -O globstar -e

MAKEFLAGS += --always-make

DIR                  := ${CURDIR}
BUILD_DIR            := ${DIR}/build
TARGET_DIR           := ${DIR}/target
TARGET_THEMES_DIR    := ${TARGET_DIR}/share/themes
RELEASE_DIR          := ${DIR}/releases
VERSION              := $(shell date +'%Y-%m-%d')

GTK4_DIR             := ${DIR}/libadwaita
GTK4_BUILD_DIR       := ${GTK4_DIR}/_build
GTK4_PATCH_DIR       := ${TARGET_THEMES_DIR}/adw-gtk3/gtk-4.0
GTK4_PATCH_SRC_DIR   := ${GTK4_BUILD_DIR}/src/stylesheet
GTK4_DARK_PATCH_DIR  := ${TARGET_THEMES_DIR}/adw-gtk3-dark/gtk-4.0
GTK4_ASSETS_DIR      :=  ${GTK4_DIR}/src/stylesheet/assets

DEBIAN_DIR           := ${DIR}/debian
DEBIAN_CONTROL       := ${DEBIAN_DIR}/control
DEBIAN_VERSION       := $(shell date +'%Y.%m.%d')

all: clean build gtk4build gtk4patch release debian rpm

update:
	git pull
	git submodule update --recursive --remote

build:
	meson -Dprefix="${TARGET_DIR}" ${BUILD_DIR}
	ninja -C ${BUILD_DIR} install

gtk4build:
	cd ${GTK4_DIR}
	meson . ${GTK4_BUILD_DIR}
	ninja -C ${GTK4_BUILD_DIR}

gtk4patch:
	#light
	mkdir -p ${GTK4_PATCH_DIR}
	cp ${GTK4_PATCH_SRC_DIR}/defaults-light.css ${GTK4_PATCH_DIR}
	cp -R ${GTK4_ASSETS_DIR} ${GTK4_PATCH_DIR}
	echo "@import 'defaults-light.css';\n" |cat - ${GTK4_PATCH_SRC_DIR}/base.css >${GTK4_PATCH_DIR}/gtk.css
	#dark
	mkdir -p ${GTK4_DARK_PATCH_DIR}
	cp ${GTK4_PATCH_SRC_DIR}/defaults-dark.css ${GTK4_DARK_PATCH_DIR}
	cp -R ${GTK4_ASSETS_DIR} ${GTK4_DARK_PATCH_DIR}
	echo "@import 'defaults-dark.css';\n" |cat - ${GTK4_PATCH_SRC_DIR}/base.css >${GTK4_DARK_PATCH_DIR}/gtk.css

debian: build gtk4build gtk4patch
	mkdir -p ${BUILD_DIR}/debian
	cd ${BUILD_DIR}/debian
	cp ${DEBIAN_CONTROL}.in ${DEBIAN_CONTROL}
	# Remove trailing newline character in control file
	sed -i -z 's/\n$$//' ${DEBIAN_CONTROL}
	sed -i -z 's/__VERSION__/${DEBIAN_VERSION}/' ${DEBIAN_CONTROL}
	$(date +'%Y-%m-%d')
	LEN=`echo ${TARGET_DIR} |wc -c`
	for f in ${TARGET_DIR}/**; do
		if [ -d $${f} ]; then
			continue
		fi
		echo " $${f} `dirname /usr/$${f:$${LEN}}`" >>${DEBIAN_CONTROL}
	done
	equivs-build ${DEBIAN_CONTROL}
	mkdir -p ${RELEASE_DIR}
	cp *.deb ${RELEASE_DIR}
	cd ${DIR}

rpm:
	cd ${RELEASE_DIR}
	fakeroot alien --to-rpm *.deb
	cd ${DIR}

release:
	mkdir -p ${RELEASE_DIR}
	cd ${TARGET_THEMES_DIR}
	tar -zcvf ${RELEASE_DIR}/adw-gtk3-gtk4-${VERSION}.tgz *

clean:  gtk4clean debianclean
	rm -rf "${TARGET_DIR}"
	rm -rf "${BUILD_DIR}"

gtk4clean:
	rm -rf ${DIR}/libadwaita/_build

debianclean:
	rm -f ${DEBIAN_CONTROL}
