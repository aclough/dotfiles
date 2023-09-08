#!/bin/bash
set -e
cd ~/dotfiles
git pull
sudo apt update
sudo apt upgrade
set +e
protonup
rustup update
choosenim update stable
protonup
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
