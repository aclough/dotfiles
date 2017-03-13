#!/bin/bash
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_aardvark.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eurosort.json
rm /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
~/rhr/pick/software/build.sh build
