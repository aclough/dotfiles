#!/bin/bash
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_aardvark.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eurosort.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_accutech.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_promat.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames.json
~/rhr/pick/software/build.sh build
