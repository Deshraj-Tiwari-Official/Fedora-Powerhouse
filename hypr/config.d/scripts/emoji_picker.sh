#!/bin/bash

emoji_file="$HOME/.config/hypr/config.d/scripts/emojis.json"
jq_path="/usr/bin/jq"
wofi_path="/usr/bin/wofi"
wlcopy_path="/usr/bin/wl-copy"

emoji_list=$($jq_path -r 'to_entries[] | "\(.key) \(.value)"' "$emoji_file")
selected_line=$(echo "$emoji_list" | $wofi_path --show dmenu --matching contains -i)
selected_emoji=$(echo "$selected_line" | cut -d ' ' -f1)

if [[ -n "$selected_emoji" ]]; then
    echo "$selected_emoji" | $wlcopy_path
else
    echo "No emoji selected."
fi

exit
