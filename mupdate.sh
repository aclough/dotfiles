#!/bin/bash
set -e
cd ~/dotfiles
git pull
sudo pacman -Syu
sudo paccache -r
set +e
rustup update
choosenim update stable
protonup
cargo install-update -a
~/workspace/anaconda3/bin/conda update -n base -c defaults conda
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
