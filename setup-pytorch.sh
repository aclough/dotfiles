#!/bin/bash
#https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs

set -e

sudo usermod -aG video $USER
sudo usermod -aG render $USER

sudo pacman -S rocminfo rocm-core

source ~/workspace/conda/etc/profile.d/conda.sh
conda create --name pytorch
conda activate pytorch
pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.0
