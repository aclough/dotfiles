#!/bin/bash
# See https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html

set -e

cd ~/Downloads

sudo apt update
# Include DKMS headers
sudo apt -y install linux-headers-generic
# Add myself to video and render
sudo usermod -a -G render,video $USER

wget https://repo.radeon.com/amdgpu-install/6.2.2/ubuntu/noble/amdgpu-install_6.2.60202-1_all.deb
sudo apt install ./amdgpu-install_6.2.60202-1_all.deb
sudo apt update
sudo apt install -y amdgpu-dkms rocm
sudo apt install ./amdgpu-install_6.2.60202-1_all.deb
