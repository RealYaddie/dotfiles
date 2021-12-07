#!/usr/bin/env bash

# Testing out the different possible requests using obs-cli-lefac.
so="$(obs-cli-leafac GetSourcesList -a "localhost:4444" -p "$(cat /home/leosmith/.config/obs-testing/pass.txt)")"

echo "$so"
