#!/bin/bash

sudo apt install server-install
/srv/package-mirror/mirror_pull
sudo apt update
sudo apt-get dist-upgrade
sudo apt install rhr-rightpick-deps
