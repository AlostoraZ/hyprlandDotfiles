#!/bin/zsh

input="$1"

if [[ -n $input ]]; then
  case "$input" in
    "Square") theme="default" ;;
    "Round") theme="round" ;;
    *) theme="cache" ;;
  esac
else
  rtheme=$(echo "[top] Default|[top] oneBar|[top] Floating Bar" | rofi -sep '|' -dmenu -i -p "Waybar")
  case "$rtheme" in
    "[top] Default") theme="default" ;;
    "[top] Floating Bar") theme="floatingBar" ;;
    # "[top] Round default") theme="round" ;;
    "[top] oneBar") theme="oneBar" ;;
    *) theme="cache" ;;
  esac
fi

notify-send "Current waybar theme: $theme" -u "low"

cp /home/$USER/.config/waybar/themes/$theme/config.jsonc /home/$USER/.config/waybar/themes/$theme/style.css /home/$USER/.config/waybar/themes/cache/

if pgrep -x "waybar"; then
  pkill waybar
  waybar -c /home/$USER/.config/waybar/themes/$theme/config.jsonc -s /home/$USER/.config/waybar/themes/$theme/style.css & disown
else
  waybar -c /home/$USER/.config/waybar/themes/$theme/config.jsonc -s /home/$USER/.config/waybar/themes/$theme/style.css & disown
fi

