#!/bin/bash

set -e  # Exit on error

# Text formatting functions
bold=$(tput bold)
reset=$(tput sgr0)

# Color codes
green=$(tput setaf 2)
magenta=$(tput setaf 5)

# Welcome message
echo -e "${bold}${green}Starting setup...${reset}"

# Update system and install base tools
echo -e "${bold}${magenta}- Updating system and installing base tools...${reset}"
sudo dnf update -y
sudo dnf install -y git curl wget p7zip tar rsync aria2 unzip

# Install development tools
echo -e "${bold}${magenta}- Installing development tools...${reset}"
sudo dnf install -y --allowerasing stow btop zoxide fzf bat ripgrep jetbrains-mono-fonts-all hyprpaper tmux eza hyprlock clipman hyprpicker hypridle pavucontrol brightnessctl power-profiles-daemon xdg-desktop-portal-wlr neovim zsh kitty hyprland dunst waybar wofi 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# Apply Catppuccin Mocha theme to Bat
echo -e "${bold}${magenta}- Applying Catppuccin Mocha theme to Bat...${reset}"
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
touch ~/.config/bat/config
echo '--theme="Catppuccin Mocha"' >> ~/.config/bat/config

# Install Homebrew (and some packages)
echo -e "${bold}${magenta}- Installing Homebrew and a few packages${reset}"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /home/deshraj/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/deshraj/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install yazi nerdfetch sesh lazygit starship yarn


# Allowing flatpak to access banana cursor theme
sudo flatpak override --filesystem=$HOME/.icons

# Final notes
echo -e "${bold}${green}Setup completed successfully!${reset}"
