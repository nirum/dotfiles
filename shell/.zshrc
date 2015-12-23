# Niru Maheswaranathan
# ~/.zshrc file

source ~/.zprezto/init.zsh

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

# system
alias lf='ls -lSFh'

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
alias gd='git diff'

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
alias whos='who; date'

# ssh aliases
alias lenna='ssh lenna.stanford.edu'
alias lennax='ssh -CY lenna.stanford.edu'
alias msh='mosh -6 lenna.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'
alias tonto='ssh -CY niru@tonto.stanford.edu'

# vim
alias v='$EDITOR'

# matlab
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias matlab='/usr/bin/matlab -nodesktop -nosplash'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'
fi

# ipython
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias ipy2='ipython2 --nosep --no-banner --profile=mbp'
alias nb='jupyter notebook'
alias nb2='ipython2 notebook'
alias qt="jupyter qtconsole --ConsoleWidget.font_family="Anonymous Pro" --ConsoleWidget.font_size=14 --no-confirm-exit --no-banner --paging=vsplit --style='' --stylesheet='' --editor='mvim' --JupyterQtConsoleApp.config_file='/Users/nirum/.ipython/profile_mbp/ipython_config'"
alias pi='pip3 install -U'

# rsync
alias rs='rsync -avz'

# editor
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export EDITOR="gvim"
    alias duf='du -shc * | sort -h'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export EDITOR="mvim"
    export HOMEBREW_EDITOR="mvim"
    export VISUAL="vim"
    alias duf='du -shc * | gsort -h'
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
    export LD_LIBRARY_PATH="/usr/local/cuda-7.5/lib64/"
    export PATH="$PATH:/usr/local/cuda-7.5/bin/"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="$PATH:/usr/local/texlive/2015basic/bin/x86_64-darwin:/Users/nirum/.cabal/bin:/usr/local/opt/go/libexec/bin"
fi
