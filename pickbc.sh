#!/bin/bash

set -e

rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_chappie.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_distrisort.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eyehand.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_julia.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_promat.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_theopolis.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_twoeyes.json
~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh runtests
