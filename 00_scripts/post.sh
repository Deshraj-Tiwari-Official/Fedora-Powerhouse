#!/bin/bash

set -e  # Exit on error

# Text formatting functions
bold=$(tput bold)
reset=$(tput sgr0)

# Color codes
green=$(tput setaf 2)
magenta=$(tput setaf 5)
blue=$(tput setaf 4)

clear

# Welcome message
echo -e "${bold}${blue}Yo, here’s the quick rundown of what just went down (and what you need to do)!${reset}"

echo -e "\n${magenta}${bold}1. Change your shell to Zsh:${reset}"
echo -e "Run this command to switch:"
echo "${green}   chsh -s /bin/zsh${reset}"
echo -e "\nReboot after that, then run:"
echo "${green}   ~/dotfiles/post.sh${reset}"
echo "And we’ll pick up right where we left off ;))"

echo -e "\n${magenta}${bold}2. Get tmux ready:${reset}"
echo -e "You’ll already be in a tmux session (thanks to .zshrc), so now just run:"
echo "${green}   tmux source ~/.config/tmux/tmux.conf${reset}"
echo "Then press <Ctrl-Space-Shift-I> (leader + I) to install the tmux plugins."

echo -e "\n${magenta}${bold}3. Setup Neovim:${reset}"
echo -e "Run:"
echo "${green}   v${reset}"
echo "Neovim (via lazy.nvim) will handle all the downloads. Once done, quit and run:"
echo "${green}   :SupermavenUseFree${reset}"
echo -e "This will install the binaries, treesitter parsers, and mason LSPs."

echo -e "\n${magenta}${bold}4. Git setup:${reset}"
echo -e "Run:"
echo "${green}   git config --global user.name \"(your github account username)\"${reset}"
echo "${green}   git config --global user.email \"(your github account email)\"${reset}"
echo "${green}   git config --global init.defaultBranch main${reset}"

echo -e "\n${magenta}${bold}5. Quick tools rundown:${reset}"
echo "   - fzf: Fuzzy finder"
echo "   - atuin: Supercharged history"
echo "   - hyprland: Your desktop environment"
echo "   - tmux: Terminal multitasking"
echo "   - neovim: Your code fortress"
echo "   - zsh: A Bash upgrade"
echo -e "Check your dotfiles if you need keybinds/configs!"

echo -e "\n${magenta}${bold}6. Make your internet cnnection unmetered to use gnome store with no data limit:${reset}"
echo "${green}   Ask ChatGPT. It is like 3 commands. I am too lazy to write it here.${reset}"

echo -e "\n${magenta}${bold}--- Personal section (Just for Dash ;) ) ---${reset}"
echo -e "1. Install Zen Browser and Bitwarden by searching on software store of GNOME and install the flatpak version."
echo "Then log in to bitwarden with your primary email."
echo "Login to zen browser with your mozilla account. (see it bitwarden), and sign-in to the websites you frequently use (Notion, Youtube, etc.)"

echo -e "\n2. Log into atuin and save the new key."

echo -e "\n3. Now setup your SSH for github."
echo -e "A complete SSH guide (in general and for github) is present in your notion. Just search for SSH in your notion to find it."

echo -e "\n${bold}${magenta}That’s it! Now reboot. Feels good, doesn’t it? XD${reset}"
