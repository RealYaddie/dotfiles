#!/bin/bash

# $(cat ~/.bash_history | dmenu -l 20)

# echo "" |dmenu -p "Run:" | xargs -I {} alacritty -e "{}" --hold
echo "" | dmenu | sh
