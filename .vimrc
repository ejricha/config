" .vimrc
"
" Configuration file for vim

" Source a few common files
source ~/.vimrc.normal
source ~/.vimrc.vundle
source ~/.vimrc.colors
command! SV source ~/.vimrc

set encoding=utf-8

" Always show the file info
"set statusline="%f%m%r%h%w"
"set statusline="%F%f%m%r%h%w"

command! T terminal

set viminfo='10,\"100,:20,%,n~/.viminfo
