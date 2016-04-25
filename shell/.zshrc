# Niru Maheswaranathan
# ~/.zshrc file

source ~/.zprezto/init.zsh

# neovim is my default editor
export EDITOR="nvim"

# temporary directory
export TMPDIR=/tmp

# fasd options
eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file
alias erc='$EDITOR ~/.zshrc'
alias src='source ~/.zshrc'
alias etc='$EDITOR ~/.tmux.conf'

# vim keybindings
set -o vi

# editor
alias v='$EDITOR'
alias profilevim="mvim --cmd 'profile start vimrc.profile' --cmd 'profile! file ~/.vimrc'"
alias nv="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"

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

# moving around
alias ..='cd ..'
alias ...='cd ../..'

# grep coloring
export GREP_OPTIONS='--color=auto' # automatically color grep output

# key bindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey -v
bindkey '^k' up-history
bindkey '^j' down-history
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# vtop
alias vtop="vtop --theme monokai"

# suffix aliases
alias -s py=$EDITOR
alias -s pdf=open

# other
alias clc=clear # more cmd style alias
alias whos='archey; pwd; date'

# ssh aliases
alias lenna='ssh lenna.stanford.edu'
alias lennax='ssh -CY lenna.stanford.edu'
alias msh='mosh -6 lenna.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'
alias tonto='ssh -CY niru@tonto.stanford.edu'

# jump to a recent directory using fasd
j() {
    local dir="$(fasd -ld "$@")"
    [[ -d "$dir" ]] && pushd "$dir"
}

# jump to a directory, interactively chosen
jj() {
    local dir
    dir=$(fasd -Rdl |\
        sed "s:$HOME:~:" |\
        fzf --no-sort +m -q "$*" |\
        sed "s:~:$HOME:")\
    && pushd "$dir"
}

# jump to the directory with a specific file
jf() {
    local file
    local dir
    file=$(fzf +m -q "$1")\
        && dir=$(dirname "$file")
    [ -d "$dir" ] && pushd "$dir"
}

# matlab
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias matlab='/usr/bin/matlab -nodesktop -nosplash'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'
fi

# ipython
alias pig='python3 -W ignore'
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias ipy2='ipython2 --nosep --no-banner --profile=mbp'
alias nb='jupyter notebook'
alias nb2='ipython2 notebook'
alias qt="jupyter qtconsole --ConsoleWidget.font_family="Anonymous Pro" --ConsoleWidget.font_size=14 --no-confirm-exit --no-banner --paging=vsplit --style='' --stylesheet='' --editor='mvim' --JupyterQtConsoleApp.config_file='/Users/nirum/.ipython/profile_mbp/ipython_config'"

# rsync
alias rs='rsync -avz'

# display a bar chart of the files in the directory
wcl() { (for file in "$@"; do; wc -l "$file"; done;) | distribution --graph=vk --char=ba | sort -n }

# go
export GOPATH=$HOME/code/go

# system specific aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then

    alias duf='du -shc * | sort -h'
    alias pi='sudo -H pip3.5 install -U'
    alias print='lpr'

    # temperature
    alias cputemp="sensors | sed -rn 's/^.* \\+([0-9]+)\\.[0-9].C .*/\\1/p'"
    alias gputemp="nvidia-smi -q -d temperature | sed -rn 's/^.*GPU Current.*: ([0-9]+).*/\\1/p'"

    # mount SNI server
    alias mount_db="sshfs nirum@sni-vcs-baccus.stanford.edu:/share/baccus/deep-retina/database ~/database"

elif [[ "$OSTYPE" == "darwin"* ]]; then

    export HOMEBREW_EDITOR="nvim"
    export VISUAL="nvim"
    alias duf='du -shc * | gsort -h'
    alias spot='spotify'

    # dash
    function dash() {
        open "dash://$*"
    }

fi

# mount the SNI data storage (thanks to mwaskom@stanford.edu)
function mount_sni() {
    mnt=/Volumes/sni
    if [ ! -d $mnt ] || [ `ls -l $mnt | wc -l` -eq 0 ]; then
        mkdir -p $mnt
        kinit nirum@stanford.edu
        mount_smbfs //nirum@sni-storage.stanford.edu/group/baccus $mnt
    fi
    export SNI=$mnt/Niru
}

# setup PATHs
if [[ "$OSTYPE" == "linux-gnu" ]]; then

    # set up LD_LIBRARY_PATH (cuda and Intel MKL libraries)
    export LD_LIBRARY_PATH="/usr/local/cuda-7.5/lib64:/opt/intel/mkl/lib/intel64:/opt/intel/lib/intel64"

    # set up path
    export PATH="/usr/local/cuda-7.5/bin:$PATH"
    export PATH="/opt/intel/bin:$PATH"

    # npm
    export PATH="/home/nirum/.npm-global/bin:$PATH"

    #export PATH="$PATH:/home/nirum/miniconda3/bin"

elif [[ "$OSTYPE" == "darwin"* ]]; then

    # set up LD_LIBRARY_PATH (Intel MKL libraries)
    export LD_LIBRARY_PATH="/opt/intel/mkl/lib:/opt/intel/lib"
    export DYLD_LIBRARY_PATH="/opt/intel/mkl/lib:/opt/intel/lib"

    # set up path
    export PATH="/usr/local/texlive/2015basic/bin/x86_64-darwin:/Users/nirum/.cabal/bin:/usr/local/opt/go/libexec/bin:/opt/intel/bin:$PATH"
    export PATH=$PATH:"/usr/local/opt/go/libexc/bin"

    # miniconda
    #export PATH=/Users/nirum/miniconda3/bin:$PATH

fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
