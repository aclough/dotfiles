#!/bin/bash

# Sets up river-classic, the dynamic tiling (xmonad/dwm-style) Wayland
# compositor. Mirrors setup-niri.sh; both sessions can coexist and are picked
# from the login screen.
#
# Why river-classic and why this version:
#   - river 0.4+ turned into a bare compositor that needs a separate window
#     manager client. The old dynamic tiler with rivertile continues as
#     river-classic (https://codeberg.org/river/river-classic).
#   - river-classic v0.3.15+ needs wlroots 0.20, but Ubuntu 26.04 only ships
#     wlroots 0.19, so we pin v0.3.14 (the last wlroots 0.19 release).
#   - v0.3.14 needs zig 0.15, while the snap zig is 0.16. We fetch a private
#     zig 0.15.2 tarball into ~/.local/opt rather than touching the snap.

set -euo pipefail

RIVER_TAG=v0.3.14
ZIG_VERSION=0.15.2
ZIG_SHA256=02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239
ZIG_DIR=~/.local/opt/zig-$ZIG_VERSION

cd ~/dotfiles
./setup-wayland.sh

# Build deps for river-classic
sudo apt-get install -y pkg-config libwlroots-0.19-dev libwayland-dev \
    wayland-protocols libxkbcommon-dev libevdev-dev libinput-dev \
    libpixman-1-dev scdoc xwayland

# Runtime bits used by river_init
sudo apt-get install -y nemo mako-notifier mate-polkit swaylock fuzzel \
    wlr-randr grim slurp playerctl xdg-desktop-portal-wlr

# Private zig toolchain of the version river-classic v0.3.14 needs
if [ ! -x "$ZIG_DIR/zig" ]; then
    mkdir -p ~/.local/opt
    tmp=$(mktemp -d)
    curl -fsSL -o "$tmp/zig.tar.xz" \
        "https://ziglang.org/download/$ZIG_VERSION/zig-x86_64-linux-$ZIG_VERSION.tar.xz"
    echo "$ZIG_SHA256  $tmp/zig.tar.xz" | sha256sum -c -
    tar -xJf "$tmp/zig.tar.xz" -C ~/.local/opt
    mv ~/.local/opt/zig-x86_64-linux-$ZIG_VERSION "$ZIG_DIR"
    rm -rf "$tmp"
fi

# Build river-classic (river, riverctl, rivertile + man pages)
cd ~/workspace
if [ ! -d river-classic ]; then
    git clone https://codeberg.org/river/river-classic.git
fi
cd river-classic
git fetch --tags
git checkout "$RIVER_TAG"
rm -rf out
"$ZIG_DIR/zig" build -Doptimize=ReleaseSafe -Dxwayland --prefix "$PWD/out" install
sudo cp out/bin/river out/bin/riverctl out/bin/rivertile /usr/local/bin/
sudo mkdir -p /usr/local/share/man/man1 /usr/local/share/man/man5
sudo cp out/share/man/man1/*.1 /usr/local/share/man/man1/
sudo cp out/share/man/man5/*.5 /usr/local/share/man/man5/ 2>/dev/null || true

# Login-screen session entry and portal config
sudo cp ~/dotfiles/river.desktop /usr/share/wayland-sessions/river.desktop
sudo cp ~/dotfiles/river-portals.conf /usr/share/xdg-desktop-portal/river-portals.conf

# For brightnessctl
sudo usermod -aG video "$USER"

# Config symlinks
mkdir -p ~/.config/river
ln -sf ~/dotfiles/river_init ~/.config/river/init

mkdir -p ~/.config/mako
ln -sf ~/dotfiles/mako.conf ~/.config/mako/config

echo "Done. Log out and pick 'River' from the session menu."
