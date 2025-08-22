vim.lsp.enable({
  "bashls",
  "buf_ls",
  "clangd",
  "cmake",
  "jsonls",
  -- "gopls",
  "lua_ls",
  "pyright",
  "rust_analyzer",
  "yamlls",
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = { current_line = false },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
})

vim.lsp.set_log_level("OFF")
