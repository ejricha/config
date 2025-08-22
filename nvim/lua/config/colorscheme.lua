-- Custom colors and file extension handling

-- Default colorscheme
-- vim.cmd.colorscheme("vim") -- Old vim's colors
vim.cmd.colorscheme("default")
-- vim.cmd.colorscheme("gruvbox")
vim.api.nvim_set_hl(0, "Normal", { bg = "black" })

-- Make background color pure black
vim.api.nvim_set_hl(0, "Normal", { bg = "black" })

-- Custom colors for line numbers and cursor
-- Method 1:
vim.api.nvim_set_hl(0, "LineNrAbove", { fg="DarkRed" })
vim.api.nvim_set_hl(0, "LineNr", { fg="Yellow", bold=true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg="DarkRed" })
-- Method 2:
-- vim.o.cursorline = true
-- vim.api.nvim_set_hl(0, "LineNr", { fg="DarkRed" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg="Yellow", bold=true })
-- vim.api.nvim_set_hl(0, "CursorLine", {})

-- More sensible diff colors [NOT WORKING]
vim.api.nvim_set_hl(0, "diffAdded", {cterm=Bold, fg=Cyan})
vim.api.nvim_set_hl(0, "diffRemoved", {ctermfg=Red})
vim.api.nvim_set_hl(0, "diffIndexLine", {ctermfg=Yellow})
