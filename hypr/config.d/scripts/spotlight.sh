#!/bin/bash

main_menu="Apps  \nBrowser Search 󰖟 \nCalc  \nEmoji  \nPower Menu  "

choice=$(echo -e "$main_menu" | wofi --dmenu --prompt "Spotlight Search")

case "$choice" in
  " Apps")
    wofi --show drun
    ;;
  "󰖟 Browser Search")
    query=$(wofi --dmenu --height 1)
    if [[ -n "$query" ]]; then
      xdg-open "https://duckduckgo.com/?q=$(echo "$query" | sed 's/ /+/g')"
    fi
    ;;
  " Calc")
    expr=$(wofi --dmenu --height 1)
    result=$(echo "$expr" | bc -l 2>/dev/null)
    if [[ -n "$result" ]]; then
      notify-send " $expr = $result"
    else
      notify-send " Invalid expression"
    fi
    ;;
  " Emoji")
    ~/.config/hypr/config.d/scripts/spotlight_feats/emoji_picker.sh
    ;;
  " Power Menu")
    ~/.config/hypr/config.d/scripts/spotlight_feats/powermenu.sh
    ;;
  *)
    exit 0
    ;;
esac
