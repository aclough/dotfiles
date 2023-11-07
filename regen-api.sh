#!/bin/bash

set -euo pipefail

pickb.sh
docker-compose exec rightpick generate-station-server-spec
docker-compose exec rightpick ./rightpick/software/api/python/multibot/tools/generate_station_server_code.sh ~/swagger-codegen
