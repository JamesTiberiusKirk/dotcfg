#!/bin/bash

# Terminate already running bar instances
echo "Killing polybar"
killall -q polybar

# Wait until the processes have been shut down
echo "Waiting...."
while pgrep -x polybar 2 >/dev/null; do sleep 1; done


echo "About to run it.."
if [[ $(hostname) == "dellstar" ]];
then 
  echo "Running polybar for XPS"
  polybar -rq xps --config=~/.config/polybar/config.ini
  #polybar -rq xps --config=~/.config/polybar/config.ini
  #polybar -rq xps --config=config.ini
else
  echo "Running polybar"
  polybar -rq mainbar &
  polybar -rq secbar &
  polybar -rq thirdbar &
fi


# xrandr -q | grep " connected" | grep " connected" | cut -d ' ' -f1 | while read DIS;
# polybar --list-monitors | cut -d ':' -f1 | while read DIS;
# do 
  # #[[ "$DIS" == "Screen" ]] && continue;
  # # [[ ! -z "$DIS" ]] && echo $DIS && MONITOR=$DIS polybar -rq mybar &
  # echo $DIS && MONITOR=$DIS polybar -rq mybar &
  # sleep 1
# done 


# for i in $(polybar -m | awk -F: '{print $0}'); do
  # MONITOR=$i polybar -rq mybar & 
# done

echo "Polybar launched..."
