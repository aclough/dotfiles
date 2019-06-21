#!/bin/sh
cd ~/dotfiles
git pull
sudo apt update
sudo apt upgrade
rustup update
choosenim update stable
fish_update_completions
nvim -c PlugUpdate
