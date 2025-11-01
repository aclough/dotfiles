#!/bin/bash
#
#From https://rocm.docs.amd.com/projects/radeon/en/latest/docs/install/install-pytorch.html

set -e

cd ~/workspace
pip3 install --upgrade pip wheel

pip install typing_extensions==4.4.0

sudo apt update
sudo apt install -y git python3-pip python3-venv python3-dev libstdc++-12-dev

curl -O https://repo.radeon.com/amdgpu-install/5.7.1/ubuntu/jammy/amdgpu-install_5.7.50701-1_all.deb
sudo dpkg -i amdgpu-install_5.7.50701-1_all.deb
rm *.deb

sudo amdgpu-install --usecase=rocm

sudo usermod -aG render,video $USER

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.1

pip3 install cython
pip3 install mujoco
pip3 install gymnasium

# In global scope
pipx install poetry
