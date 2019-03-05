#!/bin/bash

set -e
unset PYTHONPATH

rm -f /home/aclough/rhr/pick/build/deploy/config/arm_links.json
rm -f /home/aclough/rhr/pick/build/deploy/config/default_planner_parameters.json
rm -f /home/aclough/rhr/pick/build/deploy/config/default_workspace_obstacles.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_abba_full_pallet.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_abba_full_pallet_ur10e.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_abba_half_pallet.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_bishop.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_bender.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_chappie.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_distrisort.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_eyehand.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_hbc.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_julia.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_johnny5.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_mission_control_tests.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_mission_control_zone_mapping_test.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_mission_example_tests.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_modex_abba.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_sam.json
rm -f /home/aclough/rhr/pick/build/deploy/config/coordinate_frames_theopolis.json
~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh runtests
