#!/bin/bash
set -euo pipefail
cd ~/dotfiles
git pull
cd ~/workspace/rocket_tycoon
git pull
sudo apt update
sudo apt-get dist-upgrade
set +e
rustup update
cargo install-update -a
choosenim update stable
source ~/workspace/conda/bin/activate
#protonup
conda update -n base -c defaults conda
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
claude update
