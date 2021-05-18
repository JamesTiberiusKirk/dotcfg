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
~/.scripts/wallpapers.sh
uncluuter &
flameshot &
setxkbmap gb &
puicom -f &
nitrogen --restore

exec dwm

