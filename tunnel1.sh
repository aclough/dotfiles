#!/bin/bash

set -euo pipefail

echo "Syncing machine.yaml"
scp rhr@"$1":/configuration/rightpick/machine.yaml /configuration/rightpick/machine.yaml

echo "Starting tunnel"
bounce --rhr --tunnel "$1"
