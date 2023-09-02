#!/bin/bash
set -e
cd ~/dotfiles
git pull
sudo apt update
sudo apt upgrade
rustup update
choosenim update stable
protonup -d ~/snap/steam/common/.steam/root/compatibilitytools.d
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
