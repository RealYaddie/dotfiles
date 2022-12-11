#!/bin/sh
# Script from Rusty Electron: https://github.com/rusty-electron/dotfiles/
# Use imagemagick to recognize text on screen and copy to clipboard. useful for preparing notes from slides or videos.


# choice=$(printf "remove\nkeep" | dmenu -sb '#7ae070' -sf '#000' -i -p "dOCR - newline?: ")
choice=$(printf "remove\nkeep" | dmenu)
case "$choice" in
	keep) convert x: -modulate 100,0 -resize 400% -set density 300 png:- | tesseract stdin stdout -l eng --psm 3 | sed 's/'$(printf '%b' '\014')'//g;s/|/I/g' | xclip -i -selection clipboard ;;
	remove) convert x: -modulate 100,0 -resize 400% -set density 300 png:- | tesseract stdin stdout -l eng --psm 3 | sed 's/'$(printf '%b' '\014')'//g;s/|/I/g' | tr '\n' ' ' | xclip -i -selection clipboard ;;
esac
