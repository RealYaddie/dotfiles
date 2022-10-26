#!/usr/bin/env bash

# variable with ls and various flags to add just before the end of the alias.
list="&& ls -art --group-dirs first"

# /home/leosmith/.flyff05-wine-stable/drive_c/Program Files/Roots Flyff
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
insf=\"cd $HOME/.flyff07-wine-stable/drive_c/Program\ Files/Insanity\ Client $list\" \\
evof=\"cd $HOME/.flyff07-wine-stable/drive_c/Program\ Files/Evolution-Flyff $list\" \\
y32=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\) $list\" \\
ct=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\)/Control\ I $list\" \\
em2=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\)/Engineering\ Mathematics\ II $list\" \\
ie2=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\)/Industrial\ Electronics\ II/ $list\" \\
ii=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\)/Industrial\ Instrumentation\ I $list\" \\
res=\"cd $HOME/Desktop/CMU\ Docs/Year3_Semester2\(21-22\)/Research\ Methods $list\" \\
pm4=\"cd $HOME/Desktop/CMU\ Docs/Year\ 4\ Semester\ 1\(22-23\)/Project\ Management $list\" \\
plc4=\"cd $HOME/Desktop/CMU\ Docs/Year\ 4\ Semester\ 1\(22-23\)/PLCs\ Microcomputers\ and\ Microprocessor\ Systems\ Fundamentals\ $list\" \\
ml4=\"cd $HOME/Desktop/CMU\ Docs/Year\ 4\ Semester\ 1\(22-23\)/Machine\ Learning\ Fundamentals $list\" \\
ii4=\"cd $HOME/Desktop/CMU\ Docs/Year\ 4\ Semester\ 1\(22-23\)/Industrial\ Instrumentation\ II $list\" \\
ct4=\"cd $HOME/Desktop/CMU\ Docs/Year\ 4\ Semester\ 1\(22-23\)/Controls\ II $list\" \\
btrf=\"cd /home/leosmith/.flyff07-wine-stable/drive_c/Program\ Files/Roots\ Flyff $list\" \\
cds=\"cd /home/leosmith/Desktop/CMU\ Docs/ $list\" \\
md=\"cd /home/leosmith/Text/Markdown\ Notes/ $list\" \\">> ~/.bash-aliases
