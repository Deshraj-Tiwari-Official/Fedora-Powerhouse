#!/bin/bash

# Fancy start
sleep 2
clear

# Welcome message
gum style --border double --margin "1" --padding "1" --border-foreground 212 "🔥 Yo, here’s the quick rundown of what just went down (and what you need to do)! 🔥"

# Change shell to Zsh
gum format --theme=dracula "# 1. Change your shell to Zsh:"
echo "Run this command to switch:"
gum style --foreground 34 "   chsh -s /bin/zsh"
echo -e "\nReboot after that, then run:"
gum style --foreground 34 "   ~/dotfiles/post.sh"
echo "And we’ll pick up right where we left off ;))"

# Tmux setup
gum format --theme=dracula "# 2. Get tmux ready:"
echo "You’ll already be in a tmux session (thanks to .zshrc), so now just run:"
gum style --foreground 34 "   tmux source ~/.config/tmux/tmux.conf"
echo "Then press <Ctrl-Space-Shift-I> (leader + I) to install the tmux plugins."

# Neovim setup
gum format --theme=dracula "# 3. Setup Neovim:"
echo "Run:"
gum style --foreground 34 "   v"
echo "Neovim (via lazy.nvim) will handle all the downloads. Once done, quit and run:"
gum style --foreground 34 "   :SupermavenUseFree"
echo "This will install the binaries, treesitter parsers, and mason LSPs."

# Git setup
gum format --theme=dracula "# 4. Git setup:"
echo "Run:"
gum style --foreground 34 "   git config --global user.name \"(your github account username)\""
gum style --foreground 34 "   git config --global user.email \"(your github account email)\""
gum style --foreground 34 "   git config --global init.defaultBranch main"

# Quick tools rundown
gum format --theme=dracula "# 5. Quick tools rundown:"
echo "   - 🌀 fzf: Fuzzy finder"
echo "   - 📜 atuin: Supercharged history"
echo "   - 🖥️ hyprland: Your desktop environment"
echo "   - 🔀 tmux: Terminal multitasking"
echo "   - ✨ neovim: Your code fortress"
echo "   - 🐚 zsh: A Bash upgrade"
echo "Check your dotfiles if you need keybinds/configs!"

# Internet unmetered
gum format --theme=dracula "# 6. Make your internet connection unmetered for the GNOME Store:"
gum style --foreground 34 "   nmcli connection show"
gum style --foreground 34 "   sudo nmcli connection modify 'Your Wi-Fi Name' connection.metered no"
gum style --foreground 34 "   sudo nmcli connection up 'Your Wi-Fi Name'"

# Personal section for Dash 😉
gum style --border rounded --margin "1" --padding "1" --border-foreground 212 "💀 --- Personal Section (Just for Dash 😉) --- 💀"

echo "1️⃣ Install Zen Browser & Bitwarden from GNOME Software (Store flatpak versions)."
echo "   - Login to Bitwarden with your primary email."
echo "   - Log into Zen Browser with your Mozilla account (check Bitwarden)."
echo "   - Sign into your frequently used websites (Notion, YouTube, etc.)."

echo -e "\n2️⃣ Log into atuin and save the new key."

echo -e "\n3️⃣ Setup your SSH for GitHub."
echo "   - A complete SSH guide (general & for GitHub) is in your Notion. Just search for **SSH** in your notion."

# Final message
gum style --border double --margin "1" --padding "1" --border-foreground 46 "✅ That’s it! Now reboot. Feels good, doesn’t it? XD ✅"
