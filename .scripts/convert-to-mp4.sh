# TODO: Make simple script around below command
# ffmpeg -i 2022-10-23\ 11-30-08.mkv -c:a copy -c:v copy test.mp4
ffmpeg -i "$1" -c:a copy -c:v copy "$2"
