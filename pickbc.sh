#!/bin/bash

set -e
unset PYTHONPATH

rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_abba_full_pallet.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_abba_half_pallet.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_chappie.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_distrisort.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eyehand.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_julia.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_modex_abba.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_theopolis.json
~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh runtests
