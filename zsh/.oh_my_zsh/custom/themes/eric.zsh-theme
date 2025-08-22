P_HASH="%{$fg[blue]%}#"
P_TIME="%{$fg_bold[grey]%}%D{[%I:%M:%S]}%{$reset_color%}"
if [[ -z $VIRTUAL_ENV ]] then
  P_VENV=""
else
  P_VENV=" (${VIRTUAL_ENV##*/})"
fi
P_PATH="%{$fg_bold[yellow]%}%~%{$reset_color%}"
P_USER="%{$fg[blue]%}$ %{$reset_color%}"
PROMPT=$'\
$P_HASH $P_TIME$P_VENV\
$P_HASH $P_PATH$(git_prompt_info)$(aws_prompt_info)\
$P_USER'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

ZSH_THEME_AWS_PROFILE_PREFIX=" %{$bg[white]$bg[magenta]%}<aws:"
ZSH_THEME_AWS_PROFILE_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_REGION_PREFIX=" %{$fg[white]$bg[green]%}<region:"
ZSH_THEME_AWS_REGION_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_DIVIDER=""

export VIRTUAL_ENV_DISABLE_PROMPT=no


# Nothing on the right side of the screen
RPROMPT=""
