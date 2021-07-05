#!/bin/sh

xrandr --output DP-2
PREV_DIS=DP-2

echo "Available displays"
xrandr -q | grep " connected" | cut -d " " -f1 | while read DIS;
do 
  #[[ -z $PREV_DIS ]] && xrandr --output $DIS --auto ;
  [[ $DIS == "DP-2" ]] && continue;
  [[ ! -z $PREV_DIS ]] && xrandr --output $DIS --auto --right-of $PREV_DIS;
  echo "2:$PREV_DIS";
  echo "1:$DIS";
  PREV_DIS=$DIS;
done 

~/.config/polybar/launch.sh
#~/.scripts/wallpapers.sh
xwallpaper --zoom ./Pictures/wp1895637-vaporwave-wallpapers.png

