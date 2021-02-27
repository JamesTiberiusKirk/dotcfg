#!/bin/sh

screen1w=$(ls $WALL_PATH/ |sort -R |tail -$N | head -n 1 )
screen2w=$(ls $WALL_PATH/ |sort -R |tail -$N | head -n 1 )

xwallpaper --output DP1 --zoom $WALL_PATH/$screen1w  --output eDP1 --zoom ~/Pictures/wallpapers/$screen2w

