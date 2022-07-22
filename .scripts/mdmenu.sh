#!/usr/bin/env bash

# Simple dmenu script that takes a youtube video link and opens it up in mpv, just for the times where you don't want to
# have to open up a terminal.

if [ -f $HOME/.dmenurc ]; then
    . $HOME/.dmenurc
else
    DMENU='dmenu -i'
fi

# TODO: Add the different resolution options and options for playlists as well.
#       Choose what resolution to play the video in

# Using a weird method to launch an empty dmenu prompt
# old_link="$($DMENU -p "Video Link: " < ~/.scripts/WIP)"

# Using xclip to send link directly to mpv
# mpv "$(xclip -out)" &> /dev/null &
notify-send "Link Copied to MPV" -u normal && mpv "$(xclip -out)"
# notify-send "Link Copied to MPV" -u normal
# mpv "$(xclip -out)"

# Store the links of videos played using this script to a file in my home directory
echo "$(date): $(xclip -out)" >> ~/mdmenu-links.txt
