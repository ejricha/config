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
#ZSH_THEME="volta"
#ZSH_THEME="random"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "spaceship" )

# Some custom zsh settings
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(git docker docker-compose globalias zsh-syntax-highlighting fasd aws)

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
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=magenta,bold'

# Always use a tab size of 2 in the terminal
tabs -2

# Grep should highlight matches magenta
export GREP_COLORS="ms=1;35"

# Do not move by executing a directory
unsetopt autocd
unsetopt AUTO_CD

# Add certain directories to the path
path+=~/.local/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use custom aliases
source ~/.zsh_aliases
source ~/.bash_aliases

# Show how long it took to parse this file
TIME_DELTA=$(((`timestamp` - $TIME_START) / 1000000000.))
echo "[$TIME_DELTA]"
