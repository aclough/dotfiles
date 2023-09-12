#!/bin/bash
set -euo pipefail
cd ~/dotfiles
git pull
sudo apt update
sudo apt-get dist-upgrade
rhr-setup --update zoom
cd ~/rhr/pick
rhr-docker clean
fish -c "source ~/rhr/pick/build/deploy/env.fish; fish_update_completions"
tldr --update
nvim --headless "+Lazy! update" +qa
