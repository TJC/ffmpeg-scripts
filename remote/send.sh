#!/bin/bash
avconv -f video4linux2 -video_size 1280x720 -framerate 12 \
    -i /dev/video0 \
    -c:v mpeg4 -pix_fmt yuv420p -b:v 3500k \
    -an \
    -f mpegts -muxdelay 0.1 udp://nuncle:5005

#    -c:v mpeg2video -r 12 -pix_fmt yuv420p -b:v 3000k \
#    -vcodec libx264 -pix_fmt yuv420p -tune zerolatency -preset ultrafast -profile:v high -b:v 3000k \

#    -c:a aac -ar 44100 -ac 1 -b:a 32k \
#    -c:v libx264 -profile:v high -preset:v faster -r 25 -pix_fmt yuv420p -b:v 700k \
