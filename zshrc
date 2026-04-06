# zshrc
# Author: Niru Maheswaranathan
# Website: https://github.com/nirum/dotfiles
# zmodload zsh/zprof  # uncomment to profile

setopt auto_cd              # if a command is invalid and the name of a directory, cd to that directory
setopt correct              # correct mistyped commands
setopt prompt_subst         # perform expansions

export MANPAGER="nvim +Man!"
export HISTFILE=~/.zhistory
export HISTSIZE=50000
export SAVEHIST=50000
setopt appendhistory incappendhistory sharehistory hist_ignore_dups hist_reduce_blanks

export FZF_CTRL_R_OPTS="--height 40% --layout=reverse --border \
  --preview 'print -r -- {}' --preview-window=down:5:wrap"
export FZF_DEFAULT_COMMAND="rg --files --follow --hidden --glob '!.git'"
export FZF_DEFAULT_OPTS="--highlight-line --info=inline-right --ansi --layout=reverse --border=double --bind shift-up:preview-page-up,shift-down:preview-page-down"
export FZF_CTRL_T_OPTS="--height=100% --preview='bat --color=always {}'"

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

# wezterm
alias stt="wezterm cli set-tab-title"

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
# bindkey '^r' history-incremental-search-backward

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

# completion
autoload -Uz compinit; compinit
[[ -f ~/.config/fzf-tab/fzf-tab.plugin.zsh ]] && source ~/.config/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# local config
[[ -f ~/.local_config.zsh ]] && source ~/.local_config.zsh

export PROMPT="%F{blue}%~%f 𝝺 "
eval "$(zoxide init zsh)"
alias g="z"
alias cd="z"

source <(fzf --zsh)

conda() {
    unset -f conda
    . "/Users/niru/miniconda3/etc/profile.d/conda.sh"
    conda "$@"
}

# zprof  # uncomment to profile

[ -f "/Users/niru/.ghcup/env" ] && . "/Users/niru/.ghcup/env" # ghcup-env

# Load neovim, claude, and a terminal from the CWD.
function code() {

  # Get the session name from either the argument or the cwd.
  local session_name="${1:-$(basename "$PWD")}"

  # If already inside tmux, don't nest.
  if [[ -n "$TMUX" ]]; then
    echo "Already in a tmux session. Detach first or run from outside tmux."
    return 1
  fi

  # Attach if session already exists.
  if tmux has-session -t "$session_name" 2>/dev/null; then
    tmux attach-session -t "$session_name"
    return
  fi

  # Create session (pane 1: will become neovim)
  tmux new-session -d -s "$session_name" -c "$PWD" -x "$(tput cols)" -y "$(tput lines)"

  # Split bottom for full width terminal (20% height)
  tmux split-window -v -t "$session_name" -c "$PWD" -l 20%

  # Split the top pane right for claude code (30% width)
  tmux split-window -h -t "$session_name":1.1 -c "$PWD" -l 30%

  # Pane layout: 1=neovim (top left), 2=claude (top right), 3=terminal (bottom)
  tmux send-keys -t "$session_name":1.1 "nvim" C-m
  tmux send-keys -t "$session_name":1.2 "claude --dangerously-skip-permissions" C-m

  # Focus on neovim pane
  tmux select-pane -t "$session_name":1.1

  # Attach
  tmux attach-session -t "$session_name"

}

function path() {
  echo -e ${PATH//:/\\n}
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
