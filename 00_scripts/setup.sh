#!/bin/bash

### Installing gum ###
sudo dnf install -y gum
clear

### Welcome message ###
gum style --border rounded --margin "1" --padding "1" --border-foreground 212 "🔥 Welcome to Deshraj's Setup Script! 🔥"
gum confirm "Ready to start the setup of your Fedora Powerhouse?" || exit 1

### Function to run a command and display success/failure message ###
run_with_status() {
    gum spin --title "$1" -- bash -c "$2"
    
    # If success, print ✅, otherwise ❌
    if [ $? -eq 0 ]; then
        echo "Successful: $3 ✅"
    else
        echo "Failed: $3 ❌"
    fi
}

### Install base tools ###
run_with_status "Installing essential tools..." "sudo dnf install -y git curl wget p7zip tar rsync aria2 unzip" "Essential tools installed"

### Install setup tools (Fix: Handle 'already installed' case) ###
gum spin --title "Installing setup tools..." -- bash -c "
    sudo dnf install -y --allowerasing stow btop zoxide fzf bat ripgrep tmux eza hyprlock clipman hyprpicker hypridle pavucontrol brightnessctl power-profiles-daemon xdg-desktop-portal-wlr neovim zsh kitty hyprland dunst waybar wofi lz4 lz4-devel cargo fastfetch
"
if sudo dnf check-update --quiet; then
    echo "Successful: Setup tools installation ✅"
else
    echo "⚠ Setup tools already installed (or no changes needed) ⚠"
fi

### Apply Catppuccin Mocha theme to Bat ###
run_with_status "Applying Catppuccin Mocha theme to Bat..." "
    mkdir -p \"\$(bat --config-dir)/themes\" &&
    wget -P \"\$(bat --config-dir)/themes\" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme &&
    bat cache --build &&
    echo \"--theme=\\\"Catppuccin Mocha\\\"\" >> ~/.config/bat/config
" "Catppuccin Mocha theme application to Bat"

### Install Homebrew (and some packages) ###
run_with_status "Installing Homebrew and some packages..." "
    NONINTERACTIVE=1 /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\" &&
    echo 'eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\"' >> ~/.bashrc &&
    eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\" &&
    brew install yazi nerdfetch sesh lazygit starship yarn
" "Homebrew installation and packages configuration"

### Setting up Flathub (Fix: Check if it's already added) ###
if flatpak remote-list | grep -q "flathub"; then
    echo "Flathub already set up ✅"
else
    run_with_status "Setting up Flathub..." "
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo &&
        sudo flatpak override --filesystem=\$HOME/.icons
    " "Flathub setup completion"
fi

### Setting up Font ###
run_with_status "Setting up Font..." "
    mkdir -p ~/.fonts
    cd ~/.fonts
    for file in *.tar.xz; do
        gum spin --title 'Extracting $file...' -- tar -xvf '$file' -C ~/.fonts
    done
    fc-cache -fv
" "Font setup completion"

### Final notes ###
gum style --border double --margin "1" --padding "1" --border-foreground 46 "Setup completed successfully! ✅"
