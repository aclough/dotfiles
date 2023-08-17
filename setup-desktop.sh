#!/bin/bash

set -e

# Lutris Battle.net stuff
sudo dpkg --add-architecture i386
sudo apt update
sudo apt ugprade
# 32 bit vulkan
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386
# Other 32 bit drivers
sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
# Battle.net dependencies

sudo snap install steam

sudo apt install pipx corectrl

pipx install protonup


# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# sudo add-apt-repository ppa:kisak/kisak-mesa
# For AMD power management
# sudo add-apt-repository ppa:radeon-profile/radeon-profile
# sudo add-apt-repository ppa:oibaf/graphics-drivers
# sudo apt update
# sudo apt install radeon-profile
# Sadly 20.04 only for now
