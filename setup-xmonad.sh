#!/bin/bash

set -e

sudo apt install -y xmonad gnome-session-flashback nemo scrot

mkdir -p ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
xmonad --recompile
ln -s ~/dotfiles/xmonad.desktop ~/.config/autostart

# Don't let input setting override switching layouts
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Control><Super>space']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift><Control><Super>space']"
# Disable normal screenshot
gsettings set org.gnome.gnome-flashback screenshot false

echo "#########################"
echo "Remember to log in via the metacity falshback session"
echo "#########################"
