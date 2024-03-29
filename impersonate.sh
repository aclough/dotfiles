#!/bin/bash

set -euo pipefail

cd ~/rhr/pick
rm -rf ./default_rightpick_configuration/*
rsync  -raluhP ${1}:/configuration/rightpick/* ./default_rightpick_configuration
