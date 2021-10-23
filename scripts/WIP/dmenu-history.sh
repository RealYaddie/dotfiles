#!/bin/bash

# Description: A simple script that displays your bash history in a dmenu prompt and when you choose an option it gets ran in the terminal.
# (Not sure as yet if I want it to spawn a whole new terminal or to just make a new tmux window in the 'General' session)

# $(cat ~/.bash_history | dmenu -l 20)

# echo "" |dmenu -p "Run:" | xargs -I {} alacritty -e "{}" --hold
echo "" | dmenu | sh
