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
      -- delay = 5000,
    },
    plugins = {
      spelling = {
        enabled = vim.g.enabled_plugins,
        suggestions = 3,
      },
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
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
