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

# color a segment
function _seg() {
  local fg
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  echo "%{$fg%}$1%{$reset_color%}"
}

# prompt components
local directory="$(_seg %1~ white)"
local prompt_char="%(?:$(_seg "\uFF04" white):$(_seg "\uFF04" red))"

# prompt
PROMPT='${directory}${prompt_char}'

# Right-justified prompt
RPROMPT=''

# Substitution prompt
SPROMPT="Correct %{$fg[red]%}%R%{$reset_color%} to %{$fg[green]%}%r?%{$reset_color%} (%{%U%}y%{%u%}es/%{%U%}n%{%u%}o/%{%U%}a%{%u%}bort/%{%U%}e%{%u%}dit) "
