eval "$(fasd --init auto)"
export TERM=xterm-256color
export CLICOLOR=1
export LC_CTYPE=en_US.UTF-8 # use unicode

# edit this file!
alias erc='mvim ~/.bash_profile'
alias src='source ~/.bash_profile'

# vim keybindings
set -o vi

# GCC
GCC_INCLUDE_DIR=/usr/include/
export GCC_INCLUDE_DIR

# disk usage
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

# homebrew tab completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# jekyll blog creation
function mkpost() {
    filename="$(date +"%Y-%m-%d")-$@.md";
    touch $filename;
    echo "Created $filename";
}

# Power
alias reboot="sudo shutdown -r now"
alias off="sudo shutdown -h now"

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

# fasd aliases
alias j='fasd_cd -d' # use j to jump between folders
alias e='f -e mvim' # quick opening files with vim

_fasd_bash_hook_cmd_complete v m j o

# The essential git commands.
alias gs='git st'
alias g='git'
alias gc='git cm'
alias gd='git diff | mvim'
alias ga='git add'
alias gl='git lg'
alias gp='git push'
alias gu='git pull'
alias gb='git branch'

# MATLAB
alias matlab='/Applications/Matlab.app/bin/matlab -nodesktop -nosplash'

# useful things
bind 'set show-all-if-ambiguous on' # show autocomplete options after first tab
complete -d cd rmdir # only show folders for cd or rmdir
export GREP_OPTIONS='--color=auto' # automatically color grep output

# latex templates
alias cpt='cp ~/.templates/latex/* .'

# django
alias rs='python manage.py runserver'

# colored ls output
HOST=`hostname -s`
PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;31m\]\h\[\033[00;34m\]{\[\033[01;34m\]\w\[\033[00;34m\]}\[\033[01;32m\]:\[\033[00m\] '
export LSCOLORS='ExGxFxdxCxDxDxBxBxExEx'

# added by Anaconda3 4.0.0 installer
export PATH="/Users/nirum/anaconda/bin:$PATH"

# added by Anaconda3 4.0.0 installer
export PATH="/Users/nirum/anaconda/bin:$PATH"

# added by Miniconda3 4.3.21 installer
export PATH="/Users/nirum/miniconda3/bin:$PATH"
