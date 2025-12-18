#!/bin/zsh

input="$1"

if [[ -n $input ]]; then
  case "$input" in
    "Square") theme="default" ;;
    "Round") theme="round" ;;
    *) theme="cache" ;;
  esac
else
  rtheme=$(echo "[top] Default|[top] No Middle|[top] Round default|[top] oneBar" | rofi -sep '|' -dmenu -p "Waybar")
  case "$rtheme" in
    "[top] Default") theme="default" ;;
    "[top] No Middle") theme="noMiddle" ;;
    "[top] Round default") theme="round" ;;
    "[top] oneBar") theme="oneBar" ;;
    *) theme="cache" ;;
  esac
fi

notify-send "Current waybar theme: $theme" -u "low"

cp /home/alostora/.config/waybar/themes/$theme/config.jsonc /home/alostora/.config/waybar/themes/$theme/style.css /home/alostora/.config/waybar/themes/cache/

if pgrep -x "waybar"; then
  pkill waybar
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
else
  waybar -c /home/alostora/.config/waybar/themes/$theme/config.jsonc -s /home/alostora/.config/waybar/themes/$theme/style.css & disown
fi

