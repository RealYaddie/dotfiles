#!/usr/bin/env bash

# Descriptiom: A simple script that uses obs-cli-lefac to get the recording status of OBS and sends a notification using notify-send
# to send a message, that states whether the recording is RECORDING, PAUSED or if we're not recordig at all.

#TODO: Try and improve the script whether that be to use something other than notify-send, to replace the one notification
#      instead of sending multiple notifications and filling up the entire right side of the screen.
#NOTE: Probably won't have to do ^ that, it might be better to just make a cron job to run this every 15-20 secs while active.

# Saving the obs-cli output to a variable
result="$(obs-cli-leafac GetRecordingStatus -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)")"
# status="$(obs-cli-leafac GetRecordingStatus -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" |& sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n1 | cut -f2 -d ":")"

# Get the recording status
# rstatus=$(echo "$result" | sed -e 's/[ ",]//g' -e '/[][{}]/d' | awk -F ":" '/isRecording:/ {print $2}')
rstatus=$(echo "$result"| sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n1 | cut -f2 -d ":")

# Is the recording currently paused or not?
pstatus=$(echo "$result" | sed -e 's/[ ",]//g' -e '/[][{}]/d' | awk -F ":" '/isRecordingPaused/ {print $2}')
# pstatus=$(cat recording | sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n2)
# echo "${rstatus}" "${pstatus}"


if [[ "${rstatus}" == "true" && "${pstatus}" == "false" ]]; then
    notify-send "RECORDING." -u normal -i obs-tray-active
elif [[ "${pstatus}" == "true" && "${rstatus}" == "true" ]]; then
    notify-send "PAUSED." -u normal -i media-playback-paused
elif [[   "${pstatus}" == "false" && "${rstatus}" == "false"  ]]; then
    notify-send "NOT RECORDING!!" -u normal -i obs-tray
else
    notify-send "OBS NOT OPEN, NOT RECORDING!!" -u normal -i account-types-closed
fi
