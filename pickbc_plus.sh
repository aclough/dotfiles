#!/bin/bash

set -e

sudo service memcachedb restart

cd ~/rhr/pick
rm -r build/*

~/rhr/pick/software/build.sh build
