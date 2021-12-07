#!/bin/bash

# Description: A script that'll take whatever is typed into it and put it in the default terminal and run it.
# It can spawn a whole new terminal or make a new tmux window in the 'General' session.

# $(cat ~/.bash_history | dmenu -l 20)

# echo "" |dmenu -p "Run:" | xargs -I {} alacritty -e "{}" --hold
echo "" | dmenu | sh
