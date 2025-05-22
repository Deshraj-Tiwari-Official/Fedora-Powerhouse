#!/bin/bash

# Kill waybar and wait for it to die
pkill waybar
while pgrep -x waybar >/dev/null; do sleep 0.1; done

# Then set Hyprland options
hyprctl keyword general:gaps_in 0
hyprctl keyword general:gaps_out 0
hyprctl keyword general:border_size 0
