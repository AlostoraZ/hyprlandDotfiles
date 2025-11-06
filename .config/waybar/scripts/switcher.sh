#!/bin/zsh

rtheme=$(echo "[top] Default|[top] No Middle|[top] Round default" | rofi -sep '|' -dmenu -p "Waybar")

case "$rtheme" in
  "[top] Default") theme="default" ;;
  "[top] No Middle") theme="noMiddle" ;;
  "[top] Round default") theme="round" ;;
  *) theme="cache" ;;
esac

notify-send "Current waybar theme: $theme" -u "low"

cp /home/alostora/.config/waybar/themes/$theme/config.jsonc /home/alostora/.config/waybar/themes/$theme/style.css /home/alostora/.config/waybar/themes/cache/

if pgrep -x "waybar"; then
  pkill waybar
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
else
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
fi

