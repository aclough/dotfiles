#!/bin/bash
#https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs

set -e

sudo usermod -aG video $USER
sudo usermod -aG render $USER


sudo pacman -S python-pytorch-rocm rocminfo

sudo yay -Sns python-torchvision-rocm
