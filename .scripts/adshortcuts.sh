#!/usr/bin/env bash

# variable with ls and various flags to add just before the end of the alias.
list="&& ls -art --group-dirs first"

/home/leosmith/.flyff05-wine-stable/drive_c/Program Files/Roots Flyff
# Script to add specific directories that have spaces in them to ~/.bash-aliases
echo -e "y3=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\) $list\" \\
ql=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Quick\ Launch $list\" \\
cnc=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Computer\ Networks\ and\ Communication\ Systems $list\" \\
em=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Engineering\ Mathematics\ I $list\" \\
ie=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Industrial\ Electronics $list\" \\
mce=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Microcontrollers\ and\ Embedded\ Systems $list\" \\
he=\"cd $HOME/Helpful\ Stuff $list\" \\
stfd=\"cd $HOME/Stuff\ To\ Do $list\" \\
zinb=\"cd $HOME/Text/Zim\ Notebooks $list\" \\
insf=\"cd $HOME/.flyff05-wine-stable/drive_c/Program\ Files/Insanity\ Client $list\" \\
btrf=\"cd /home/leosmith/.flyff05-wine-stable/drive_c/Program\ Files/Roots\ Flyff $list\" \\">> ~/.bash-aliases
