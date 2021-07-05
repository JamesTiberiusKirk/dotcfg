#!/bin/sh
#
# ~/.xinitrc

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysmodmap=/etc/X11/xinit/.Xmodmap
DEFAULT_SESSION=dwm

xmodmap $sysmodmap
xrdb -merge "$userresources"
xmodmap "$usermodmap"

# start some nice programs
dunst &
blueman-applet &
xwallpaper --zoom ~/Pictures/wp1895637-vaporwave-wallpapers.png
#~/.scripts/wallpapers.sh
#~/.scripts/system/touchpad.sh &
uncluuter &
flameshot &
setxkbmap gb &
picom &
# nitrogen --restore


#exec dwm
exec i3

