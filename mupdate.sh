#!/bin/bash
set -e
cd ~/dotfiles
git pull
sudo apt update
sudo apt upgrade
protonup
rustup update
choosenim update stable
fish -c fish_update_completions
tldr --update
nvim -c PlugUpdate
