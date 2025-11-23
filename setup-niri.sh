#!/bin/bash

set -e

cd ~/dotfiles
./setup-wayland.sh

sudo apt install -y nemo

# Dependencies for build
sudo apt-get install -y gcc clang libudev-dev libgbm-dev libxkbcommon-dev libegl1-mesa-dev libwayland-dev libinput-dev libdbus-1-dev libsystemd-dev libseat-dev libpipewire-0.3-dev libpango1.0-dev libdisplay-info-dev

cd ~/workspace
git clone https://github.com/YaLTeR/niri.git
cd niri

cargo build --release

sudo cp target/release/niri /usr/bin
sudo cp resources/niri-session /usr/bin
sudo cp resources/niri.desktop /usr/share/wayland-sessions
sudo cp resources/niri-portals.conf /usr/share/xdg-desktop-portal/
sudo cp resources/niri.service /etc/systemd/user/
sudo cp resources/niri-shutdown.target /etc/systemd/user/

# For config
sudo apt-get install -y swaylock fuzzel

mkdir -p ~/.config/niri
ln -s ~/dotfiles/niri_config.kdl ~/.config/niri/config.kdl
