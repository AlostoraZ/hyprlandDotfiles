#!/bin/zsh
# Replace "Your Touchpad Name" with the identifier from hyprctl devices
TOUCHPAD_ID="asup1205:00-093a:2003-touchpad" 

# Check current state and toggle
if hyprctl devices | grep -A 2 "identifier: $TOUCHPAD_ID" | grep "enabled: 1"; then
    hyprctl keyword input.touchpad.enabled 0
    notify-send "Touchpad Disabled"
else
    hyprctl keyword input.touchpad.enabled 1
    notify-send "Touchpad Enabled"
fi
