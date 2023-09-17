#!/bin/bash

set -e

cd ~/workspace
wget https://repo.continuum.io/archive/Anaconda3-2023.07-2-Linux-x86_64.sh
if [ (sha256sum Anaconda3-2023.07-2-Linux-x86_64.sh) = 75967bc2113d9e336e670e1e557c9198d8b98e59fb9adb82cbe0e71ce5f7c2db]
    bash Anaconda3-2023.07-2-Linux-x86_64.sh
    rm Anaconda3-2023.07-2-Linux-x86_64.sh
end
