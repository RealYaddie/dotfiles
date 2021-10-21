#!/usr/bin/env bash

# DESCRIPTION: Simple dmenu prompt that will display all my class and club google meet links and on selecting one it'll launch it in default browser.

#TODO: Figure out how to "pretty" up the output that is passed to dmenu so that the entire path isn't showing.
#TODO: Figure out how to source dmenurc and use the settings from there in this script, so dmenu looks the same everywhere.

# The Directory with all the Quick launch links for year 3
directory="$HOME/Desktop/CMU Docs/Year 3 Semester 1(21-22)/Quick Launch"

# choice="$(ls "$directory/"*.desktop* | sed 's/[.]desktop//' | dmenu -l 20)"

# Finds all desktop links in the directory and lists them out in a dmenu prompt
choice="$(find "$directory" -maxdepth 1 -name '*.desktop'| dmenu -i -l 20)"

# Grab only the link from the option that was chosen.
link=$( awk '/.*https.*/ {print $0}' "$choice" | sed 's/^URL=//' | xargs -r -I{} brave "{}")

# xargs -I{} brave "{}"
# brave "$link"
# echo $link
# echo $choice
