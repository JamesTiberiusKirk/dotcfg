#!/bin/sh
NAME=$(date +'%H:%M_%d-%m-%Y')_'screencap'
ffmpeg -framerate 25 -f x11grab -i :0.0 ~/Videos/$NAME.mp4
