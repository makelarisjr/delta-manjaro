#!/bin/bash
DATE=$(date +%d-%m-%y_%H_%M_%S) 
DIR="/home/makelarisjr/Pictures/Screenshots/$DATE.png"
spectacle -br -o $DIR 
if [ -f "$DIR" ]; 
then
    echo "Uploading screenshot..."
    URL=$(curl --upload-file $DIR https://grab.codingslime.eu/api/upload 2>/dev/null)
    if [ -z "$URL" ];
    then
        echo "Failed"
        xclip -sel clip -t image/png -i $DIR
        notify-send --app-name "SlimeGrab" "Screenshot Copied" "Screenshot copied to clipboard"
        exit 1
    fi
    echo "Copying URL to clipboard..."
    echo "$URL" | xclip -sel clip
    echo "Sending notification..."
    notify-send --app-name "SlimeGrab" "Screenshot Uploaded" "URL copied to clipboard"
fi