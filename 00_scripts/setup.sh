#!/bin/bash

### Installing gum ###
sudo dnf install -y gum
clear

### Welcome message ###
gum style --border rounded --margin "1" --padding "1" --border-foreground 212 "🔥 Welcome to Deshraj's Setup Script! 🔥"
gum confirm "Ready to start the setup of your Fedora Powerhouse?" || exit 1

gum style --foreground 34 "This is going to take a few minutes, so go listen to some music or something. 🎶"

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
run_with_status "Installing essential tools..." "sudo dnf install -y git curl wget p7zip tar rsync aria2 unzip" "Essential tools installation"

### Install setup tools ###
run_with_status "Installing setup tools..." "
    sudo dnf install -y --allowerasing stow btop zoxide fzf bat ripgrep tmux eza hyprlock clipman hyprpicker hypridle pavucontrol brightnessctl power-profiles-daemon xdg-desktop-portal-wlr neovim zsh kitty hyprland dunst waybar wofi lz4 lz4-devel cargo fastfetch
    sudo dnf update -y
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    mkdir -p ~/git
    cd ~/git
    git clone https://github.com/LGFae/swww
    cd swww
    cargo build --release
    sudo mv target/release/swww /usr/local/bin
    sudo mv target/release/swww-daemon /usr/local/bin
" "Setup tools installation"

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

### Setting up Font and Cursor ###
run_with_status "Setting up Font and Cursor..." "
    mkdir -p ~/.fonts && mkdir -p ~/.icons
    gum spin --title 'Extracting font...' -- tar -xvf ~/dotfiles/00_scripts/assets/JetBrainsMono-Minimal.tar.xz -C ~/.fonts
    gum spin --title 'Extracting cursor...' -- tar -xvf ~/dotfiles/00_scripts/assets/Banana-Dracula.tar.xz -C ~/.icons
    fc-cache -fv
" "Font setup completion"

### Setting up dotfiles ###
run_with_status "Setting up dotfiles..." "
    cd ~/dotfiles
    stow .
    stow -v -t ~ zsh
" "Dotfiles setup completion"

### Final notes ###
gum style --border double --margin "1" --padding "1" --border-foreground 46 "Setup completed successfully! ✅"

### Run Post-Setup script ###
~/dotfiles/00_scripts/post.sh
