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
export EMOJI_CLI_KEYBIND="^e"
source $ZPLUG_HOME/init.zsh

# emoji
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/enhancd", use:init.sh

# file navigation
zplug "Vifon/deer," use:deer

# run `ls` and `git status` on cd
zplug "nirum/smart-cd"

# prezto
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "modules/git", from:prezto
zplug "modules/homebrew", from:prezto
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

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

# base16 colorschemes
source $HOME/.zsh/colors.zsh

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

# 
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
alias s='ls'
alias les='pygmentize'

# tmux stuff
alias tls='tmux ls'
alias lts='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# git
alias gs='git st'
alias sg='git st'
alias ga='git add'
alias gu='git pull'
alias gp='git push'
alias gd='git diff'
alias gl='git lg'
alias gba='git branch -a'
alias gr='git remote'
alias grv='git remote -v'

# bash utilities
function bak { cp "${1}"{,.bak} }   # create a backup of a file

# moving around
alias ..='cd ..'
alias ...='cd ../..'

# key bindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey -v
bindkey '^k' up-history
bindkey '^j' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# suffix aliases
alias -s py=$EDITOR
alias -s pdf=open

# other
alias clc=clear # more cmd style alias
alias ccat='pygmentize -g'

# ssh aliases
alias lenna='ssh lenna.stanford.edu'
alias lennax='ssh -CY lenna.stanford.edu'
alias msh='mosh -6 lenna.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'
alias tonto='ssh -CY niru@tonto.stanford.edu'

# julia
alias julia='/Applications/Julia-0.5.app/Contents/Resources/julia/bin/julia'

# matlab
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias matlab='/usr/bin/matlab -nodesktop -nosplash'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'
fi

# ipython
alias pig='python3 -W ignore'
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias iyp='ipython3 --nosep --no-banner --profile=mbp'
alias nb='jupyter notebook'

# clean up conda and update all packages
alias cup='conda update --all; conda clean -pity'

# brew
alias bup='brew update; brew upgrade; brew cleanup'

# go
export GOPATH=$HOME/code/go

# system specific aliases and paths
if [[ "$OSTYPE" == "linux-gnu" ]]; then

    alias duf='du -shc * | sort -h'
    alias pi='sudo -H pip3.5 install -U'
    alias print='lpr'

    # temperature
    alias cputemp="sensors | sed -rn 's/^.* \\+([0-9]+)\\.[0-9].C .*/\\1/p'"
    alias gputemp="nvidia-smi -q -d temperature | sed -rn 's/^.*GPU Current.*: ([0-9]+).*/\\1/p'"

    # mount SNI server
    alias mount_db="sshfs nirum@sni-vcs-baccus.stanford.edu:/share/baccus ~/sni"

    # set up LD_LIBRARY_PATH (cuda and Intel MKL libraries)
    export LD_LIBRARY_PATH="/usr/local/cuda-7.5/lib64"

    # set up path
    export PATH="/usr/local/cuda-7.5/bin:$PATH"
    # export PATH="/opt/intel/bin:$PATH"

    # npm
    export PATH="/home/nirum/.npm-global/bin:$PATH"

    # anaconda / miniconda for python
    export PATH="/home/nirum/miniconda3/bin:$PATH"


elif [[ "$OSTYPE" == "darwin"* ]]; then

    export HOMEBREW_EDITOR="nvim"
    export VISUAL="nvim"
    alias duf='du -shc * | gsort -h'
    alias spot='spotify'

    # dash
    function dash() {
        open "dash://$*"
    }

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
    export PATH="/usr/local/texlive/2015basic/bin/x86_64-darwin:$PATH"

    # cabal
    export PATH="/Users/nirum/.cabal/bin:$PATH"

    # gopath
    export PATH="/Users/nirum/code/go/bin:$PATH"

    # go
    export PATH="/usr/local/opt/go/libexc/bin:$PATH"

    # anaconda
    export PATH="/Users/nirum/anaconda/bin:$PATH"

fi


# --------------
# -- Finalize --
# --------------

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set up deer
autoload -U deer
zle -N deer
bindkey '^f' deer
