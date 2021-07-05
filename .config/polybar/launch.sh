#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done


#polybar -rq mybar &

xrandr -q | grep " connected" | grep " connected" | cut -d ' ' -f1 | while read DIS;
do 
  [[ "$DIS" == "Screen" ]] && continue;
  [[ ! -z "$DIS" ]] && echo $DIS && MONITOR=$DIS polybar -rq mybar &
done 


echo "Polybar launched..."
