return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		dependencies = { "tpope/vim-fugitive" },
		enabled = vim.g.enabled_plugins,
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "" },
				changedelete = { text = "~" },
				--add = { text = "▎" },
				--change = { text = "▎" },
				--delete = { text = "" },
				--topdelete = { text = "" },
				--changedelete = { text = "▎" },
				--untracked = { text = "▎" },
			},
			current_line_blame = true,
		},
		config = function(_,opts)
			local gs = require("gitsigns")
			gs.setup(opts)

			local keys = require("config.utils")

			---- Navigation
			keys.nnoremap("]h", function() gs.nav_hunk("next") end, { desc = "Next Hunk" })
			keys.nnoremap("[h", function() gs.nav_hunk("prev") end, { desc = "Prev Hunk" })

      keys.nnoremap("<leader>gb", function()
        gs.toggle_current_line_blame()
      end, { desc = "Toggle Git Blame" })
		end,
	},
}
