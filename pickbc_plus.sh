#!/bin/bash

set -e

sudo service memcachedb restart
npm update

cd ~/rhr/pick
rm -r build/*

~/rhr/pick/software/build.sh build
