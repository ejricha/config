function InsertFileAtBeginning()
  vim.cmd("0r ~/dev/header")
end

vim.api.nvim_create_user_command("InsertHeader", function()
  InsertFileAtBeginning()
end, { desc = "Insert Header" })

-- Tabs & Indentation
vim.bo.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
