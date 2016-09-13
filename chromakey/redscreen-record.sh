#!/bin/bash
BACKGRND=terminator-720.mp4
#BACKGRND=solaris-1.mp4

avconv -f video4linux2 \
    -video_size 1280x720 \
    -input_format yuyv422 \
    -framerate 12 \
    -i /dev/video0 \
    -r 12 \
    -i $BACKGRND \
    -filter_complex 'frei0r=bluescreen0r:0.85/0.00/0.00|0.30,[1:v]overlay=0:0' \
    -c:v libx264 -profile:v high -preset:v veryfast -pix_fmt yuv420p -b:v 1500k -r 12 screen.mp4



# -loop 1
# Boots video:
#    -filter_complex 'frei0r=bluescreen0r:0.74/0.74/0.63|0.1,[1:v]overlay=0:0' \
