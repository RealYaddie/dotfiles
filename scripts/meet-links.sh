#!/usr/bin/env bash

# DESCRIPTION: Simple dmenu prompt that will display all my class and club google meet links and on selecting one it'll launch it in default browser.

#TODO: Figure out how to source dmenurc and use the settings from there in this script, so dmenu looks the same everywhere.

# The Directory with all the Quick launch links for year 3
directory="$HOME/Desktop/CMU Docs/Year 3 Semester 1(21-22)/Quick Launch"

# Finds all desktop links in the directory and lists them out in a dmenu prompt with the full path and .desktop extension removed in the dmenu prompt
prompt="$(find "$directory" -maxdepth 1 -name '*.desktop' | sed -e 's#^/h.*Launch/##g' -e 's#[.]desktop$##g' | dmenu -i -l 20)"

# Adds the full path and the .desktop extension to whatever option was chosen from the dmenu prompt.
choice="$(echo $directory/$prompt.desktop)"

# Grab only the link from the option that was chosen.
link=$( awk '/.*https.*/ {print $0}' "$choice" | sed 's/^URL=//' | xargs -r -I{} brave "{}")
