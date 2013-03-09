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

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin

eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file!
alias erc='mvim ~/.zshrc'
alias src='source ~/.zshrc'

# vim keybindings
#set -o vi

# GCC
GCC_INCLUDE_DIR=/usr/include/
export GCC_INCLUDE_DIR

# disk usage
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

# homebrew tab completion
#source `brew --prefix`/Library/Contributions/brew_zsh_completion.sh

#copy the working directory into the clipboard
alias cwd='pwd | pbcopy'

## aliases
alias clc=clear # more cmd style alias
alias la='ls -FAh'
alias ls='ls -Fh'
alias sl='ls -Fh'
alias ..='cd ..;ls'
alias .='echo $PWD'
alias m='mutt'
alias mutt='cd ~/Downloads && mutt'
alias imap='offlineimap'
alias i='offlineimap'
alias c='cal'
alias calendar='cal'
alias whos='who; echo ""; mem;'

# functions
function cdl { cd $1; ls;}

## fasd aliases
alias j='fasd_cd -d' # use j to jump between folders
alias e='f -e mvim' # quick opening files with vim

# The essential git commands.
alias gs='git st'
alias gd='git diff | mvim'

## MATLAB
alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'

## useful things
export GREP_OPTIONS='--color=auto' # automatically color grep output

## latex templates
alias cpt='cp ~/.templates/latex/* .'

## django
alias rs='python manage.py runserver'

## colored ls output
HOST=`hostname -s`
