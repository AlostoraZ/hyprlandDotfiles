#!/bin/zsh

clrsFile="$HOME/.config/matugen/shell/colors.json"

color=$(jq -r '.colors.color10' "$clrsFile")
color="${color#'#'}"

echo "the color input $color"

asusctl aura static -c "$color"
