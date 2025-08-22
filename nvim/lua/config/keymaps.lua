-- Use the old vim stype of vim mapping for easier reads
local utils = require("config.utils")
local nmap = utils.nnoremap
local vmap = utils.vnoremap
local imap = utils.inoremap
--local tmap = utils.tnoremap
--local xnoremap = utils.xnoremap

-- Escape insert mode using
imap("jk", "<escape>", { desc = "Exit insert mode" })
--- Do I really plan on using the built in nvim terminal
--tmap("jk", "<C-\\><C-n>", { desc = "Exit term insert mode" })

-- Save application with good old <C-S>
nmap("<C-s>", function()
  vim.api.nvim_command("write")
end, { silent = true, desc = "Write Document" })

imap("<C-s>", function()
  vim.api.nvim_command("write")
end, { silent = true, desc = "Write Document" })

-- Jump to beginning of line
nmap("H", "g^", { desc = "Move to beginning of line" })
vmap("H", "g^", { desc = "Move to beginning of line" })

-- Jump to end of line
nmap("L", "g$", { desc = "Move to end of line" })
vmap("L", "g$", { desc = "Move to end of line" })

-- Align my movements to match against wraps
nmap("j", "gj", { desc = "Move visually down" })
nmap("k", "gk", { desc = "Move visually up" })

-- Press 'U' for redo
nmap("U", "<C-r>", { desc = "Redo (Paired with undo" })

-- Buffer maangement
nmap("<leader>bp", ":bprev<CR>", { desc = "Move to next buffer" })
nmap("<leader>bn", ":bnext<CR>", { desc = "Move to previous buffer" })
nmap("<leader>bt", "<C-^>", { desc = "Toggle buffer" })

-- Diagnostic keymaps
nmap("[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
nmap("]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
nmap("<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
nmap("<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Document formatting
nmap("<leader>fd", utils.smart_format, { desc = "Smart document formatting" })
nmap("<leader>FD", utils.force_format_full, { desc = "Force full document formatting" })

-- Format selected block into columns
vmap("<leader>c", ":%!column -t -o ' '<CR>", { desc = "Format selected into columns" })
