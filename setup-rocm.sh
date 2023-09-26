#!/bin/bash
# See https://medium.com/@ttio2tech_28094/rocm-v5-4-2-installation-guide-for-amd-gpu-in-early-2023-8f5b3933d1d6
# Actually
# https://rocm.docs.amd.com/en/latest/deploy/linux/quick_start.html

set -e


sudo mkdir --parents --mode=0755 /etc/apt/keyrings
wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null

sudo tee /etc/apt/sources.list.d/amdgpu.list <<'EOF'
deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/amdgpu/latest/ubuntu jammy main
EOF

sudo tee /etc/apt/sources.list.d/rocm.list <<'EOF'
deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/debian jammy main
EOF

echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' | sudo tee /etc/apt/preferences.d/rocm-pin-600

sudo apt update
sudo apt install amdgpu-dkms rocm-hip-libraries
￼

# pip3 install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm5.6
