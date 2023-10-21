#!/bin/bash

set -e

sudo usermod -aG video $USER
sudo usermod -aG render $USER

# RuntimeError: HIP error: invalid device function

sudo pacman -S python-pytorch-rocm rocminfo

sudo yay -S python-torchvision-rocm

# fish: Job 1, 'python3 test.py' terminated by signal SIGSEGV (Address boundary error)
