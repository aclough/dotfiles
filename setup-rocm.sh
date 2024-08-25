#!/bin/bash
# See https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/quick-start.html

set -e

cd ~/Downloads

sudo apt update
# Include DKMS headers
sudo apt install -y "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
# Add myself to video and render
sudo usermod -a -G render,video $LOGNAME

wget https://repo.radeon.com/amdgpu-install/6.2/ubuntu/noble/amdgpu-install_6.2.60200-1_all.deb
sudo apt install ./amdgpu-install_6.2.60200-1_all.deb
sudo apt update
sudo apt install -y amdgpu-dkms rocm
