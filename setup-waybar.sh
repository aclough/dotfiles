#!/bin/bash

set -e

sudo apt-get install -y swaylock fuzzel brightnessctl waybar pavucontrol thunar xdg-desktop-portal-gnome

mkdir -p ~/.config/waybar
ln -s ~/dotfiles/waybar-config.jsonc ~/.config/waybar/config.jsonc

cargo install wpaperd

mkdir -p ~/.config/wpaperd
ln -s ~/dotfiles/wpaperd-config.toml ~/.config/wpaperd/config.toml
