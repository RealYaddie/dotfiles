#!/usr/bin/env bash

session_name="General"
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$session_name" -c $HOME -n "TODO" "sncli --key=65a573bda4774808bf65bea6df2adebe edit"
    exit 0
fi

if ! tmux has-session -t "$session_name" 2> /dev/null; then
    tmux new-session -ds "$session_name" -n -c $HOME "TODO" "sncli --key=65a573bda4774808bf65bea6df2adebe edit"
fi

tmux switch-client -t "$selected_name"
