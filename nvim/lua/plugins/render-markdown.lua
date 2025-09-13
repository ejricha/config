return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = vim.g.enabled_plugins,
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    bullet = { enabled = true },
    latex = { enabled = true },
  },
}
