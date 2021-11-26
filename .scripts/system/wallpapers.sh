#!/bin/sh


xrandr -q | grep " connected" | grep " connected" | cut -d ' ' -f1 | while read DIS;
do
  RAND_WALL=$(ls $WALL_PATH/ |sort -R |tail -$N | head -n 1 )
  xwallpaper --output $DIS --zoom $WALL_PATH/$RAND_WALL
done
