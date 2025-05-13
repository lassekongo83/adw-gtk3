## Building from source

### Requirements

| Distribution | Command/Info |
|:--|:--|
| ArchLinux | `pacman -S ninja git meson dart-sass` |
| Ubuntu | `sudo apt install ninja-build git meson && sudo snap install dart-sass && sudo snap alias dart-sass sass` |
| Fedora | `sudo dnf install nodejs ninja-build git meson` and then install sass with `npm install -g sass` |
| Others | Install git, meson, ninja-build, (node.js). Also make sure `dart-sass` is installed from any available source. |

Other distros may have named the above packages differently.

Dart-sass can also be installed from source if you don't want to use `node.js`:
1. Download the release for your architecture: https://github.com/sass/dart-sass/releases
2. Run `tar -xvf dart-sass-<version>-linux-x64.tar.gz` (Replace `<version>` with the version you downloaded, and also `x64` if needed.) This will create a new directory containing the sass executable.
3. To be able to run the sass command from anywhere in your terminal, you should move the executable to a directory that's included in your system's PATH environment variable. `/usr/local/bin` is a common place for this, but it can be different on various distros. Run `echo $PATH` to see if it's included. Move `src` and `sass` to that location. Then run `sass --version` to confirm that it's working.

Make sure you can run `sass --version` before continuing. If that command displays an error you may need to create an alias in your `~/.bashrc` file with whatever command your package manager provided you with.

When the above requirements are installed, simply run these commands:

```bash
git clone https://github.com/lassekongo83/adw-gtk3.git
cd adw-gtk3
meson setup -Dprefix="${HOME}/.local" build
ninja -C build install
```

### Updating the theme from git
1. Navigate to the `adw-gtk3` folder that was originally cloned. (If you removed it, do the steps above instead).
2. Then run: `git pull && ninja -C build install`

## Information for contributors

* **assets**
    * This is the dir where all the image assets are built to. For this theme the files are already pre-built. If you need to re-build the images, remove them from `src/assets` and run `sh scripts/render-assets.sh`
* **sass**
    * This is where you'll edit the scss files that will compile to the theme.
* **theme-dark**
    * Dark theme related files.
* **theme-light**
    * Light theme related files.

- assets.svg = This is the file that contains all the image assets. If you want to add an image asset you'll have to add it to this file and add an unique object ID to it.
- assets.txt = This is the file that contains the object IDs of all image assets. This info is passed on to [render-assets.sh](scripts/render-assets.sh) which will create the image assets if flatpak inkscape is installed.
- index.theme.in = Theme index file template which defines the characteristics of the theme.
