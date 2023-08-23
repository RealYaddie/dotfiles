#!/usr/bin/env bash

# Script created by ChatGPT using bulk_convert script as reference.
# Requires a .txt file as input and downloads each YT video link on each line and downloads the audio version into ~/Music/Downloads/convert_to_mp3 folder

# Check if yt-dlp is installed
if ! command -v yt-dlp &> /dev/null; then
    echo "yt-dlp is not installed. Please install it first."
    exit 1
fi

# Check if a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file.txt>"
    exit 1
fi

# Assign command line argument to a variable
input_file="$1"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file not found: $input_file"
    exit 1
fi

# Loop through each line in the input file
while IFS= read -r line; do
    echo "Downloading: $line"
    yt-dlp -f 140 -o "$HOME/Music/Downloads/convert_to_mp3/%(title)s.%(ext)s" "$line"
done < "$input_file"
