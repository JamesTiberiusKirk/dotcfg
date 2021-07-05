#!/bin/sh

xrandr --output DP-2 --auto --output HDMI-0 --off --output DP-0 --off --output DP-1 --off

~/.config/polybar/launch.sh > /dev/null
