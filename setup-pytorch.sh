#!/bin/bash

set -e

cd ~/workspace
pip3 install --upgrade pip wheel

pip install typing_extensions==4.4.0

sudo usermod -aG video $USER
sudo usermod -aG render $USER

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm5.7

# RuntimeError: HIP error: invalid device function

sudo pacman -S python-pytorch-rocm

# fish: Job 1, 'python3 test.py' terminated by signal SIGSEGV (Address boundary error)
