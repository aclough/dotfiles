#!/bin/bash

set -e
unset PYTHONPATH

find /home/aclough/rhr/pick/build/deploy/config -type f -delete
~/rhr/pick/software/build.sh build
if [ ! $1 ]
then
    pickt.sh
fi
