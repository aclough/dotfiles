#!/bin/sh
sudo apt update
sudo apt upgrade
rustup update
cabal update
nvim -c PlugUpdate
