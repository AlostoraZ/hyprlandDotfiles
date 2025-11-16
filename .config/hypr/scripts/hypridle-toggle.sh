#!/bin/zsh

x=$(pidof hypridle)
if [ $x ]; then
  notify-send 'Hypridle disabled' -u low
  pkill hypridle &> /dev/null
else
  hyprctl dispatch exec hypridle
  notify-send 'Hypridle enabled' -u low
fi

