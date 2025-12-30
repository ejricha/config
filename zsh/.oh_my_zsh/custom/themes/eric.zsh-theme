P_HOST="$fg[blue][%D{%Y-%m-%d} $fg[green]%D{%H:%M:%S}$fg[blue]] %m"
P_PATH="%{$fg[yellow]%}%~%{$reset_color%}"
P_CMD="%{$fg[blue]%}$%{$reset_color%} "
PROMPT=$'\
$P_HOST$(aws_prompt_info)$(virtualenv_prompt_info)
$P_PATH$(git_prompt_info)
$P_CMD'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"

ZSH_THEME_AWS_PROFILE_PREFIX=" %{$fg[black]$bg[magenta]%}<aws:"
ZSH_THEME_AWS_PROFILE_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_REGION_PREFIX=" %{$fg[black]$bg[yellow]%}<region:"
ZSH_THEME_AWS_REGION_SUFFIX=">%{$reset_color%}"
ZSH_THEME_AWS_DIVIDER=""

ZSH_THEME_VIRTUALENV_PREFIX=" %{$fg[white]$bg[red]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=no

# Add vi mode info
PROMPT="$PROMPT\$(vi_mode_prompt_info)"

# Nothing on the right side of the screen
RPROMPT=""
