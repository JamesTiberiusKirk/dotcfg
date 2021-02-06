#!/bin/sh

screen1w=$(ls ~/Pictures/wallpapers/ |sort -R |tail -$N | head -n 1 )
screen2w=$(ls ~/Pictures/wallpapers/ |sort -R |tail -$N | head -n 1 )

xwallpaper --output DP1 --zoom ~/Pictures/wallpapers/$screen1w  --output eDP1 --zoom ~/Pictures/wallpapers/$screen2w 

