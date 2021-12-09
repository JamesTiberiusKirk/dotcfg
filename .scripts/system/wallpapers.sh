#!/bin/sh


xrandr -q | grep " connected" | grep " connected" | grep -v " left" | cut -d ' ' -f1 | while read DIS;
do
  RAND_WALL=$(ls $WALL_PATH/  | grep -v "_only" | sort -R |tail -$N | head -n 1 )
  xwallpaper --output $DIS --zoom $WALL_PATH/$RAND_WALL
done


xrandr -q | grep " connected" | grep " left" | grep " connected" | cut -d ' ' -f1 | while read DIS;
do
  RAND_WALL=$(ls $WALL_PATH/ | grep "_portrait_friendly" |sort -R |tail -$N | head -n 1 )
  xwallpaper --output $DIS --zoom $WALL_PATH/$RAND_WALL
done

