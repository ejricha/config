-- syntax matches for rebase commands at start of line
vim.cmd([[syntax match gitrebasePick   /^\s*\zs$pick\|p$\>/]])
vim.cmd([[syntax match gitrebaseReword /^\s*\zs$reword\|r$\>/]])
vim.cmd([[syntax match gitrebaseSquash /^\s*\zs$squash\|s$\>/]])
vim.cmd([[syntax match gitrebaseFixup  /^\s*\zs$fixup\|fix\|f$\>/]])
vim.cmd([[syntax match gitrebaseDrop   /^\s*\zs$drop\|d$\>/]])

-- highlight colors (adjust hex/cterm values as you like)
vim.cmd([[highlight gitrebasePick   guifg=#88aaff]])
vim.cmd([[highlight gitrebaseReword guifg=black guibg=#ffaa00 gui=bold]])
vim.cmd([[highlight gitrebaseSquash guifg=black guibg=#aa88ff gui=bold]])
vim.cmd([[highlight gitrebaseFixup  guifg=white guibg=#5500ff gui=bold]])
vim.cmd([[highlight gitrebaseDrop   guifg=white guibg=#ff0000 gui=bold]])
