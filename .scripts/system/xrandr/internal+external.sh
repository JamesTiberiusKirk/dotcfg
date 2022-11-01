#!/bin/sh

# xrandr --output DP-2 --auto --output HDMI-0 --auto --right-of DP-2 --output DP-0.1 --auto --rotate left --right-of HDMI-0 ;
xrandr --output DP-2 --auto --output DP-0.1 --auto --left-of DP-2;
sleep 1s;
~/.scripts/system/wallpapers.sh;
sleep 0.5s;
~/.config/polybar/launch.sh >> /dev/null
~/.scripts/system/set_keyboard.sh
