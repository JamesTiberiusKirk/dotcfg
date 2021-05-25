#!/bin/sh

xrandr --output DP1 --off --output eDP1 --auto
xinput --map-to-output "ELAN Touchscreen" eDP1

~/.config/polybar/launch.sh
~/.scripts/wallpapers.sh
