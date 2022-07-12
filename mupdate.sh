#!/bin/bash
set -euo pipefail
cd ~/dotfiles
#bounce --inject-ssh-config
dconf dump /org/gnome/terminal/ > gnome-terminal-settings.txt
git pull
sudo apt update
sudo apt-get dist-upgrade
cd ~/rhr/pick
rhr-docker clean
fish -c "source ~/rhr/pick/build/deploy/env.fish; fish_update_completions"
tldr --update
nvim -c PlugUpdate
