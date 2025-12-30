-- Use the old vim stype of vim mapping for easier reads
local utils = require("config.utils")
-- local nmap = utils.nnoremap
-- local vmap = utils.vnoremap
-- local imap = utils.inoremap
-- local tmap = utils.tnoremap
-- local xnoremap = utils.xnoremap

-- U for redo
-- utils.nnoremap("U", "<C-r>", { desc = "Redo (paired with undo)" })

-- Spelling
utils.nnoremap("<F3>", "z=", { desc = "Show spelling suggestions" })

-- FZF file finder
utils.nnoremap("<C-f>", ":<C-u>Files<CR>", { desc = "Find any files" })
utils.nnoremap("<C-g>", ":<C-u>GFiles<CR>", { desc = "Find files in git repo" })
-- utils.nnoremap("<C-r>", ":<C-u>Rg<CR>", { desc = "Find files with ripgrep" })

-- Other
utils.nnoremap("<F7>", "yyggVGp", { desc = "Delete all but the current line" })
utils.nnoremap("<S-F7>", "vip:sort<CR>", { desc = "Sort the current paragraph" })
utils.nnoremap("<F12>", ":exe ':silent !google-chrome %'<CR>", { desc = "Open in Google Chrome" })
