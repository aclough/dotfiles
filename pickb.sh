#!/bin/bash

set -euo pipefail

docker-compose up -d

cd $RIGHTPICK_ROOT
./software/build.sh build
