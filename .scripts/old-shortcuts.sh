#!/bin/bash

# Older version of Luke Smith's current https://github.com/LukeSmithxyz/voidrice/blob/76f7656cb2b47e6d21a52b50c285092162872fd4/.local/bin/shortcuts script
# Just chose to use this one for the time being since I understand whats happening in it.

# Config locations
folders="$HOME/.scripts/folders"
configs="$HOME/.scripts/configs"

# Output locations
shell_shortcuts="$HOME/.bash-aliases"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"
qute_shortcuts="$HOME/.config/qutebrowser/shortcuts.py"

# Shell rc file (i.e. bash vs. zsh, etc.)
shellrc="$HOME/.bashrc-personal"

# Remove
rm -f $shell_shortcuts

# Ensuring that output locations are properly sourced
(grep "source ~/.bash-aliases"  $shellrc)>/dev/null || echo "source ~/.bash-aliases" >> $shellrc

# directory shortcuts
sed "s/\s*#.*//g" "${folders}" | sed "/^$/d" | awk '{print "alias "$1"=\"cd "$2" && ls -art\""}' >> $shell_shortcuts

# dotfile shortcuts
sed "s/\s*#.*//g" "${configs}" | sed "/^$/d" | awk '{print "alias "$1"=\"$EDITOR "$2"\""}' >> $shell_shortcuts
