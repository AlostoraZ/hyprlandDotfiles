#!/bin/zsh

pkill swayosd-server &> /dev/null
pkill swaync &> /dev/null

swaync & disown
swayosd-server & disown
