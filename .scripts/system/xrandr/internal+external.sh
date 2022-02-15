#!/bin/sh

#[[ $HOST == "legion" ]] && xrandr --output DP-2 --primary && PREV_DIS=DP-2 && INTERNAL=DP-2;
#[[ $HOST == "dellstar" ]] && xrandr --output eDP1 --primary && PREV_DIS=eDP1 && INTERNAL=eDP1;
#
#xrandr -q | grep " connected" | cut -d " " -f1 | while read DIS;
#do 
#  #[[ -z $PREV_DIS ]] && xrandr --output $DIS --auto ;
#  [[ $DIS == $INTERNAL ]] && continue;
#  [[ ! -z $PREV_DIS ]] && xrandr --output $DIS --auto --right-of $PREV_DIS;
#  PREV_DIS=$DIS;
#done 

xrandr --output DP-2 --auto --output DP-0.1 --auto --right-of DP-2
~/.scripts/wallpapers.sh
~/.config/polybar/launch.sh > /dev/null

