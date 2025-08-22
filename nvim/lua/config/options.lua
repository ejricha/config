-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set tabs to spaces
num_spaces = 2
vim.opt.tabstop = num_spaces
vim.opt.softtabstop = num_spaces
vim.opt.shiftwidth = num_spaces
vim.opt.expandtab = true -- turn tabs to spaces

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Enable incremental search
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Enable ignore case for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true -- To take effect ignore case MUST be true
vim.opt.wildignorecase = true

-- Enable mouse mode
vim.opt.mouse = "a"
--
-- Better splitting
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Decrease how often vim checks for updates
vim.opt.updatetime = 50

-- Enable word wrap
vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.showcmd = true
vim.opt.belloff = "all"

-- searching & file reads
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.startofline = false
vim.opt.autoread = true

-- vim history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Backspace
vim.opt.backspace = "indent,eol,start"

-- terminal behavior
vim.opt.termguicolors = true
vim.opt.scrolloff = 2

-- clipboard
vim.opt.clipboard:append("unnamed,unnamedplus")
vim.opt.spell = true

-- windows
-- vim.opt.winborder = "rounded"
vim.opt.winborder = "none"
