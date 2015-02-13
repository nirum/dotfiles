# Niru Maheswaranathan
# ~/.zshrc file

source ~/.zprezto/init.zsh

# fasd options
eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file
alias erc='nvim ~/.zshrc'

# vim keybindings
set -o vi

# tmux stuff
alias tls='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

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

## fuzzy matching
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
#zstyle -e ':completion:*:approximate:*' \
        #max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

## remove trailing slashes
#zstyle ':completion:*' squeeze-slashes true

## sort menu by time
#zstyle ':completion:*:*:xdvi:*' menu yes select
#zstyle ':completion:*:*:xdvi:*' file-sort time

# suffix aliases
alias -s py=nvim
alias -s pdf=open

# other
alias clc=clear # more cmd style alias
alias whos='who; date'

# ssh aliases
alias lenna='ssh -CY lenna.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'
alias tonto='ssh -CY niru@tonto.stanford.edu'

# neovim
alias v='nvim'

# matlab
alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'

# ipython
alias ipy='ipython2 --nosep --profile=mbp'
alias ipy3='ipython3 --nosep --profile=mbp'
alias ipyl='ipython2 --nosep --profile=lenna'
alias nb='ipython2 notebook --profile=mbp'
alias nb3='ipython3 notebook --profile=mbp'

# rsync
alias rs='rsync -avz'

# other
alias sv='sudo nvim'
alias svim='sudo nvim'

# PATH stuff
export PATH="/usr/local/sbin:/usr/local/heroku/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/nirum/.rvm/bin:/usr/local/go/bin:/usr/local/heroku/bin"
