#!/bin/zsh

killall 9 waybar
waybar -c /home/alostora/.config/waybar/themes/cache/config.jsonc -s /home/alostora/.config/waybar/themes/cache/style.css &
