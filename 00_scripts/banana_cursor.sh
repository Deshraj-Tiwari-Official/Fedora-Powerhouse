#!/bin/bash

# Fancy startup
sleep 2
clear

# Fancy startup message
gum style --border rounded --margin "1" --padding "1" --border-foreground 212 "Extracting cursor theme 🔥"

# Create .icons directory if it doesn't exist
gum spin --title "Creating ~/.icons directory..." -- mkdir -p ~/.icons

# Navigate to assets folder
gum spin --title "Navigating to icon assets..." -- cd ~/dotfiles/00_scripts/assets

# Extract all .tar.xz files into ~/.icons
for file in *.tar.xz; do
    gum spin --title "Extracting $file..." -- tar -xvf "$file" -C ~/.icons
done

# Go back to dotfiles directory
gum spin --title "Returning to ~/dotfiles..." -- cd ~/dotfiles

# Success message
gum style --border double --margin "1" --padding "1" --border-foreground 46 "Cursor Banana'd successfully! ✅"
