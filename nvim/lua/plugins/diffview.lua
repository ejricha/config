-- Leverage Neovim to do git diffs
return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    enabled = vim.g.enabled_plugins,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
      hooks = {
        diff_buf_read = function()
          -- Change local options in diff buffers
          vim.opt_local.wrap = true
          vim.opt.linebreak = true
          vim.opt.fillchars:append { diff = "╱" }
        end,
      },
    },
    keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
  },
}
