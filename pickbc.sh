#!/bin/bash

set -e

rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_aardvark.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eyehand.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eurosort.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_accutech.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_promat.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_julia.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_twoeyes.json
~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh runtests
