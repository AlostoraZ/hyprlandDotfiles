# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# eval "$(oh-my-posh init zsh --config https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/bubbles.omp.json)"
# eval "$(oh-my-posh init zsh --config )"
eval "$(oh-my-posh init zsh --config /home/alostora/.config/oh-my-posh/themes/json/json.omp.json)"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/.local/bin:$PATH"

export PATH="$HOME/.config/waybar/scripts:$PATH"
export PATH="$HOME/.config/hypr/scripts:$PATH"

#fastfetch -c /usr/share/fastfetch/presets/examples/13.jsonc

# Package Managers
alias p='sudo pacman --color auto'
alias y='yay --color auto'


# File System
# alias ls='ls -a --color=auto'
alias ls='eza -a --group-directories-first --icons=auto'
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/alostora/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/alostora/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/alostora/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/alostora/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/alostora/.dart-cli-completion/zsh-config.zsh ]] && . /home/alostora/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

