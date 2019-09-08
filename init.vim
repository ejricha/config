" init.vim
"
" Configuration file for neovim

" Source a few common files
source ~/.vimrc.normal
source ~/.vimrc.vundle
source ~/.vimrc.colors
command! SV source ~/.config/nvim/init.vim

" Some shortcuts in Terminal mode
command! T terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Remember the last cursor position
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
