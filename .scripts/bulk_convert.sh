#!/usr/bin/env bash

# Simple script that converts all .m4a files to mp3
# Courtesy of this site: https://en.linuxportal.info/tutorials/hangkezeles/how-to-convert-at-m4a-format-music-files-to-mp3
# This replaces all the spaces in the filenames in the directory with '_'
# for file in *; do mv "$file" "$(echo $file | tr ' ' '_')" ; done
#
# This line converts m4a to mp3 with 128k bitrate and only slightly increases file size
# ffmpeg -i $file -acodec mp3 -ac 2 -ab 128k -loglevel error $out_file
for file in *.m4a; do \
    echo "File conversion: \"${file}\" " ; \
    ffmpeg \
    -i "${file}" \
    -acodec mp3 \
    -ac 2 \
    -ab 128k \
    -loglevel error \
    "./${file%.*}.mp3" ; \
done
