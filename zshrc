# Niru Maheswaranathan
# ~/.zshrc file

# oh-my-zsh ------------------- {{{

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# auto updates
DISABLE_UPDATE_PROMPT=true
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git autojump bower brew git-extras lol osx vi-mode node npm pip github)
plugins=(fasd bower vi-mode catimg dircycle dirhistory gitfast jsontools npm pip osx pip rand-quote tmux web-search)

source $ZSH/oh-my-zsh.sh

# }}}

# Basic options ------------------- {{{

# fasd options
eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file!
alias erc='nvim ~/.zshrc'
alias src='source ~/.zshrc'

# vim keybindings
set -o vi

# GCC
GCC_INCLUDE_DIR=/usr/include/
export GCC_INCLUDE_DIR

# tmux stuff
PROMPT="$PROMPT"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
alias tls='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

#copy the working directory into the clipboard
alias cwd='pwd | pbcopy'

# }}}

# Other ------------------- {{{

# fix pip (bypass clang error on os x)
alias fixpip='sudo ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future pip'

# grep coloring
export GREP_OPTIONS='--color=auto' # automatically color grep output

# key bindings
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

zle -N zle-line-init
zle -N zle-keymap-select

# kill the lag
export KEYTIMEOUT=1

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

# generate password(s)
alias genpass='python ~/code/genpass.py'
alias pw='node ~/code/projects/unpw/index.js'

# suffix aliases
alias -s tex=nvim
alias -s m=nvim
alias -s py=nvim
alias -s pdf=open

# navigation
alias clc=clear # more cmd style alias
alias la='ls -FAhl'
alias ls='ls -Fh'
alias sl='ls -Fh'
alias ..='cd ..;ls'
alias .='echo $PWD'
alias o='open .'

# applications
alias tcl='teamocil'
alias tman='py3 /Users/nirum/code/projects/tman/tman.py'
alias c='cal'
alias calendar='cal'
alias whos='who'
alias da='django-admin'
alias pym='python manage.py'

# global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g L="| less"
alias -g G="| grep"
alias -g S='| sort'
alias -g json='| python -mjson.tool'

# ssh aliases
alias lenna='ssh -CY lenna.stanford.edu'
alias cardinal='ssh -CY cardinal.stanford.edu'
alias tonto='ssh -CY niru@tonto.stanford.edu'

## fasd aliases
alias j='fasd_cd -d' # use j to jump between folders
alias e='f -e nvim' # quick opening files with vim

# extra git aliases
alias sg='gs'
alias lgs='gs'
alias gs='git st'
alias gc='git cm'
alias gca='git commit -a'
alias gd='git diff'
alias glg='git lg'

# imagemagick
alias resize='mogrify -resize'

# neovim
alias v='nvim'

# matlab
alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'
alias lsc='head -n 5' # output first few lines of the file (to show header comments)

# ipython
alias ipy='ipython2 --nosep --profile=mbp'
alias ipy3='ipython3 --nosep --profile=mbp'
alias ipyl='ipython2 --nosep --profile=lenna'
alias nb='ipython2 notebook --profile=mbp'
alias nb3='ipython3 notebook --profile=mbp'

# latex templates
alias cpt='cp ~/.templates/latex/* .'

# rsync
alias rs='rsync -avz'

# other
alias sv='sudo nvim'
alias svim='sudo nvim'

# }}}

# Functions ------------------- {{{

# change dir and ls
function cdl { cd $1; ls;}

# server
function serve() {
    open "http://localhost:8000/"
    http-server -p 8000
}

# make dir and cd
function mcd() {
    mkdir -p "$@" && cd "$@"
}

# echo lol plugin commands
function lol {
    echo "cd\thai"
    echo "cp\tdowant"
    echo "man\trtfm"
    echo "mkdir\ticanhas"
    echo "mv\tgetme"
    echo "ps -aux\tnomz"
    echo "rm\tdonotwant"
}

# echo virtualenv and virtualenvwrapper commands
function ve {
    echo "mkv myEnv\t\tmkvirtualenv myEnv"
    echo "byebye\t\t\tdeactivate"
    echo "lsv\t\t\tlsvirtualenv"
    echo "guts\t\t\tlssitepackages"
    echo "workon myEnv"
    echo "rmvirtualenv myEnv"
    echo "cdvirtualenv"
    echo "cdsitepackages"
}
alias mkv='mkvirtualenv'
alias lsv='lsvirtualenv'
alias byebye='deactivate'
alias guts='lssitepackages'

# other lol commands
alias getme='mv'

# }}}

# Bower completion ------------------- {{{

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Credits to npm's. Awesome completion utility.
#
# Bower completion script, based on npm completion script.

###-begin-bower-completion-###
#
# Installation: bower completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: bower completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _bower_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           bower completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _bower_completion bower
elif type compdef &>/dev/null; then
  _bower_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 bower completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _bower_completion bower
elif type compctl &>/dev/null; then
  _bower_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       bower completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _bower_completion bower
fi
###-end-bower-completion-###

# }}}

# PATH stuff
export PATH="/usr/local/sbin:/usr/local/heroku/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/Users/nirum/.rvm/bin:/usr/local/go/bin:/usr/local/heroku/bin"

export MAGICK_HOME="/Users/nirum/code/repositories/ImageMagick-6.8.9"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# tmux
export ZSH_TMUX_AUTOSTART=true
