return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = vim.g.enabled_plugins,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false,
    bullet = { enabled = false },
    latex = { enabled = true },
  },
}
