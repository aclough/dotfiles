#!/bin/bash

set -euo pipefail

cd ~/rhr/pick

cp -r ~/workspace/flir_venv build

docker-compose up -d
time docker-compose exec rightpick ./rightpick/software/build.sh build -i
