#!/usr/bin/env bash

if [ -f ~/.dmenurc ]; then
    . ~/.dmenurc
else
    DMENU='dmenu -i'
fi

dmenu_run
