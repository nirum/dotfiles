# Niru Maheswaranathan
# ~/.zshrc file

# oh-my-zsh ------------------- {{{

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump brew git-extras lol osx vi-mode)

source $ZSH/oh-my-zsh.sh

# }}}

# Basic options ------------------- {{{

# Path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin

# fasd options
eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file!
alias erc='mvim ~/.zshrc'
alias src='source ~/.zshrc'

# vim keybindings
set -o vi

# GCC
GCC_INCLUDE_DIR=/usr/include/
export GCC_INCLUDE_DIR

# tmux stuff
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

#copy the working directory into the clipboard
alias cwd='pwd | pbcopy'

# }}}

# Other ------------------- {{{

# grep coloring
export GREP_OPTIONS='--color=auto' # automatically color grep output

# key bindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# colored ls output
HOST=`hostname -s`

# fuzzy matching
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# remove trailing slashes
zstyle ':completion:*' squeeze-slashes true

# sort menu by time
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# }}}

# Aliases ------------------- {{{

# ldap search
alias lds='ldapsearch -h ldap-dev.stanford.edu -b dc=stanford,dc=edu'

# disk usage
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

## aliases

# suffix aliases
alias -s tex=mvim
alias -s m=mvim
alias -s py=python
alias -s pdf=open

# navigation
alias clc=clear # more cmd style alias
alias la='ls -FAh'
alias ls='ls -Fh'
alias sl='ls -Fh'
alias ..='cd ..;ls'
alias .='echo $PWD'
alias o='open .'

# applications
alias tcl='teamocil --here'
alias m='mutt'
alias nm='notifymail'
alias pm='pipemail'
alias py='python'
alias imap='offlineimap'
alias i='offlineimap'
alias c='cal'
alias calendar='cal'
alias whos='who; mem;'

# global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g L="| less"
alias -g G="| grep"
alias -g S='| sort'
alias -g T='| tail'

# ssh aliases
alias lenna='ssh -CY lenna'
alias tonto='ssh -CY niru@tonto'

# functions
function cdl { cd $1; ls;}

## fasd aliases
alias j='fasd_cd -d' # use j to jump between folders
alias e='f -e mvim' # quick opening files with vim

# extra git aliases
alias sg='gs'
alias gs='git st'
alias gc='git cm'
alias gd='git diff | mvim'

# matlab
alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'

# ipython
alias ipy='ipython --pylab'

# latex templates
alias cpt='cp ~/.templates/latex/* .'

# django
alias rs='python manage.py runserver'

# }}}
