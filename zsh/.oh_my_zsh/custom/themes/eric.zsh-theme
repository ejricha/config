P_TIME="%{$fg[blue]%}# %D{[%I:%M:%S]}%{$reset_color%}"
P_PATH="%{$fg_bold[yellow]%}%~%{$reset_color%}"
P_USER="%{$fg[blue]%}$ %{$reset_color%}"
PROMPT=$'$P_TIME $P_PATH$(git_prompt_info)$(aws_prompt_info)\
$P_USER'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

ZSH_THEME_AWS_PROFILE_PREFIX=" %{$bg[white]$bg[magenta]%}<aws:"
ZSH_THEME_AWS_PROFILE_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_REGION_PREFIX=" %{$fg[white]$bg[green]%}<region:"
ZSH_THEME_AWS_REGION_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_DIVIDER=""

# Nothing on the right side of the screen
RPROMPT=""
