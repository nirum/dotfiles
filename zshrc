# zshrc
# Author: Niru Maheswaranathan
# Website: https://github.com/nirum/dotfiles

setopt auto_cd              # if a command is invalid and the name of a directory, cd to that directory
setopt correct              # correct mistyped commands
setopt prompt_subst         # perform expansions

export HISTFILE=~/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt inc_append_history        # Incrementally append to the history file.
setopt extended_history          # Write the history file in the ':start:elapsed;command' format.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups      # Delete an old recorded event if a new event is a duplicate.
setopt hist_find_no_dups         # Do not display a previously found event.
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt hist_verify               # Do not execute immediately upon history expansion.

# other
bindkey -v
export KEYTIMEOUT=1
export EDITOR="nvim"
alias v='nvim'
alias erc="nvim ~/.zshrc"
alias src="exec zsh"

# system
alias lf="ls -lSFh | awk '{print \$5, \"\t\", \$9}'"
alias la='ls -a'
# alias sl='ls'

# git
alias gcm='git commit -m'
alias gs='git status'
alias sg='git status'
alias ga='git add'
alias gu='git pull'
alias gp='git push'
alias gd='git diff'
alias gl='git log --oneline --graph'
alias gb='git branch'
alias gba='git branch -a'
alias gr='git remote'
alias grv='git remote -v'
alias gco='git checkout'
alias gpsu='git push --set-upstream origin $(git branch --show-current)'
alias prs='gh pr list --author "@me"'

# mercurial
alias hb='hg bookmarks'
alias hd='hg diff'
alias hdc='hg diff -r .^' # Diff between now and last commit
alias hda='hg odiff' # Diff between now and last amend
alias hsc='hg st --change .' # hg status (modified files) between now and last commit
alias hs='hg status'
alias ha='hg amend'
alias hn='hg next' # Move up a commit in the stack
alias hp='hg prev' # Move down a commit in the stack
alias hrm='hg rebase -d remote/master' # Rebase current commit to remote/master
alias hcm='hg checkout remote/master'
alias hu='hg pull'
alias hc='hg checkout'
alias hco='hg checkout'
alias hl='hg ssl'

# tmux
alias tls='tmux ls'
alias lts='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# ruff
alias rc="ruff check"
alias rf="ruff format"
alias rc="ruff clean"
alias rr="ruff rule"

# moving around
alias ls="eza --icons"
alias ll="eza --icons --long --time-style=relative --no-user --no-permissions --total-size --sort=size"
alias icat="kitten icat"
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

# ipython
alias ipy='ipython3 --nosep --no-banner --profile=mbp'
alias iyp='ipython3 --nosep --no-banner --profile=mbp'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "\e[A" history-beginning-search-backward-end  # cursor up
bindkey "\e[B" history-beginning-search-forward-end   # cursor down

# edit command in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Autocompletion settings
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)(CVS|.svn|.git)'
zstyle ':completion:*:($EDITOR|v|nvim|gvim|vim|vi):*' ignored-patterns '*.(o|a|so|aux|dvi|swp|fig|bbl|blg|bst|idx|ind|out|toc|class|pdf|ps|eps|pyc|egg-info)'

autoload -Uz compinit && compinit

# local config
[[ -f ~/.local_config.zsh ]] && source ~/.local_config.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
alias g="z"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/niru/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/niru/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/niru/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/niru/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "/Users/niru/.deno/env"