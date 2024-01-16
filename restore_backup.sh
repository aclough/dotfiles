#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"

echo "Restoring Wallpapers"
rclone copy -P gdrive:backup/Pictures/Wallpapers ~/Pictures/Wallpapers --update
