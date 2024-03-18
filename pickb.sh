#!/bin/bash

set -euo pipefail

cd ~/rhr/pick

docker compose up -d
docker compose exec rightpick bash -c '[[ $(stat -c %U /home/rhr/.config) == root ]] && sudo chown rhr:rhr /home/rhr/.config || true'
time docker compose exec rightpick ./rightpick/software/build.sh build -i
