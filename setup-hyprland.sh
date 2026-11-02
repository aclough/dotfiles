#!/bin/bash
# Hyprland with an xmonad-flavoured config.  Assumes setup-wayland.sh has been
# run for the shared bits (waybar, fuzzel, swaylock, wpaperd, wlogout...).

set -e

sudo apt install -y hyprland hyprland-qtutils xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
    xwayland nemo mako-notifier mate-polkit grim slurp playerctl

mkdir -p ~/.config/hypr ~/.config/mako ~/.local/bin
ln -sfn ~/dotfiles/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sfn ~/dotfiles/mako.conf ~/.config/mako/config
ln -sfn ~/dotfiles/screenshot.sh ~/.local/bin/screenshot.sh

Hyprland --verify-config

echo "Log out and pick Hyprland at the login screen."
