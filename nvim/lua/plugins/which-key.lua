return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    enabled = vim.g.enabled_plugins,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      delay = 5000,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
