#!/bin/bash
# Setup for my AMD desktop (RX 7900 XT): Steam, ROCm and PyTorch.
# Run after setup.sh.  Everything here comes from the stock Ubuntu 26.04 repos,
# so AMD's apt repo, amdgpu-install, DKMS and conda are no longer needed.

set -e

sudo apt update

# Steam.  Ubuntu's package enables i386 and pulls in the 32-bit libs itself.
# radeontop: GPU monitor (nvtop comes from setup.sh)
sudo apt install -y steam-installer radeontop flatpak

# Proton-GE and other Steam compatibility tools are managed with ProtonPlus
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub com.vysp3r.ProtonPlus

# ROCm.  The amdgpu kernel driver is already in the stock kernel, so this is just
# the userspace dev stack plus diagnostics.  `rocm` would also add the test suites.
sudo apt install -y rocm-dev rocminfo rocm-smi
sudo usermod -aG render,video "$USER"

# PyTorch.  The wheels bundle their own ROCm runtime, and uv caches the download
# so other projects can reuse it.  HIP_VISIBLE_DEVICES=0 in config.fish keeps
# torch off the iGPU.
mkdir -p ~/workspace/pytorch
cd ~/workspace/pytorch
uv venv
uv pip install torch torchvision --index-url https://download.pytorch.org/whl/rocm7.1
.venv/bin/python ~/dotfiles/pytorch_test.py \
    || echo "GPU test failed; log out and back in for the render/video groups, then retry"

# Local LLMs.  Ubuntu's llama.cpp, with its HIP backend built against the same
# ROCm packages as above.  Try e.g. gemma4:26b or gpt-oss:20b at Q4_K_M, which
# fit in the 7900 XT's 20GB:
#   llama-server -hf <org>/<model>-GGUF:Q4_K_M --port 8080
#
#   llama-server -hf ggml-org/gpt-oss-20b-GGUF:MXFP4 --port 8080
#   then
#   llama-cli -hf ggml-org/gpt-oss-20b-GGUF:MXFP4
# HIP_VISIBLE_DEVICES=0 in config.fish keeps it off the iGPU when run from a
# shell; set it in /etc/default/llama-server if using the systemd service.
sudo apt install -y llama.cpp libggml0-backend-hip

echo "Remember to disable GPU accelerated rendering for steam under settings-> interface"
echo "Log out and back in for the render/video group changes to take effect"
