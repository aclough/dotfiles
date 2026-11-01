#!/bin/bash
# Screenshot to ~/workspace like my old scrot bindings.
# Usage: screenshot.sh [full|region|window]   (window needs Hyprland)
set -e
out=~/workspace/"Screenshot_from_$(date +'%Y-%m-%d %H-%M-%S').png"
case "${1:-full}" in
    full)   grim "$out" ;;
    region) grim -g "$(slurp)" "$out" ;;
    window) grim -g "$(hyprctl -j activewindow | python3 -c '
import json, sys
w = json.load(sys.stdin)
print("%d,%d %dx%d" % (w["at"][0], w["at"][1], w["size"][0], w["size"][1]))')" "$out" ;;
    *) echo "usage: $0 [full|region|window]" >&2; exit 1 ;;
esac
wl-copy < "$out"
