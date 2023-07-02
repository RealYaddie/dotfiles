#!/bin/sh
# Script from Rusty Electron: https://github.com/rusty-electron/dotfiles/
# Script for making recorded videos good for WhatsApp sharing.

ffmpeg -i $1 -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p $2
