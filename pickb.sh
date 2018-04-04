#!/bin/bash

set -e

~/rhr/pick/software/build.sh build -i
~/rhr/pick/software/build.sh runtests
