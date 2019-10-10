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
plugins=(git globalias zsh-syntax-highlighting)

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

# Change some highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta,bold,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'

# Always use a tab size of 4 in the terminal
tabs -4

# Add to PATH
PATH+=:~/toolbox/bash:~/toolbox/python

# Use custom aliases
source ~/.zsh_aliases
source ~/.bash_aliases
