#!/bin/bash

set -e

sudo snap install steam

sudo apt install pipx

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
