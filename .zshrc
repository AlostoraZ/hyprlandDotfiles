# --- 1. ZINIT BOOTSTRAP ---
# Define the directory where Zinit will live
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it's not already there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# --- 2. THEME (INSTANT LOAD) ---
# Load Powerlevel10k first so your terminal looks ready immediately
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load p10k configuration if it exists
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/custom/zen.toml)"

# --- 3. HISTORY SETTINGS ---
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY      # Share history between terminal windows
setopt HIST_IGNORE_DUPS   # Don't record same command twice
setopt hist_ignore_space
bindkey -e                # Use Emacs keybindings (Standard)



eval "$(fzf --zsh)"

# --- 4. PLUGINS (TURBO MODE) ---
# These load in the background (0 seconds after prompt appears)
zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zsh-users/zsh-completions \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    OMZL::git.zsh \
    OMZP::git \
    Aloxaf/fzf-tab \
    OMZP::sudo \
    OMZP::archlinux \
    OMZP::command-not-found \
    zdharma-continuum/fast-syntax-highlighting

# History Substring Search (needs specific atload for keybindings)
zinit ice wait"0" lucid atload'
    bindkey "^[[A" history-substring-search-up;
    bindkey "^[[B" history-substring-search-down;
    zicdreplay'
zinit light zsh-users/zsh-history-substring-search



bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --group-directories-first --icons=auto --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a --group-directories-first --icons=auto --color=always $realpath'
# Universal preview: shows file content or directory listing
zstyle ':fzf-tab:complete:*' fzf-preview \
  'if [ -d $realpath ]; then eza -a --group-directories-first --icons=auto --color=always $realpath; else bat --color=always --line-range :200 $realpath; fi'






export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/.local/bin:$PATH"

export PATH="$HOME/.config/waybar/scripts:$PATH"
export PATH="$HOME/.config/hypr/scripts:$PATH"

# Manpager
export MANPAGER="nvim +Man!"

#fastfetch -c /usr/share/fastfetch/presets/examples/13.jsonc

# Package Managers
alias p='sudo pacman --color auto'
alias y='yay --color auto'


# File System
# alias ls='ls -a --color=auto'
alias ls='eza -a --group-directories-first --icons=auto --color=always'
alias lt='eza --tree --level=2 --long --icons --git'
alias fzf="fzf-open --preview 'bat --style=numbers --color=always {}'"


# Tools
alias ff='fastfetch -c /usr/share/fastfetch/presets/examples/13.jsonc'
alias v='nvim'
alias fft='fastfetch -c Desktop/fftrick/13.jsonc --logo ubuntu'


# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'


# scripts
alias w='wallset.sh'
# alias wlogout='wlogout -b 5 -s -C /home/alostora/.config/wlogout/nova.css -l /home/alostora/.config/wlogout/layout'
alias wlogout='wlogout.sh'

# Power
alias hibernate='systemctl hibernate'

# start conda
alias conda-init='source ~/anaconda3/etc/profile.d/conda.sh'


# nvim-remote

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
fi

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi


eval "$(zoxide init --cmd cd zsh)"
