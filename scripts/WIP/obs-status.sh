#!/usr/bin/env bash

#Author: Leo
#Descriptiom: A simple script that uses obs-cli-lefac to get the recording status of OBS and sends a notification using notify-send
# to send a message, that states whether the recording is RECORDING, PAUSED or if we're not recordig at all.

#TODO: Try and improve the script whether that be to use something other than notify-send, to replace the one notification
#      instead of sending multiple notifications and filling up the entire right side of the screen.

#TODO: Add an option that specifically states that you're not recording because OBS is closed different from when we're actually not recording.

# Saving the obs-cli output to a variable
result="$(obs-cli-leafac GetRecordingStatus -a "localhost:4444" -p "$(cat /home/leosmith/obs-testing/pass.txt)")"

# Get the recording status
# rstatus=$(cat recording | sed -e 's/[ ",]//g' -e '/[][{}]/d' | awk -F ":" '/isRecording:/ {print $2}')
rstatus=$(echo "$result"| sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n1 | cut -f2 -d ":")

# Is the recording currently paused or not?
pstatus=$(echo "$result" | sed -e 's/[ ",]//g' -e '/[][{}]/d' | awk -F ":" '/isRecordingPaused/ {print $2}')
# pstatus=$(cat recording | sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n2)
# echo "${rstatus}" "${pstatus}"

if [[ "${rstatus}" == "true" && "${pstatus}" == "false" ]]; then
    notify-send "RECORDING" -u normal -i obs
elif [[ "${pstatus}" == "true" ]]; then
    notify-send "PAUSED" -u normal -i obs
else
    notify-send "NOT RECORDING" -u normal -i obs
fi

# echo isRecording: "$rstatus"
# echo isRecordingPaused: "$pstatus"
# echo "$([ "${rstatus}" == "true" ])"
