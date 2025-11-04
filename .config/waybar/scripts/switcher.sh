#!/bin/zsh

theme=$(echo "default|noMiddle|round" | rofi -sep '|' -dmenu -p "Waybar")
notify-send "Current waybar theme: $theme" -u "low"

cp /home/alostora/.config/waybar/themes/$theme/config.jsonc /home/alostora/.config/waybar/themes/$theme/style.css /home/alostora/.config/waybar/themes/cache/

if pgrep -x "waybar"; then
  pkill waybar
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
else
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
fi

