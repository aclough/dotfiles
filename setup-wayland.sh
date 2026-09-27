#!/bin/bash

# Safe to re-run: symlinks are forced and the clone is skipped if present.

# For installing all the stuff I might need to run a wayland session outside a desktop environment

set -e

# Wayland fundamentals and build fundamentals
sudo apt-get install -y gcc clang libudev-dev libgbm-dev libxkbcommon-dev libegl1-mesa-dev libwayland-dev libinput-dev libdbus-1-dev libsystemd-dev libseat-dev libpipewire-0.3-dev libpango1.0-dev libdisplay-info-dev

sudo apt-get install -y swaylock fuzzel brightnessctl waybar pavucontrol thunar xdg-desktop-portal-gnome wl-clipboard wlogout

mkdir -p ~/.local/share/applications
ln -sf ~/dotfiles/wlogout.desktop ~/.local/share/applications/wlogout.desktop

mkdir -p ~/.config/waybar
ln -sf ~/dotfiles/waybar-config.jsonc ~/.config/waybar/config.jsonc

cargo install wpaperd
sudo apt install -y network-manager-gnome

mkdir -p ~/.config/wpaperd
ln -sf ~/dotfiles/wpaperd-config.toml ~/.config/wpaperd/config.toml

mkdir -p ~/.config/fuzzel
ln -sf ~/dotfiles/fuzzel-config.ini ~/.config/fuzzel/fuzzel.ini

sudo apt install -y libxcb-composite0-dev libxcb-res0-dev libwayland-dev pkg-config libxcb-cursor-dev
cd ~/workspace
if [ ! -d xwayland-satellite ]; then
    git clone https://github.com/Supreeeme/xwayland-satellite
fi
cd xwayland-satellite
cargo build --release
# We want this system-wide
sudo cp target/release/xwayland-satellite /usr/local/bin
