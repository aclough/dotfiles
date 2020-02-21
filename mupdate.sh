#!/bin/bash
set -e
cd ~/dotfiles
git pull
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
bounce --inject-ssh-config
fish -c fish_update_completions
tldr --update
nvim -c PlugUpdate
