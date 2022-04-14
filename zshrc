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

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST
function _seg() {
  echo "%{%F{$2}%}$1%{%F{white}%}"
}
local directory="$(_seg %1~ gray)"
local prompt_char="$(_seg "\uFF04" blue)"
export PROMPT='${directory}${vcs_info_msg_0_}${prompt_char}'
export RPROMPT=''
SPROMPT="Correct %{$fg[red]%}%R%{$reset_color%} to %{$fg[green]%}%r?%{$reset_color%} (%{%U%}y%{%u%}es/%{%U%}n%{%u%}o/%{%U%}a%{%u%}bort/%{%U%}e%{%u%}dit) "

# other
bindkey -v
export KEYTIMEOUT=1
export EDITOR="nvim"
alias v='nvim'

# system
alias lf="ls -lSFh | awk '{print \$5, \"\t\", \$9}'"
alias la='ls -a'
alias sl='ls'

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

# tmux
alias tls='tmux ls'
alias lts='tmux ls'
alias tsl='tmux ls'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s'

# moving around
alias ls="exa --icons"
alias icat="kitty +kitten icat"
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

# Bashmarks
[[ -f ~/.local/bin/bashmarks.sh ]] && source ~/.local/bin/bashmarks.sh

# configure PATH
# export PATH="/usr/local/texlive/2021/bin/universal-darwin:$PATH"
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"

# local config
[[ -f ~/.local_config.zsh ]] && source ~/.local_config.zsh
autoload -Uz compinit && compinit
