#!/bin/bash
set -e
cd ~/dotfiles
git pull
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
nvim -c PlugUpdate
