#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
docker compose up -d

docker compose exec rightpick ./rightpick/scripts/lcm-tunnel "$1"
