#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Restoring Documents"
rclone copy -P gdrive:backup/Documents ~/Documents --update
echo "Restoring Pictures"
rclone copy -P gdrive:backup/Pictures ~/Pictures --update
echo "Restoring Music"
rclone copy -P gdrive:backup/Music ~/Music --update
echo "Restoring Videos"
rclone copy -P gdrive:backup/Videos ~/Videos --update
echo "Restoring Calibre library"
rclone copy -P gdrive:backup/Calibre\ Library ~/Calibre\ Library --update
