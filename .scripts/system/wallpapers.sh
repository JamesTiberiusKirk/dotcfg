#!/bin/sh

screen1w=$(ls $WALL_PATH/ |sort -R |tail -$N | head -n 1 )
screen2w=$(ls $WALL_PATH/ |sort -R |tail -$N | head -n 1 )

export SCREEN1W=$(echo $screen1w)
xwallpaper --output DP1 --zoom $WALL_PATH/$screen1w  --output eDP-1 --zoom $WALL_PATH/$screen2w

