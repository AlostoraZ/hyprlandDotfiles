#!/bin/zsh

clrsFile="$HOME/.config/matugen/shell/colors.json"

color=$(jq -r '.colors.color0' "$clrsFile")
color="${color#'#'}"

# echo "the color input $color"

asusctl aura static -c "$color"
asusctl -k low
