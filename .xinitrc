#!/bin/sh
#
# ~/.xinitrc

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysmodmap=/etc/X11/xinit/.Xmodmap

DEFAULT_SESSION=i3

xmodmap $sysmodmap

xrdb -merge "$userresources"

xmodmap "$usermodmap"

# start some nice programs

dunst &
# redshift-gtk &
blueman-applet &
xwallpaper --zoom $HOME/.config/wallpaper.jpg &
uncluuter &
xcompmgr &
# screen.sh &

exec i3

