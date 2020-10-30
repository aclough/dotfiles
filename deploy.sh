#!/bin/sh

set -e


rsync --partial ~/rhr/pick/build/deploy rhr@$1:/home/rhr/aclough/build/deploy
