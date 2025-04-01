#!/bin/bash
sudo dnf install -y --allowerasing git curl wget p7zip tar rsync aria2 unzip stow btop zoxide fzf bat ripgrep tmux eza hyprlock clipman hyprpicker hypridle pavucontrol brightnessctl power-profiles-daemon xdg-desktop-portal-wlr neovim zsh kitty hyprland dunst waybar wofi lz4 lz4-devel cargo fastfetch gum
sudo dnf update -y

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

mkdir -p ~/git && cd ~/git
git clone https://github.com/LGFae/swww 
cd swww
sleep 1
cargo build --release
sudo mv target/release/swww /usr/local/bin
sudo mv target/release/swww-daemon /usr/local/bin

mkdir -p "$(bat --config-dir)/themes" &&
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme &&
bat cache --build &&
echo \"--theme=\\\"Catppuccin Mocha\\\"\" >> ~/.config/bat/config

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc &&
eval '$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' &&
brew install yazi nerdfetch sesh lazygit starship yarn

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo &&
sudo flatpak override --filesystem=\$HOME/.icons

mkdir -p ~/.fonts && mkdir -p ~/.icons
tar -xvf ~/dotfiles/00_scripts/assets/JetBrainsMono-Minimal.tar.xz -C ~/.fonts
tar -xvf ~/dotfiles/00_scripts/assets/Banana-Dracula.tar.xz -C ~/.icons
fc-cache -fv

cd ~/dotfiles
stow . 
stow -v -t ~ zsh
~/dotfiles/00_scripts/post.sh
