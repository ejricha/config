" Starting clean 2019-09-03,
"  from Modern Vim book

" Use the minpac package manager
"# [eric@frances: ~/.config/nvim/pack/minpac/opt/minpac] on git:master o # 21:15:28 
"$ git remote -v
"origin  https://github.com/k-takata/minpac.git (fetch)
"origin  https://github.com/k-takata/minpac.git (push)
packadd minpac
call minpac#init()
" Packages
call minpac#add("k-takata/minpac", {"type": "opt"})
call minpac#add("tpope/vim-unimpaired")
call minpac#add("tpope/vim-scriptease", {"type": "opt"})
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
