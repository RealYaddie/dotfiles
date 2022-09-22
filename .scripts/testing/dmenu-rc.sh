#!/usr/bin/env bash

if [ -f $HOME/.dmenurc ]; then
    . $HOME/.dmenurc
else
    DMENU='dmenu -i'
fi


directory="$HOME/Desktop/CMU Docs/Year 3 Semester 1(21-22)/Quick Launch"
prompt="$(find "$directory" -maxdepth 1 -name '*.desktop' | sed -e 's#^/h.*Launch/##g' -e 's#[.]desktop$##g' | $DMENU -l 20)"

echo "$prompt"
