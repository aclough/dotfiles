#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
docker-compose up -d

time docker-compose exec rightpick ./rightpick/software/build.sh build -i
