#!/bin/bash

selected=$(echo -e "🛑 Shutdown\n🔄 Reboot\n🌙 Suspend\n🚪 Logout" | wofi --dmenu --prompt "Select an action:")

case $selected in
    "🛑 Shutdown")
        systemctl poweroff
        ;;
    "🔄 Reboot")
        systemctl reboot
        ;;
    "🌙 Suspend")
        systemctl suspend
        ;;
    "🚪 Logout")
        hyprctl dispatch exit
        ;;
esac
