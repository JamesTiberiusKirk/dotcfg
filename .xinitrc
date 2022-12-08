#!/bin/sh
#
# ~/.xinitrc

#source $HOME/.profile
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysmodmap=/etc/X11/xinit/.Xmodmap
DEFAULT_SESSION=i3

xmodmap $sysmodmap
xrdb -merge "$userresources"
[ $(hostname) = "dellstar" ] && xrdb -merge "$HOME/.Xresources.dellstar"
xmodmap "$usermodmap"

# start some nice programs

#[ $(hostname) != "dellstar" ] && ~/.scripts/system/nvidia-screen-tearing-fix.sh &
dunst &
blueman-applet &
~/.scripts/system/wallpapers.sh &
#~/.scripts/system/touchpad.sh &
unclutter &
flameshot &
setxkbmap gb &
setxkbmap -layout gb &
picom &

xinput set-prop 8 295 0 0  &
xinput set-prop 8 292 -1 &

exec i3


