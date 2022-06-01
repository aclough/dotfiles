#!/bin/bash

set -euo pipefail

cd $RIGHTPICK_ROOT
./scripts/lcm-tunnel $1
