#!/bin/sh

# xrandr --output DP-2 --auto --output HDMI-0 --off --output DP-0 --off --output DP-1 --off DP-0.1 --off DP-0.2 --off
xranrd --auto

~/.config/polybar/launch.sh > /dev/null
