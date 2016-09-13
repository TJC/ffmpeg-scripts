#!/bin/bash
BACKGRND=terminator-720.mp4
#BACKGRND=solaris-1.mp4

ffmpeg -f video4linux2 \
    -video_size 1280x720 \
    -input_format yuyv422 \
    -framerate 15 \
    -i /dev/video0 \
    -r 15 \
    -i $BACKGRND \
    -filter_complex 'frei0r=bluescreen0r:0.85/0.00/0.00|0.30,[1:v]overlay=0:0' \
    -f fbdev -s 1920x1280 -pix_fmt bgra /dev/fb0


# -loop 1
# Boots video:
#    -filter_complex 'frei0r=bluescreen0r:0.74/0.74/0.63|0.1,[1:v]overlay=0:0' \
