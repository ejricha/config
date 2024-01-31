" .vimrc
"
" Configuration file for vim

" Source a few common files
source ~/.vimrc.normal
source ~/.vimrc.plugged
source ~/.vimrc.colors

" set a few common commands
command SV source ~/.vimrc
command T terminal

set encoding=utf-8
set viminfo='10,\"100,:20,%,n~/.viminfo
