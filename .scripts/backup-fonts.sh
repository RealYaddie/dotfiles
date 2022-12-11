#!/usr/bin/env bash

dir="/home/leosmith/.fonts"
zip_name="/home/leosmith/fonts.zip"

zip -r "$zip_name" "$dir" && rclone copy -v "$zip_name" "GDrive-Text:Misc/ Fonts"
rm "$zip_name"
