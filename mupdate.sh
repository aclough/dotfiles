#!/bin/sh
cd ~/dotfiles
git pull
sudo apt update
sudo apt upgrade
rustup update
choosenim update stable
cabal update
nvim -c PlugUpdate
