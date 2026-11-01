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
uv self update
uv pip install --upgrade --python ~/workspace/pytorch/.venv torch torchvision --index-url https://download.pytorch.org/whl/rocm7.1
fish -c fish_update_completions
tldr --update
nvim --headless "+Lazy! update" +qa
claude update
