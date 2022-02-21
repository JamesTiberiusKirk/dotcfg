#!/bin/sh

xrandr --output DP-2 --auto --output DP-0.1 --auto --above DP-2 --output HDMI-0 --auto --rotate left --right-of DP-0.1

~/.scripts/system/wallpapers.sh
~/.config/polybar/launch.sh
