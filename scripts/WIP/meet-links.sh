#!/usr/bin/env bash

# DESCRIPTION: Simple dmenu prompt that will display all my class and club google meet links and on selecting one it'll launch it in default browser.

#TODO: Figure out how to "pretty" up the output that is passed to dmenu so that the entire path isn't showing.
#TODO: Figure out how to source dmenurc and use the settings from there in this script, so dmenu looks the same everywhere.

# The Directory with all the Quick launch links for year 3
directory="$HOME/Desktop/CMU Docs/Year 3 Semester 1(21-22)/Quick Launch"

# choice="$(ls "$directory/"*.desktop* | sed 's/[.]desktop//' | dmenu -l 20)"

# Finds all desktop links in the directory and lists them out in a dmenu prompt
# choice="$(find "$directory" -maxdepth 1 -name '*.desktop'| sed 's#^/h.*Launch$##' | dmenu -i -l 20)"
# choice="$(find "$directory" -maxdepth 1 -name '*.desktop' | sed -e 's#^/h.*Launch/##g' -e 's#[.]desktop$##g' | dmenu -i -l 20)"
prompt="$(find "$directory" -maxdepth 1 -name '*.desktop' | sed -e 's#^/h.*Launch/##g' -e 's#[.]desktop$##g' | dmenu -i -l 20)"
choice="$(echo $directory/$prompt.desktop)"

# prompt="$(echo "$choice" | sed 's#^/h.*Launch/##g' | dmenu -i -l 20)"

# Grab only the link from the option that was chosen.
# link=$( awk '/.*https.*/ {print $0}' "$choice" | sed 's/^URL=//' | xargs -r -I{} brave "{}")
link=$( awk '/.*https.*/ {print $0}' "$choice" | sed 's/^URL=//')

# xargs -I{} brave "{}"
# brave "$link"
echo "The link is:"
echo $link
# echo "The directory is "$directory
# echo "The choice is "$choice
echo ""
echo "The choice is:"
echo $choice
echo ""
echo "Output from prompt is:"
echo $prompt
