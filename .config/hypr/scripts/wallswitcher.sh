#!/bin/bash

# Folder containing your wallpapers
WALLPAPER_DIR="$HOME/wallpaper"

# Ask the user to pick a wallpaper using rofi/dmenu
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' -o -iname '*.gif' \) | rofi -dmenu -i -p "Choose wallpaper:")

# If the user cancelled, exit
[ -z "$WALLPAPER" ] && exit 0

hyprctl dispatch exec $HOME/.config/hypr/scripts/wallset.sh $WALLPAPER
