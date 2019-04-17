#!/bin/bash

set -e
unset PYTHONPATH

sudo service memcachedb restart

rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_*

cd ~/rhr/pick
rm -r build/*

~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh build julia
~/rhr/pick/software/build.sh runtests
