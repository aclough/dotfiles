#!/bin/bash

set -e

unset PYTHONPATH

~/rhr/pick/software/build.sh build -i
~/rhr/pick/software/build.sh lint
