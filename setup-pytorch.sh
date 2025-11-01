#!/bin/bash
#
#From https://rocm.docs.amd.com/projects/radeon/en/latest/docs/install/install-pytorch.html

set -e

sudo usermod -aG render,video $USER

sudo apt install environment-modules

# Make the directory if it doesn't exist yet.
# This location is recommended by the distribution maintainers.
sudo mkdir --parents --mode=0755 /etc/apt/keyrings

# Download the key, convert the signing-key to a full
# keyring required by apt and store in the keyring directory
wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/rocm.gpg > /dev/null

sudo tee /etc/apt/sources.list.d/rocm.list << EOF
deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/7.1 noble main
deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/graphics/7.1/ubuntu noble main
EOF

sudo tee /etc/apt/preferences.d/rocm-pin-600 << EOF
Package: *
Pin: release o=repo.radeon.com
Pin-Priority: 600
EOF

sudo apt update
sudo apt install rocm
￼
# Kernel modules and drivers
sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo apt install amdgpu-dkms


# Configure ROCm shared objects
sudo tee --append /etc/ld.so.conf.d/rocm.conf <<EOF
/opt/rocm/lib
/opt/rocm/lib64
EOF
sudo ldconfig

# Set library path (crucial for multi-version installs)
export LD_LIBRARY_PATH=/opt/rocm-7.0.0/lib

# Install OpenCL runtime
sudo apt install rocm-opencl-runtime

uv venv
source .venv/bin/activate
# This will be cached and almost instant when run on future projects
uv pip install torch torchvision --find-links https://repo.radeon.com/rocm/manylinux/rocm-rel-7.1/
