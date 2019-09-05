# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="volta"
#ZSH_THEME="random"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "spaceship" )

# Some custom zsh settings
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(git globalias)

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# ==================

# No, I don't want to share history between terminals
setopt no_share_history

# Add to PATH
PATH+=:~/toolbox/bash:~/toolbox/python

# Use custom aliases
source ~/.bash_aliases

# Source/edit ~/.zshrc
alias SZ="source ~/.zshrc"
alias VZ="vim ~/.zshrc"

# https://opensource.com/article/18/9/tips-productivity-zsh
alias -s {txt,log}=vim # Open files with vim

# Expand certain aliases
globalias() {
	if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
		zle _expand_alias
		zle expand-word
	fi
	zle self-insert
}
bindkey " " magic-space # no completion by default
bindkey "^ " globalias # expand aliases with Ctrl-Space

# Disable shell rerseved words
#disable -r time # Use time -p instead

# Global aliases
alias -g G="| grep -E"
alias -g Gi="| grep -iE"
alias -g Gr="grep -IrE"
alias -g TODAY=`date +%Y-%m-%d`
alias estyle="astyle --style=break --indent=tab --pad-oper --pad-header"
