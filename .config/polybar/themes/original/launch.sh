#!/bin/bash

# Kill all polybars
killall -q polybar

# Wait until kill confirmed.
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        #MONITOR=$m polybar --reload example &
        MONITOR=$m polybar --reload mybar &
    done
else
    #polybar --reload example &
    polybar --reload mybar &
fi


echo "Polybar launched..."
