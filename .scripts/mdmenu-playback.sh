#!/usr/bin/env bash

# Simple script that gives the option to load videos that were already played using the mdmenu script.

if [ -f $HOME/.dmenurc ]; then
    . $HOME/.dmenurc
else
    DMENU='dmenu -i'
fi

choice="$($DMENU -l 20 < $HOME/mdmenu-links.txt)"
echo "$choice"
