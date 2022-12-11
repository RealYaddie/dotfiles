#!/usr/bin/env bash

# Spawn a quick "scratchpad" dmenu instance and copy whatever is typed to clipboard. Very niche one liner to get around free tier restriction of Web Highlight extension

- | dmenu | xclip -i -selection clipboard
