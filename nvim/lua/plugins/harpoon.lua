return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    enabled = vim.g.enabled_plugins,
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    config = function(_, opts)
      local harpoon = require("harpoon")
      local keys = require("config.utils")

      harpoon.setup(opts)

      keys.nnoremap("<leader>hA", function()
        harpoon:list():prepend()
        print("Harpoon file prepended: " .. vim.api.nvim_buf_get_name(0))
      end, { desc = "Harpoon file prepend" })

      keys.nnoremap("<leader>ha", function()
        harpoon:list():add()
        print("Harpoon file appended: " .. vim.api.nvim_buf_get_name(0))
      end, { desc = "Harpoon file append" })

      keys.nnoremap("<leader>hh", function()
        require("harpoon").ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon file quick menu" })

      keys.nnoremap("<leader>hn", function()
        harpoon:list():next()
      end, { desc = "Harpoon next target" })

      keys.nnoremap("<leader>hp", function()
        harpoon:list():prev()
      end, { desc = "Harpoon previous target" })

      -- Quick map the entries in the harpoon list
      for i = 1, 5 do
        keys.nnoremap("<leader>" .. i, function()
          harpoon:list():select(i)
        end, { desc = "Harpoon to File: " .. i })
      end
    end,
  },
}
