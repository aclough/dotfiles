#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Restoring Documents"
rclone sync -P gdrive:backup/Documents ~/Documents
echo "Restoring Pictures"
rclone sync -P gdrive:backup/Pictures ~/Pictures
echo "Restoring Music"
rclone sync -P gdrive:backup/Music ~/Music
echo "Restoring Videos"
rclone sync -P gdrive:backup/Videos ~/Videos
echo "Restoring Calibre library"
rclone sync -P gdrive:backup/Calibre\ Library ~/Calibre\ Library
