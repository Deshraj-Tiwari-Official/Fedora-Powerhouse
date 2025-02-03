#!/bin/bash
temp_file=$(mktemp --suffix=.png)
grim -g "$(slurp -d)" "$temp_file"
wl-copy < "$temp_file"
dunstify "Screenshot copied!" "The screenshot has been copied to your clipboard" -i "$temp_file"
rm "$temp_file"
