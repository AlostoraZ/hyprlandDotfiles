#!/usr/bin/env bash

# Function to convert numerical mask to human-readable string
modmask_to_mods() {
  local mask=$1
  local mods=()

  (( mask & 1 ))  && mods+=("Shift")
  (( mask & 4 ))  && mods+=("Ctrl")
  (( mask & 8 ))  && mods+=("Alt")
  (( mask & 64 )) && mods+=("Super")

  if [ ${#mods[@]} -eq 0 ]; then
    echo ""
  else
    echo "$(IFS='+'; echo "${mods[*]}")"
  fi
}

# Parse hyprctl binds
# We capture description, modmask, key, and submap
hyprctl binds | awk '
/description:/ { 
    # Extract description after the label
    match($0, /description: /); 
    desc = substr($0, RSTART + RLENGTH) 
}
/submap:/  { submap = $2 }
/modmask:/ { mod = $2 }
/key:/     { key = $2 }

# When all fields are collected (or checked), output them
# Note: submap can be empty, which is fine
desc && mod && key {
  printf "%s|%s|%s|%s\n", desc, mod, key, submap
  desc=mod=key=submap=""
}
' | while IFS='|' read -r desc mod key submap; do
  mods=$(modmask_to_mods "$mod")
  
  # Format the key combination
  if [ -z "$mods" ]; then
    full_key="$key"
  else
    full_key="$mods + $key"
  fi

  # Add a prefix if the bind belongs to a submap
  if [ -n "$submap" ]; then
    display_desc="[$submap] $desc"
  else
    display_desc="$desc"
  fi

  printf "%-35s %s\n" "$display_desc" "$full_key"
done | sort | rofi -dmenu -i -p "Hyprland Keybinds" \
-theme-str '
#window { width: 80ch; }
#listview { padding: 12px; spacing: 6px; }
#element { padding: 8px 12px; }
'

