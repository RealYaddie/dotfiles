#!/usr/bin/env bash

# Description: Simple script for mounting some of my most frequently used remote mounts using rclone.
# Inspiried by: Carbon's https://github.com/Carbon-Bl4ck/Rofi-Beats script and OTB's https://gitlab.com/OldTechBloke/rofi-edit script.

#TODO: Maybe try and put in a test somewhere that'll unmount the mount if its already mounted, so that you wouldn't have to
# make another script just to unmount the mounts.

#TODO: Try and figure out some way that we can get the name of whatever option was chosen, so that I can use it in the notification function
# so I know what exactly got mounted without having to check.
# Whether that be through replacing the entire menu func with an array or something.

# Menu with options that will be displayed in a rofi/dmenu prompt
function menu(){
    printf "1. Drive Uni Stuff Folder\n"
    printf "2. Drive Misc Folder\n"
    printf "3. Drive Helpful Documents Folder\n"
    printf "4. Unmount All"
}

# Capturing the selected option and storing it in the choice variable.
# choice=$(menu | dmenu -i -l 20 | cut -d. -f1 )
choice=$(menu | rofi -dmenu | cut -d. -f1 )

function notification(){
    if [[ $choice -eq 4 ]]; then
        notify-send "Unmounted All Drives."
    else
        notify-send "Remote folder Mounted."
    fi
}

function main() {
    # choice=$(menu | dmenu -i -l 20 | cut -d . -f1 )

    case $choice in
        1)
            # notification ; $terminal -e sh -c "sleep 0.2; rclone --vfs-cache-mode writes mount GDrive-Text:Uni\ Stuff ~/Mounts/Drive\ Uni\ Stuff/ &"
            notification ; sleep 0.2 ; rclone --vfs-cache-mode writes mount GDrive-Text:Uni\ Stuff ~/Mounts/Drive\ Uni\ Stuff/ &
            # echo "$choice"
            ;;
        2)
            # notification ; $terminal -e sh -c "sleep 0.2 ; rclone --vfs-cache-mode writes mount GDrive-Text:Misc ~/Mounts/Drive\ Misc/ &"
            notification ; sleep 0.2 ; rclone --vfs-cache-mode writes mount GDrive-Text:Misc ~/Mounts/Drive\ Misc/ &
            # echo "$choice"
            ;;
        3)
            notification ; sleep 0.2 ; rclone --vfs-cache-mode writes mount GDrive-Text:Helpful\ Docs ~/Mounts/Drive\ Helpful\ Docs/ &
            # echo $choice
            ;;
        4)
            notification ; sleep 0.2 ; fusermount -u ~/Mounts/Drive\ Misc/ && fusermount -u ~/Mounts/Drive\ Uni\ Stuff/ && fusermount -u ~/Mounts/Drive\ Helpful\ Docs/
            # echo $choice
            ;;
    esac
}

main
