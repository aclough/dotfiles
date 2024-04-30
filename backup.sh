#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
# To convert webps, dwebp Filename.webp -o Filename.jpg

echo "Backing up Wallapers"
rclone copy -P ~/Pictures/Wallpapers gdrive:backup/Pictures/Wallpapers --update
