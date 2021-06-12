#!/bin/bash

set -e

sudo apt install xmonad gnome-session-flashback

mkdir ~/.xmonad
ln -s ~/dotfiles/xmonad.hs ~/.xmonad
xmonad --recompile
ln -s ~/dotfiles/xmonad.desktop ~/.config/autostart

echo "#########################"
echo "Remember to log in via the metacity falshback session"
echo "#########################"
