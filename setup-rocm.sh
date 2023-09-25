#!/bin/bash
# See https://medium.com/@ttio2tech_28094/rocm-v5-4-2-installation-guide-for-amd-gpu-in-early-2023-8f5b3933d1d6

set -e

sudo apt-get install wget gnupg2 gawk curl

cd ~/workspace
wget https://repo.radeon.com/amdgpu-install/5.4.2/ubuntu/focal/amdgpu-install_5.4.50402-1_all.deb
sudo apt-get install ./amdgpu-install_5.4.50402-1_all.deb

sudo apt-get update
sudo amdgpu-install --usecase=graphics,rocm

rm amdgpu-install_5.4.50402-1_all.deb

