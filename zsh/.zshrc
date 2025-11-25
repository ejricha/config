# ~/.zshrc
#
# Configuration file for zsh

timestamp() {
  date '+%s%N'
}

TIME_START=`timestamp`

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eric"

# Some custom zsh settings
CASE_SENSITIVE=true
HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS=true
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
  vi-mode
  zsh-syntax-highlighting
  git
  virtualenv
  aws
  fzf-tab
  sudo
  web-search
)

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# ==================

# Fix middle-of-word completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

# No, I don't want to share history between terminals,
#  and I like the trailing directory slash
setopt no_share_history
setopt no_auto_remove_slash
ZLE_REMOVE_SUFFIX_CHARS=""

# Change some highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[path]="fg=yellow,bold"
ZSH_HIGHLIGHT_STYLES[path_pathseparator]="fg=green"
ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=magenta"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=yellow,bold"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=cyan,bold"
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="fg=red"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="fg=red,bold"

# Always use a tab size of 2 in the terminal
tabs -2

# Grep should highlight matches magenta
export GREP_COLORS="ms=1;35"

# Do not move by executing a directory
unsetopt autocd
unsetopt AUTO_CD

# Use custom aliases
source ~/.zsh_aliases
source ~/.bash_aliases

# Overrides for vi-mode
VI_MODE_SET_CURSOR=true
export VI_MODE_CURSOR_INSERT=5
MODE_INDICATOR="%F{blue}(vi-mode: \`vv\` to edit in vim)%f\n$ "
bindkey -M viins "\e." insert-last-word
bindkey '^[^?' backward-kill-word
bindkey '^W' backward-kill-word

# Use fzf, but keep the cursor at the top
export FZF_DEFAULT_OPTS=--reverse
bindkey '^I' complete-word
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Show how long it took to parse this file
TIME_DELTA=$(((`timestamp` - $TIME_START) / 1000000000.))
echo "<$TIME_DELTA>"
