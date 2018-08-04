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
setopt extended_history     # save each command's beginning timestamp and duration to the history file
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
alias profilevim="$EDITOR --cmd 'profile start editor.profile' --cmd 'profile! file ~/.vimrc'"

# system
alias lf='ls -lSFh'
alias la='ls -a'
alias s='ls'
alias sl='ls'
alias pyg='pygmentize'
alias def='ag def -A 8 -B 2 -s --stats'

# tmux stuff
alias tls='tmux ls'
alias lts='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# task warrior
alias t='task'
alias ta='task add'
alias tl='task list'

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

# bash utilities
function bak { cp "${1}"{,.bak} }   # create a backup of a file

# moving around
alias ..='cd ..'
alias ...='cd ../..'

# key bindings
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey -v
bindkey '^k' history-beginning-search-backward
bindkey '^j' history-beginning-search-forward
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# suffix aliases
alias -s py=$EDITOR
alias -s pdf=open

# other
alias ccat='pygmentize -g'

# ssh aliases
alias lenna='ssh lenna.stanford.edu'
alias lennax='ssh -CY lenna.stanford.edu'
alias lane='ssh -CY niru@lmcintosh.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'

# ipython
alias pig='python3 -W ignore'
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
alias duf='du -shc * | gsort -h'

# mount the SNI data storage (thanks to mwaskom@stanford.edu)
function mount_sni() {
    mnt=/Users/nirum/sni
    if [ ! -d $mnt ] || [ `ls -l $mnt | wc -l` -eq 0 ]; then
        mkdir -p $mnt
        kinit nirum@stanford.edu
        mount_smbfs //nirum@sni-storage.stanford.edu/group/baccus $mnt
    fi
    export SNI=$mnt/Niru
}

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
