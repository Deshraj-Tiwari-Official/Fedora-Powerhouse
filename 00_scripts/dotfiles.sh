#!/bin/bash

# Fancy startup
sleep 2
clear

# Fancy startup message
gum style --border rounded --margin "1" --padding "1" --border-foreground 212 "🔥 Setting up your dotfiles... 🔥"

# Navigate to dotfiles directory
gum spin --title "Navigating to ~/dotfiles..." -- cd ~/dotfiles

# Stowing dotfiles
gum spin --title "Applying dotfiles..." -- stow .

# Stowing Zsh separately
gum spin --title "Configuring Zsh..." -- stow -v -t ~ zsh

# Success message
gum style --border double --margin "1" --padding "1" --border-foreground 46 "Dotfiles setup susscessfully! ✅"
