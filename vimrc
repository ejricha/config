" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" Normal things
syntax on
set hlsearch
set bg=dark
set tabstop=4
"set softtabstop=2
"set shiftwidth=2
"set expandtab

" Overrides for certain filetypes
if has("autocmd")
  autocmd FileType make set noexpandtab ts=4 st=4 sw=4
endif

" Show line numbers, with a custom cursor color
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=DarkRed guibg=NONE
set cursorline
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE

" Use a deep red for Special
highlight Special term=bold cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=#ff0000 guibg=NONE

" Always show the file info
set statusline="%f%m%r%h%w"
set statusline="%F%f%m%r%h%w"

" Allow modeline changes from top of file
set modeline

" Spellcheck
set spelllang=en
"set spell
" zg : add word to dict
" zug : remove word from dict

" ALE plugins
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
" Shortcuts
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Disable ale by default, but keep gitgutter enabled by default
let g:ale_enabled = 0
"let g:gitgutter_enabled = 0

" Integration with git
"autocmd BufWritePost * GitGutter
"highlight link GitGutterChangeLine DiffText
"highlight link GitGutterAddLine DiffAdd
"highlight link GitGutterChangeLine DiffChange
"highlight link GitGutterDeleteLine DiffDelete
"highlight link GitGutterChangeDeleteLine DiffChange
"highlight GitGutterChangeLine guifg=magenta
"highlight GitGutterAddLine guifg=cyan
"highlight GitGutterDeleteLine guifg=red
"highlight GitGutterChangeDeleteLine guifg=red
"hi GitGutterAdd        guibg=red guifg=green
"hi GitGutterAddLine    guibg=#001040
