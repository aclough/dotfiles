#!/bin/bash
set -e
cd ~/dotfiles
dconf dump /org/gnome/terminal > gnome-terminal-settings.txt
git pull
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
clean-laptop-boot-partition
sudo service memcachedb restart
# If something has removed the cuda link regenerate it
if ! test -L /usr/local/cuda; then
    sudo apt install --reinstall cuda-toolkit-10-2
fi
bounce --inject-ssh-config
fish -c "source ~/rhr/pick/build/deploy/env.fish; fish_update_completions"
tldr --update
nvim -c PlugUpdate
