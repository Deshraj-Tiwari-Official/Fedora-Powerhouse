#!/bin/bash
timestamp=$(date +'%Y%m%d_%H%M%S')
screenshot_path="$HOME/Pictures/Screenshots/${timestamp}.png"
grim -g "$(slurp -d)" "$screenshot_path"
wl-copy < "$screenshot_path"
dunstify "Screenshot saved! as $screenshot_path" -i "$screenshot_path"
