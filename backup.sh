#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"

echo "Backing up Wallapers"
rclone copy -P ~/Pictures/Wallpapers gdrive:backup/Pictures/Wallpapers --update
