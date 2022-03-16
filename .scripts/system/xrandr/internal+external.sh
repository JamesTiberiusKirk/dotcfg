#!/bin/sh

xrandr --output DP-2 --auto --output DP-0.1 --auto --right-of DP-2;
sleep 1s;
~/.scripts/system/wallpapers.sh;
sleep 0.5s;
~/.config/polybar/launch.sh >> /dev/null
~/.scripts/system/set_keyboard.sh
