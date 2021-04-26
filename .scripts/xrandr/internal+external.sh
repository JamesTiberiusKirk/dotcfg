#!/bin/sh

# xrandr --output DP1 --auto --output eDP1 --auto --below DP1
# xrandr --output DP1 --auto --brightness 0.9 --output eDP1 --mode 3200x1800 --right-of DP1
xrandr --output DP1 --auto --output eDP1 --auto --right-of DP1
# xrandr --output DP1 --auto --brightness 0.9 --output eDP1 --mode 1920x1080 --right-of DP1

xinput --map-to-output "ELAN Touchscreen" eDP1

~/.config/polybar/launch.sh
~/.scripts/wallpapers.sh

