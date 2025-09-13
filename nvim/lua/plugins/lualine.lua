return {
  "nvim-lualine/lualine.nvim",
  enabled = vim.g.enabled_plugins,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts.options = {
      theme = "powerline_dark",
    }
  end,
}
