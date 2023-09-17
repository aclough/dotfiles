#!/bin/bash

set -e

cd ~/workspace
FILENAME=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/$FILENAME
if [ (sha256sum $FILENAME) = 75967bc2113d9e336e670e1e557c9198d8b98e59fb9adb82cbe0e71ce5f7c2db]
    bash $FILENAME -b -u -p ~/workspace/anaconda3
    rm $FILENAME
end
