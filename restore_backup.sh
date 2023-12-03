#!/bin/bash

# Note: Config at /home/aclough/.config/rclone/rclone.conf"
#
#

echo "Restoring Documents"
rclone copy gdrive:backup/Documents ~/Documents
echo "Restoring Pictures"
rclone copy gdrive:backup/Pictures ~/Pictures
echo "Restoring Music"
rclone copy gdrive:backup/Music ~/Music
echo "Restoring Videos"
rclone copy gdrive:backup/Videos ~/Videos
echo "Restoring Calibre library"
rclone copy gdrive:backup/Calibre\ Library ~/Calibre\ Library
