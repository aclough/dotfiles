#!/bin/bash

set -e

# Steam 32 bit
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install wget gdebi-core libgl1-mesa-glx:i386
wget -O ~/steam.deb http://media.steampowered.com/client/installer/steam.deb
sudo apt install ./steam.deb






sudo apt install pipx

pipx install protonup


# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
# But not compatible with steam 32 bit libraries
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# sudo add-apt-repository ppa:kisak/kisak-mesa
# For AMD power management
