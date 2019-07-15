#!/bin/bash

set -e
unset PYTHONPATH

rm -f /home/aclough/rhr/pick/build/deploy/config/arm_links.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_*
rm -f /home/aclough/rhr/pick/build/deploy/config/*planner_parameters.json
rm -f /home/aclough/rhr/pick/build/deploy/config/default_*
~/rhr/pick/software/build.sh build
if [ ! $1 ]
then
    ~/rhr/pick/software/build.sh runtests
fi
