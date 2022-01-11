#!/usr/bin/env bash

# Simple dmenu script that takes a youtube video link and opens it up in mpv, just for the times where you don't want to
# have to open up a terminal.

if [ -f $HOME/.dmenurc ]; then
    . $HOME/.dmenurc
else
    DMENU='dmenu -i'
fi

# TODO: Add the different resolution options and options for playlists as well.
# Choose what resolution to play the video in

# Using a weird method to launch an empty dmenu prompt.
link="$($DMENU -p "Link: " < ~/.scripts/WIP)"
mpv --ytdl-format=22 "$link" &> /dev/null
