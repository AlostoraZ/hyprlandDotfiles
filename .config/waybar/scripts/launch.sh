#!/bin/zsh

killall 9 waybar
waybar -c /home/$USER/.config/waybar/themes/cache/config.jsonc -s /home/$USER/.config/waybar/themes/cache/style.css &
