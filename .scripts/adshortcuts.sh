#!/usr/bin/env bash

# Script to add specific directories that have spaces in them to ~/.bash-aliases

echo -e "y3=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)\" \\
ql=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Quick\ Launch\" \\
cnc=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Computer\ Networks\ and\ Communication\ Systems\" \\
em=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Engineering\ Mathematics\ I\" \\
ie=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Industrial\ Electronics\" \\
mce=\"cd $HOME/Desktop/CMU\ Docs/Year\ 3\ Semester\ 1\(21-22\)/Microcontrollers\ and\ Embedded\ Systems\" \\
he=\"cd $HOME/Helpful\ Stuff\" \\
stfd=\"cd $HOME/Stuff\ To\ Do\" \\
zinb=\"cd $HOME/Text/Zim\ Notebooks\" \\">> ~/.bash-aliases
