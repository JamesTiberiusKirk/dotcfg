#!/bin/bash


if [ $1 == "--reset" ]
then
  i3-msg gaps inner current set 5
  i3-msg gaps outer current set 5
  polybar-msg cmd show
else 
  i3-msg gaps inner current set 0
  i3-msg gaps outer current set 0
  polybar-msg cmd toggle
fi

