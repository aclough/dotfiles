#!/bin/bash

set -e

sudo apt install rocminfo clinfo libamd-comgr2 libamdhip64-5 libhipblas0 libhipfft0 libhiprand1 libhipsolver0 \
    libhipsparse0 libhsa-runtime64-1 librccl1 librocalution0 librocblas0 librocfft0 librocm-smi64-1 librocrand1 \
    librocsolver0 librocsparse0 rocm-device-libs-17 rocm-smi hipcc

sudo usermod -aG render,video $USER

pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.0
