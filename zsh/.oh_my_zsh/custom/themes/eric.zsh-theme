P_TIME="$fg[blue][%D{%Y-%m-%d} $fg[green]%D{%H:%M:%S}$fg[blue]]$reset_color"
if [[ -z $VIRTUAL_ENV ]] then
  P_VENV=""
else
  P_VENV=" (${VIRTUAL_ENV##*/})"
fi
P_PATH="%{$fg[yellow]%}%~%{$reset_color%}"
P_USER="%{$fg[blue]%}$ %{$reset_color%}"
PROMPT=$'\
$P_TIME$P_VENV\
$P_PATH$(git_prompt_info)$(aws_prompt_info)\
$P_USER'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

ZSH_THEME_AWS_PROFILE_PREFIX=" %{$bg[white]$bg[magenta]%}<aws:"
ZSH_THEME_AWS_PROFILE_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_REGION_PREFIX=" %{$fg[white]$bg[green]%}<region:"
ZSH_THEME_AWS_REGION_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_DIVIDER=""

export VIRTUAL_ENV_DISABLE_PROMPT=no

# Add vi mode info
PROMPT="$PROMPT\$(vi_mode_prompt_info)"

# Nothing on the right side of the screen
RPROMPT=""
