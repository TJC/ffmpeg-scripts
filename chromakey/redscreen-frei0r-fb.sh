#!/bin/bash
BACKGRND=terminator-720.mp4
#BACKGRND=solaris-1.mp4

ffmpeg \
    -r 12 \
    -i $BACKGRND \
    -f video4linux2 \
    -video_size 1280x720 \
    -framerate 12 \
    -i /dev/video0 \
    -filter_complex "[1:v]colorkey=0xf00000:0.35:0.0[ckout];[0:v][ckout]overlay[out]" \
    -map "[out]" \
    -f fbdev -s 1920x1280 -pix_fmt bgra /dev/fb0


# -loop 1
# Boots video:
#    -filter_complex 'frei0r=bluescreen0r:0.74/0.74/0.63|0.1,[1:v]overlay=0:0' \
