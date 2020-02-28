# ~/.zshrc
#
# Configuration file for zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="volta"
#ZSH_THEME="random"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "spaceship" )

# Some custom zsh settings
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(git docker docker-compose globalias zsh-syntax-highlighting fasd zsh-completions)

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

# Suggestion colors
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=87'

# Always use a tab size of 4 in the terminal
#tabs -4

# Add to PATH
PATH+=:~/toolbox/bash:~/toolbox/python

# Use custom aliases
source ~/.zsh_aliases
source ~/.bash_aliases
