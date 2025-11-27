#!/bin/bash

# For installing all the stuff I might need to run a wayland session outside a desktop environment

set -e

# Wayland fundamentals and build fundamentals
sudo apt-get install -y gcc clang libudev-dev libgbm-dev libxkbcommon-dev libegl1-mesa-dev libwayland-dev libinput-dev libdbus-1-dev libsystemd-dev libseat-dev libpipewire-0.3-dev libpango1.0-dev libdisplay-info-dev

sudo apt-get install -y swaylock fuzzel brightnessctl waybar pavucontrol thunar xdg-desktop-portal-gnome wl-clipboard wlogout

mkdir -p ~/.config/waybar
ln -s ~/dotfiles/waybar-config.jsonc ~/.config/waybar/config.jsonc

sudo apt-get install -y iwd
cargo install wpaperd impala
# Turn on iwd service now to use impala
sudo systemctl enable --now iwd

mkdir -p ~/.config/wpaperd
ln -s ~/dotfiles/wpaperd-config.toml ~/.config/wpaperd/config.toml

mkdir -p ~/.config/fuzzel
ln -s ~/dotfiles/fuzzel-config.ini ~/.config/fuzzel/fuzzel.ini

sudo apt install -y libxcb-composite0-dev libxcb-res0-dev libwayland-dev pkg-config libxcb-cursor-dev
cd ~/workspace
git clone https://github.com/Supreeeme/xwayland-satellite
cd xwayland-satellite
cargo build --release
# We want this system-wide
sudo cp target/release/xwayland-satellite /usr/local/bin
