#!/bin/bash

set -e

find /home/aclough/rhr/pick/build/deploy/config -type f -delete
~/rhr/pick/software/build.sh build
