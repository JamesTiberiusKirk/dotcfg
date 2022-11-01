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
#xwallpaper --zoom ~/Pictures/wp1895637-vaporwave-wallpapers.png &
~/.scripts/system/wallpapers.sh &
#~/.scripts/system/touchpad.sh &
unclutter &
flameshot &
setxkbmap gb &
setxkbmap -layout gb &
picom &
# nitrogen --restore

#exec dwm
exec i3

# Footer
