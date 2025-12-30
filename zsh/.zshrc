# ~/.zshrc
#
# Configuration file for zsh

# Settings for oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eric"
plugins=(
  vi-mode
  zsh-syntax-highlighting
  git
  virtualenv
  aws
  fzf-tab
  web-search
)
source $ZSH/oh-my-zsh.sh

# Fix middle-of-word completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'

# Do not share history between terminals
setopt no_share_history

# Do not remove the trailing directory slash
setopt no_auto_remove_slash

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

# Overrides for vi-mode
VI_MODE_SET_CURSOR=true
export VI_MODE_CURSOR_INSERT=5
MODE_INDICATOR="%F{blue}(vi-mode: \`vv\` to edit in vim)%f\n$ "
bindkey -M viins "\e." insert-last-word
bindkey '^[^?' backward-kill-word
bindkey '^W' backward-kill-word

# Use fzf, with some sensible options
export FZF_DEFAULT_OPTS="--reverse"
export FZF_CTRL_R_OPTS='--bind "ctrl-c:become:echo {q}"'
bindkey '^I' complete-word
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Rust uses cargo
. ~/.cargo/env

# Use custom aliases
source ~/.zsh_aliases
source ~/.bash_aliases
