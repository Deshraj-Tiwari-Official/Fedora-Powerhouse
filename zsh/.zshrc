# -----------------------------
# Zinit Installer and Setup
# -----------------------------
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load important annexes without Turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# -----------------------------
# Plugins
# -----------------------------
### Adding Plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zpcompinit; zpcdreplay

# Setup fzf autocomplete
source <(fzf --zsh)

# -----------------------------
# Environment Variables
# -----------------------------
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm bash_completion

# Go Paths
export PATH=$PATH:/usr/local/go/bin

# Homebrew Paths
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/sbin:$PATH"

# fzf Theme
export FZF_DEFAULT_OPTS="
  --color=fg:#BABBF1,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=spinner:#f5e0dc,pointer:#af5fff,marker:#87ff00 \
  --color=prompt:#d7005f,header:#f38ba8,info:#cba6f7 \
  --color=border:#262626,label:#aeaeae,query:#d9d9d9 \
  --multi"

# -----------------------------
# Functions
# -----------------------------
function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# -----------------------------
# Auto-start tmux session
# -----------------------------
[[ -z "$TMUX" ]] && exec tmux

# -----------------------------
# History Configuration
# -----------------------------
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# -----------------------------
# Completion Styling
# -----------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' listcolors '${(s.:.)LS_COLORS}'

# -----------------------------
# Vim Mode
# -----------------------------
set -o vi

# -----------------------------
# Aliases
# -----------------------------

### File and Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='eza -l --icons --git -a'
alias ls='eza --icons'
alias lt='eza -T --icons'
alias v='nvim'
alias fbn='nvim $(fzf -m --preview="bat --color=always {}")'

### Session Management
alias tmux='tmux -u'
alias zd='zellij -l welcome'
alias tms='~/dotfiles/tmux/scripts/tmux-sessionizer.sh'

### Other Tools
alias lg='lazygit'

# -----------------------------
# Zoxide, Atuin, and Starship
# -----------------------------
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# -----------------------------
# Others
# -----------------------------
