#!/bin/bash

ffmpeg -f video4linux2 \
    -video_size 1280x720 \
    -input_format yuyv422 \
    -framerate 15 \
    -i /dev/video0 \
    -f fbdev -s 1920x1280 -pix_fmt bgra /dev/fb0

