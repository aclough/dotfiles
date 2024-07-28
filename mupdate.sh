#!/bin/bash
set -euo pipefail
cd ~/dotfiles
git pull
# sudo pacman -Sy archlinux-keyring endeavouros-keyring
sudo pacman -Syu
sudo paccache -r
yay
set +e
rustup update
choosenim update stable
protonup
cargo install-update -a
~/workspace/conda/bin/conda update -n base -c defaults conda
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
