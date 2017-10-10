#!/bin/bash

set -e

~/rhr/pick/software/build.sh build
~/rhr/pick/software/build.sh runtests
