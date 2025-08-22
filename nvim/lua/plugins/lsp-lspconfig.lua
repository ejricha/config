return {
  --- Comes with several default configurations for different language servers.
  --- Keeping this here makes sure that we can have some default settings without
  --- doing a full rewrite.
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = vim.g.enabled_plugins,
    opts = {
      ensure_installed = {
        "clangd",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    enabled = vim.g.enabled_plugins,
    event = { "BufReadPre", "BufNewFile" },
    -- no need to load the plugin, since we just want its configs, adding the
    -- plugin to the runtime is enough
    lazy = true,
    init = function()
      local lspConfigPath = require("lazy.core.config").options.root .. "/nvim-lspconfig"
      vim.opt.runtimepath:prepend(lspConfigPath)
    end,
  },
}
