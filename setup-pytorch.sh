#!/bin/bash

set -e

sudo apt install hipcc rocm-smi rocminfo clinfo

sudo usermod -aG render,video $USER

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.1
