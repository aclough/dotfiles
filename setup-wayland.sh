#!/bin/bash

# For installing all the stuff I might need to run a wayland session outside a desktop environment

set -e

sudo apt-get install -y swaylock fuzzel brightnessctl waybar pavucontrol thunar xdg-desktop-portal-gnome wl-clipboard

mkdir -p ~/.config/waybar
ln -s ~/dotfiles/waybar-config.jsonc ~/.config/waybar/config.jsonc

cargo install wpaperd

mkdir -p ~/.config/wpaperd
ln -s ~/dotfiles/wpaperd-config.toml ~/.config/wpaperd/config.toml


sudo apt install -y libxcb-composite0-dev libxcb-res0-dev libwayland-dev pkg-config libxcb-cursor-dev
cd ~/workspace
git clone https://github.com/Supreeeme/xwayland-satellite
cd xwayland-satellite
cargo build --release
# We want this system-wide
sudo cp target/release/xwayland-satellite /usr/local/bin
