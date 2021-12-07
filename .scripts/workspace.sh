#! /bin/bash
st &
wait
midori &
wait
wmctrl -i -r st -t 2
wmctrl -i -r midori -t 3
