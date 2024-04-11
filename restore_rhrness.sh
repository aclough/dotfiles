#!/bin/bash

sudo apt install -y server-install
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
sudo apt install -y rhr-rightpick-deps
