#!/bin/bash
cd ~/dotfiles
git pull
sudo /srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
nvim -c PlugUpdate
