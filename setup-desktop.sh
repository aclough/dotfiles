#!/bin/bash

set -e

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y steam radeontop

pip install protonup

# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
# But not compatible with steam 32 bit libraries
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# sudo add-apt-repository ppa:kisak/kisak-mesa
# For AMD power management

