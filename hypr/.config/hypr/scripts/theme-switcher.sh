#!/bin/zsh

theme=$(echo "Square|Round" | rofi -sep '|' -dmenu -i -p 'Themes')

case $theme in
  'Round') hyprctl --batch "keyword decoration:rounding 8 ; keyword decoration:rounding_power 9 ; dispatch exec /home/alostora/.config/waybar/scripts/switcher.sh 'Round'";;
  'Square') hyprctl --batch "keyword decoration:rounding 3 ; keyword decoration:rounding_power 4 ; dispatch exec /home/alostora/.config/waybar/scripts/switcher.sh 'Square'";;
  *) ;;
esac
