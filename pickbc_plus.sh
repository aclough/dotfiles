#!/bin/bash

set -e
unset PYTHONPATH

sudo service memcachedb restart

rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_aardvark.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eyehand.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eurosort.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_accutech.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_promat.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_julia.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_twoeyes.json

cd ~/rhr/pick
rm -r build/*

~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh build julia
~/rhr/pick/software/build.sh runtests
