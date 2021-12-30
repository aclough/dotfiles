#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
pickb.sh
generate-station-server-spec
software/api/python/multibot/tools/generate_station_server_code.sh ~/rhr/swagger-codegen
