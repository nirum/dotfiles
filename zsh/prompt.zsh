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


# prompt
PROMPT='${directory}${prompt_char}'

# Right-justified prompt
RPROMPT=''

