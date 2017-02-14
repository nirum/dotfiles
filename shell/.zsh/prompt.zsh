# Zsh prompt
# Niru Maheswaranathan
# 2/8/17

# perform expansions
setopt prompt_subst

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=" \uf0e7"
ZSH_THEME_GIT_PROMPT_PREFIX="(\ue725 "
ZSH_THEME_GIT_PROMPT_SUFFIX=")"

ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX=""
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="\uf0ee"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX=""
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="\uf0ed"

# is x11 running?
function x11 {
  if [[ -n "$DISPLAY" ]]; then
    echo -e "\uf108"
  else
    echo -e "\uf11c"
  fi
}

# displays the hostname if not nirumbp
function remote_host {
  if [ $(hostname) != nirumbp ]; then
    echo "$(x11) $(hostname) "
  fi
}

# display an OS logo (nerd fonts)
function os_logo {
  if [ "$(uname -s)" = "Darwin" ]; then
    echo -e "\uf179"
  elif [ "$(uname -s)" = "Linux" ]; then
    echo -e "\uf17c"
  else
    echo ""
  fi
}

# color a segment
function _seg() {
  local fg
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  echo "%{$fg%}$1%{$reset_color%}"
}

# prompt components
local host="$(_seg "$(remote_host)" yellow)"
local directory="$(_seg "$(echo -e "\uf124") %1~" green)"
local git_status="$(_seg "$(git_prompt_info)" blue)"
local prompt_char="%(?:$(_seg "\u2656" white):$(_seg "\u2656" red)) "

# prompt
PROMPT='${host}${directory} $(_seg "$(git_prompt_info)" blue) ${prompt_char} '

# Right-justified prompt
RPROMPT=''

# Substitution prompt
SPROMPT="Correct %{$fg[red]%}%R%{$reset_color%} to %{$fg[green]%}%r?%{$reset_color%} (%{%U%}y%{%u%}es/%{%U%}n%{%u%}o/%{%U%}a%{%u%}bort/%{%U%}e%{%u%}dit) "
