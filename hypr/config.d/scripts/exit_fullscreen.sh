#!/bin/bash

# Start waybar (no need to wait unless you're doing layout logic after)
waybar &

# Wait for waybar to start
sleep 0.225

# Restore the settings
hyprctl keyword general:gaps_in 4
hyprctl keyword general:gaps_out 8
hyprctl keyword general:border_size 2
