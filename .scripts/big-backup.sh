#!/usr/bin/env bash

# Simple Script that backs up valuable files to Drive.
rclone copy -v "$HOME/Downloads/tabssaver_data.tsd" "GDrive-Text:Valuables"
