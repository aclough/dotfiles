#!/bin/bash
# Workspace-style tag cycling for river, emulating xmonad's CycleWS.
#
# river has tags rather than numbered workspaces and no "next tag" command,
# so we remember the current tag index in a state file. All tag bindings in
# river_init go through this script to keep that file in sync. Clicking tags
# in a bar bypasses it, in which case the next prev/next will start from the
# last tag selected via the keyboard.
#
# usage: river-tags.sh view|shift|shiftview  N|next|prev

set -euo pipefail

NTAGS=9
STATE=${XDG_RUNTIME_DIR:-/tmp}/river-current-tag

action=$1
target=$2

current=1
[ -r "$STATE" ] && current=$(<"$STATE")

case "$target" in
    next) new=$(( current % NTAGS + 1 )) ;;
    prev) new=$(( (current + NTAGS - 2) % NTAGS + 1 )) ;;
    *)    new=$target ;;
esac

mask=$(( 1 << (new - 1) ))

case "$action" in
    view)
        riverctl set-focused-tags "$mask"
        ;;
    shift)
        riverctl set-view-tags "$mask"
        exit 0  # focus stays where it is, so don't update the state
        ;;
    shiftview)
        riverctl set-view-tags "$mask"
        riverctl set-focused-tags "$mask"
        ;;
    *)
        echo "unknown action: $action" >&2
        exit 1
        ;;
esac

echo "$new" > "$STATE"
