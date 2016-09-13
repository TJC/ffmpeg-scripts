#!/bin/bash
BACKGRND=terminator-720.mp4

ffmpeg -f video4linux2 \
    -video_size 1280x720 \
    -input_format yuyv422 \
    -framerate 12 \
    -i /dev/video0 \
    -r 12 \
    -i $BACKGRND \
    -filter_complex 'frei0r=bluescreen0r:0.85/0.00/0.00|0.30,[1:v]overlay=0:0' \
    -an \
    -c:v mpeg4 -pix_fmt yuv420p -b:v 4000k \
    -f mpegts -muxdelay 0.1 udp://nuncle:5005

