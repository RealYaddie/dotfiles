#!/usr/bin/env bash

# Menu with options that will be displayed in a rofi/dmenu prompt
function menu(){
    printf "1. Drive Uni Stuff Folder\n"
    printf "2. Drive Misc Folder\n"
    printf "3. Drive Helpful Documents Folder\n"
    printf "4. Unmount All"
}

# Capturing the selected option and storing it in the choice variable.
choice=$(menu | rofi -dmenu | cut -d. -f1 )
echo $choice
