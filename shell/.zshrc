#           _              
#          | |             
#   _______| |__  _ __ ___ 
#  |_  / __| '_ \| '__/ __|
#   / /\__ \ | | | | | (__ 
#  /___|___/_| |_|_|  \___|
#                          
# Author: Niru Maheswaranathan
# Website: https://github.com/nirum/dotfiles

# -----------
# -- zplug --
# -----------
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# prezto
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "modules/git", from:prezto

# zsh-users
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# source plugins and add commands to $PATH
zplug load

# -----------------
# -- ZSH Options --
# -----------------
setopt auto_cd              # if a command is invalid and the name of a directory, cd to that directory
setopt append_history       # zsh sessions will append their history list to the history file
setopt extended_history     # save each commands timestamp and duration to the history file
setopt correct              # correct mistyped commands

# specify autocompletion settings
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)(CVS|.svn|.git)'
zstyle ':completion:*:($EDITOR|v|nvim|gvim|vim|vi):*' ignored-patterns '*.(o|a|so|aux|dvi|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|eps|pyc|egg-info)'

# -----------------------
# -- Prompt and colors --
# -----------------------

# colors and unicode
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8

# custom prompt
source $HOME/.zsh/prompt.zsh

# ---------
# -- VIM --
# ---------
zmodload zsh/zle

# Use vim keybindings
bindkey -v

# Reduce delay when entering vim
export KEYTIMEOUT=1

# By default, we have inssert mode shown on the right
export RPROMPT="%{$fg[yellow]%}[INSERT]%{$reset_color%}"

# Callback for vim mode change
function zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    # Command mode
    export RPROMPT="%{$fg[blue]%}[NORMAL]%{$reset_color%}"
  else
    # Insert mode
    export RPROMPT="%{$fg[yellow]%}[INSERT]%{$reset_color%}"
  fi

  # Refresh prompt
  zle reset-prompt
}
function zle-line-init () {
  # Insert mode
  export RPROMPT="%{$fg[yellow]%}[INSERT]%{$reset_color%}"
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init

# -------------
# -- Aliases --
# -------------

# neovim is my default editor
export EDITOR="nvim"

# fasd options
eval "$(fasd --init auto)"
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection

# edit this file
alias erc='$EDITOR ~/.zshrc'
alias src='source ~/.zshrc'
alias etc='$EDITOR ~/.tmux.conf'

# system
alias o='open .'
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'
alias cpi="${aliases[cp]:-cp} -i"
alias lni="${aliases[ln]:-ln} -i"
alias mvi="${aliases[mv]:-mv} -i"
alias rmi="${aliases[rm]:-rm} -i"

# editor
alias v='nvim'
alias vf='nvim $(fzf)'

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

# suffix aliases
alias -s py=$EDITOR
alias -s pdf=open

# ssh aliases
alias ruse='ssh nirum@198.74.50.117'

# ipython
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias iyp='ipython3 --nosep --no-banner --profile=mbp'
alias nb='jupyter notebook'
alias pag='pip list | ag'

# clean up conda and update all packages
alias cup='conda update --all; conda clean -pity'

# brew
alias bup='brew update; brew upgrade; brew cleanup'

# system specific aliases and paths
export HOMEBREW_EDITOR="nvim"
export VISUAL="nvim"

# texlive
export PATH="/usr/local/texlive/2017/bin/x86_64-darwin:$PATH"

# cabal
export PATH="/Users/nirum/.cabal/bin:$PATH"

# anaconda
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
