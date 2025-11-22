#!/bin/bash

set -e

sudo apt-get install -y swaylock fuzzel brightnessctl waybar pavucontrol thunar xdg-desktop-portal-gnome

mkdir -p ~/.config/waybar
ln -s ~/dotfiles/waybard-config.jsonc ~/.config/waybar/config.jsonc
