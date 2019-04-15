#           _              
#          | |             
#   _______| |__  _ __ ___ 
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__ 
#  /___|___/_| |_|_|  \___|
#                          
# Author: Niru Maheswaranathan
# Website: https://github.com/nirum/dotfiles

# -----------------
# -- ZSH Options --
# -----------------
setopt auto_cd              # if a command is invalid and the name of a directory, cd to that directory
setopt append_history       # zsh sessions will append their history list to the history file
setopt extended_history     # save each commands timestamp and duration to the history file
setopt correct              # correct mistyped commands

# -----------------------
# -- Prompt and colors --
# -----------------------

# colors and unicode
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8

# custom prompt
source $HOME/.zsh/prompt.zsh
export RPROMPT=''

# Use vim keybindings
bindkey -v

# Reduce delay when entering vim
export KEYTIMEOUT=1

# editor
export EDITOR="nvim"
alias v='nvim'

# -------------
# -- Aliases --
# -------------

# edit this file
alias erc='$EDITOR ~/.zshrc'
alias src='source ~/.zshrc'
alias etc='$EDITOR ~/.tmux.conf'

# system
alias lf='ls -lSFh'
alias la='ls -a'
alias s='ls'
alias sl='ls'

# tmux stuff
alias tls='tmux ls'
alias lts='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# disk usage
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias duf='du -shc * | gsort -h'

# git
alias gcm='git commit -m'
alias gs='git st'
alias sg='git st'
alias ga='git add'
alias gu='git pull'
alias gp='git push'
alias gd='git diff'
alias gl='git lg'
alias gb='git branch'
alias gba='git branch -a'
alias gr='git remote'
alias grv='git remote -v'

# moving around
alias ..='cd ..'
alias ...='cd ../..'

# key bindings
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^k' history-beginning-search-backward
bindkey '^j' history-beginning-search-forward
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# ipython
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias iyp='ipython3 --nosep --no-banner --profile=mbp'

# Paths
export PATH="/usr/local/texlive/2017/bin/x86_64-darwin:$PATH"
export PATH="/Users/nirum/.cabal/bin:$PATH"
export PATH="/Users/nirum/miniconda3/bin:$PATH"

# CUDA
export CUDA_HOME="/usr/local/cuda"
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib"
export LD_LIBRARY_PATH="/usr/local/cuda/lib"
export PATH="/usr/local/cuda/bin:/usr/local/cuda/lib:/usr/local/cuda/extras/CUPTI/lib:$PATH"

# --------------
# -- Finalize --
# --------------

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
