#!/usr/bin/env bash

# Simple dmenu script that takes a youtube video link and opens it up in mpv, just for the times where you don't want to
# have to open up a terminal.

# TODO: Add the different resolution options and options for playlists as well.
#       Choose what resolution to play the video in

# Grab the YT video URL from the clipboard with xsel
URL=$(xsel -b -o)

# Get the video title
title=$(curl -s "${URL}" | grep -Eo "<title>.*</title>" | sed "s/<title>//g; s/<\/title>//g; s/ - YouTube$//g")

# Send notification and then send URL to MPV
notify-send "Playing: $title" -u normal && mpv --ytdl-format=22 "$URL"

# Store the links of videos played using this script to a file in my home directory
echo "[720P]$(date) -- $title: $URL" >> /home/leosmith/mdmenu-links.txt
