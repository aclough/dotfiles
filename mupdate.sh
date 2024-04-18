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
docker compose up -d
docker compose exec rightpick fish -c fish_update_completions
cargo install-update -a
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
