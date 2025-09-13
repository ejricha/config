-- Constants
NUM_SPACES = 2
DIR_CONFIG = vim.fn.stdpath("config")
SPELLFILE = ("%s/spell/en.%s.add"):format(DIR_CONFIG, vim.o.encoding)
DIR_UNDO = ("%s/undo"):format(DIR_CONFIG)

-- TODO: MOVE THESE
vim.cmd("command! GD SignifyHunkDiff")
vim.cmd("command! GU SignifyHunkUndo")
vim.cmd("command! MD RenderMarkdown toggle")
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 1
vim.g.strip_only_modified_lines = 0
vim.g.show_spaces_that_precede_tabs = 1
vim.g.better_whitespace_verbosity = 1
vim.g.better_whitespace_filetypes_blacklist = {}

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Use 2 spaces instead of tabs
vim.opt.tabstop = NUM_SPACES
vim.opt.softtabstop = NUM_SPACES
vim.opt.shiftwidth = NUM_SPACES
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Hide the cmd bar (below lualine)
vim.opt.cmdheight = 0

-- Enable mouse in all modes
vim.opt.mouse = "a"

-- Enable word wrap
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showcmd = true
-- vim.opt.belloff = "all"

-- searching & file reads
-- vim.opt.showmatch = true
-- vim.opt.wildmenu = true
-- vim.opt.startofline = false
-- vim.opt.autoread = true

-- Keep a large undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = DIR_UNDO

-- Backspace
vim.opt.backspace = { "indent", "eol", "start" }

-- Clipboard
vim.opt.clipboard:append("unnamed", "unnamedplus")

-- Spelling and dictionary
vim.opt.spell = true
vim.opt.spellfile = SPELLFILE
vim.opt.complete = vim.opt.complete + "k"
vim.opt.dictionary:append({ SPELLFILE, "/usr/share/dict/words"})

-- Many plugins need a lot of colors
vim.opt.termguicolors = true

-- Keep the cursor this many lines from top/bottom
vim.opt.scrolloff = 7

-- Appearance
-- vim.opt.winborder = "rounded"
-- vim.opt.winborder = "none"

-- Avoid E173 when exiting with unread buffers
vim.opt.confirm = true
