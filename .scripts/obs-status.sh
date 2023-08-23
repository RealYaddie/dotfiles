#!/usr/bin/env bash

# Description: A simple script that uses obs-cli-lefac to get the recording status of OBS and sends a notification using notify-send
# to send a message, that states whether the recording is RECORDING, PAUSED or if we're not recordig at all.

# TODO: Try and improve the script whether that be to use something other than notify-send, to replace the one notification
#      instead of sending multiple notifications and filling up the entire right side of the screen.
#NOTE: Probably won't have to do ^ that, it might be better to just make a cron job to run this every 15-20 secs while active.

# TODO: Read up on the obs-cli tool and figure out if it might be better to use it directly to get rstatus & pstatus, instead of using sed and awk.
#       Got this working, but the script actually takes a bit longer to run now sure if I should continue like this or use the sed and awk methods.

# TODO: Make the script send some additional info in the notification such as the: The Recording time, If the main video source is visible, and also if the audio is being recorded properly. <10-11-21> #

# Saving the obs-cli output to a variable
# result="$(obs-cli-leafac GetRecordingStatus -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)")"
# status="$(obs-cli-leafac GetRecordingStatus -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" |& sed -e 's/[ ",]//g' -e '/[][{}]/d' | head -n1 | cut -f2 -d ":")"

# Password file for OBS Websocket
key=/home/leosmith/.config/key_obs.txt
# Get the recording status
rstatus=$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.isRecording GetRecordingStatus)
# Get the current recording time
rec_time=$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.recordTimecode GetRecordingStatus)

# Is the recording currently paused or not?
pstatus=$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.isRecordingPaused GetRecordingStatus)

# Info from Sources
# Video - true for Video sources mean the source is visible
browser_full="$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.sourceActive GetSourceActive='{ "sourceName": "Browser(Brave Full)"}')"
browser_win="$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.sourceActive GetSourceActive='{ "sourceName": "Browser(Brave Normal)"}')"

# Audio
desktop_audio="$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.sourceActive GetSourceActive='{ "sourceName": "Desktop Audio"}')"
mic_audio="$(obs-cli-leafac -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)" --field 0.sourceActive GetSourceActive='{ "sourceName": "Mic/Aux"}')"

# Multi-line text for notify-send
# recording="$(echo -e "RECORDING!!\nRECORDING TIME: $rec_time\n1 - BROWSER(BRAVE FULL): $browser_full\n2 - BROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"
# paused="$(echo -e "RECORDING PAUSED!!\nRECORDING TIME: $rec_time\nBROWSER(BRAVE FULL): $browser_full\nBROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"
# not_rec="$(echo -e "NOT RECORDING!!\nBROWSER(BRAVE FULL): $browser_full\nBROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"

recording="$(echo -e "RECORDING TIME: $rec_time\n1 - BROWSER(BRAVE FULL): $browser_full\n2 - BROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"
paused="$(echo -e "RECORDING TIME: $rec_time\n1 - BROWSER(BRAVE FULL): $browser_full\n2 - BROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"
not_rec="$(echo -e "1 - BROWSER(BRAVE FULL): $browser_full\n1 - BROWSER(BRAVE NORMAL): $browser_win\nDESKTOP AUDIO: $desktop_audio\nMIC/AUX AUDIO: $mic_audio")"


if [[ "${rstatus}" == "true" && "${pstatus}" == "false" ]]; then
    notify-send "RECORDING!!" "${recording}" -u normal -i obs-tray-active
elif [[ "${pstatus}" == "true" && "${rstatus}" == "true" ]]; then
    notify-send "PAUSED!!" "${paused}" -u normal -i media-playback-paused
elif [[   "${pstatus}" == "false" && "${rstatus}" == "false"  ]]; then
    notify-send "NOT RECORDING!!" "${not_rec}" -u normal -i obs-tray
else
    notify-send "OBS NOT OPEN, NOT RECORDING!!" -u normal -i account-types-closed
fi
