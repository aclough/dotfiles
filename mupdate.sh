#!/bin/bash
set -e
cd ~/dotfiles
git pull
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
clean-laptop-boot-partition
# If something has removed the cuda link regenerate it
if ! test -L /usr/local/cuda; then
    sudo apt install --reinstall cuda-toolkit-10-2
fi
bounce --inject-ssh-config
fish -c fish_update_completions
tldr --update
nvim -c PlugUpdate
