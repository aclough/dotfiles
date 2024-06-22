#!/bin/bash

set -e

sudo apt install steam-installer radeontop

pip install protonup

sudo apt install -y radeontop

# Maybe add advanced Radeon drivers and kernel (if this is my desktop)
# But not compatible with steam 32 bit libraries
# sudo apt-add-repository ppa:oibaf/graphics-drivers
# sudo add-apt-repository ppa:kisak/kisak-mesa
# For AMD power management

