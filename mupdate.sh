#!/bin/bash
set -euo pipefail
cd ~/dotfiles
git pull
sudo apt update
sudo apt-get dist-upgrade
rhr-setup --update zoom
cp ~/rhr/pick/docker-compose.override.yaml ~/workspace
cd ~/rhr/pick
rhr-docker clean
cargo install-update -a
fish -c "source ~/rhr/pick/build/deploy/env.fish; fish_update_completions"
tldr --update
nvim --headless "+Lazy! update" +qa
