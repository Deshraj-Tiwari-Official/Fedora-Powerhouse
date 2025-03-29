#!/bin/bash

DIR="$HOME/dotfiles/backgrounds"
mapfile -t PICS < <(find "$DIR" -type f | sort)  # Sort alphabetically

LAST_WALLPAPER="$HOME/.cache/last_wallpaper"

if [[ -f "$LAST_WALLPAPER" ]]; then
    LAST_USED=$(cat "$LAST_WALLPAPER")
else
    LAST_USED=""
fi

# Find the index of the last used wallpaper
NEXT_INDEX=0
for i in "${!PICS[@]}"; do
    if [[ "${PICS[i]}" == "$LAST_USED" ]]; then
        NEXT_INDEX=$(( (i + 1) % ${#PICS[@]} ))  # Move to next, loop to 0 if at end
        break
    fi
done

NEW_WALLPAPER="${PICS[NEXT_INDEX]}"
echo "$NEW_WALLPAPER" > "$LAST_WALLPAPER"

if pidof swaybg >/dev/null; then
    pkill swaybg
fi

swww query || (swww-daemon & sleep 1)
swww img "$NEW_WALLPAPER" --transition-fps 30 --transition-type any --transition-duration 2

