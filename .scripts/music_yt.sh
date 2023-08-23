#!/usr/bin/env bash

# Simple script that I used to download music from Youtube as .m4a files
# TODO: Add some kind of check at the end so duplicates don't get added to the file, could take some inspiration from tmux-sessionizer script.

# Location for YT video JSON data
metadata="/tmp/music_yt_metadata"

# Get the youtube video URL from clipboard using xsel
URL=$(xsel -b -o)

# Using one yt-dlp command I can get the title of the video and download it all at once
# https://stackoverflow.com/questions/47096751/get-youtube-video-title-while-video-downloading
# And finally the notification is sent only after the song has finished downloading. So I don't have to be wondering if its done yet.
yt-dlp -o "~/Music/Downloads/convert_to_mp3/%(title)s.%(ext)s" -f 140 --print-json --no-warnings "$URL" > $metadata && \
    song_title=$(jq -r ".title" "${metadata}") && \
    notify-send "Downloaded: ${song_title}.m4a" -u normal

# Store the links of Music that got downloaded using this script to a file in home directory
echo "$(date) -- ${song_title}: $URL" >> /home/leosmith/songs_downloads.txt
