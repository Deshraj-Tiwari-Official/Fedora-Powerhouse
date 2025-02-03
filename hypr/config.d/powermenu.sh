#!/bin/bash

selected=$(echo -e "Shutdown\nReboot\nSuspend\nLogout" | wofi --dmenu --prompt "Select an action:")

case $selected in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        hyprctl dispatch exit
        ;;
esac

