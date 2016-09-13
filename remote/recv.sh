#!/bin/bash
ffmpeg -max_delay 900000 -f mpegts -i udp://10.23.1.179:5005 \
   -f fbdev  -s 1920x1080 -pix_fmt bgra /dev/fb0
