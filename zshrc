# zshrc
# Author: Niru Maheswaranathan
# Website: https://github.com/nirum/dotfiles

setopt auto_cd              # if a command is invalid and the name of a directory, cd to that directory
setopt append_history       # zsh sessions will append their history list to the history file
setopt extended_history     # save each commands timestamp and duration to the history file
setopt correct              # correct mistyped commands
setopt prompt_subst         # perform expansions

# prompt
export PROMPT="%1~$(echo "\uFF04")"
export RPROMPT=''
SPROMPT="Correct %{$fg[red]%}%R%{$reset_color%} to %{$fg[green]%}%r?%{$reset_color%} (%{%U%}y%{%u%}es/%{%U%}n%{%u%}o/%{%U%}a%{%u%}bort/%{%U%}e%{%u%}dit) "

# other
bindkey -v
export KEYTIMEOUT=1
export EDITOR="nvim"
alias v='nvim'

# system
alias lf='ls -lSFh'
alias la='ls -a'
alias s='ls'
alias sl='ls'

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

# Local configuration
[[ -f ~/.local_config.zsh ]] && source ~/.local_config.zsh
