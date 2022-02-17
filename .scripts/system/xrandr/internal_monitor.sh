#!/bin/sh

xrandr --output DP-0.1 --off --output DP-2 --auto;
~/.config/polybar/launch.sh >> /dev/null
