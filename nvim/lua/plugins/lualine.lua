local function macro_recording()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  else
    return " @" .. reg
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = vim.g.enabled_plugins,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function(_, opts)
    opts.options = {
      icons_enabled        = true,
      theme                = "auto",
      -- section_separators   = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    }
    opts.sections = {
      -- View the current edit mode
      lualine_a = { "mode" },
      -- Display the current branch (Only visible when within git repo)
      lualine_b = {
        { "branch" },
      },
      -- Show any diagnostic information information
      lualine_c = {
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
        { "filetype", icon_only = true, separator = "" },
        { "filename", path = 3, },
      },
      lualine_x = {
        macro_recording,
      },
      lualine_y = {
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            hint = " ",
            info = " ",
          },
        },
        "progress"
      },
      lualine_z = {
        "location"
      },
    }
  end,

  config = function(_, opts)
    local lualine = require("lualine")
    lualine.setup(opts)

    -- instant updates when starting/stopping a recording
    vim.api.nvim_create_autocmd("RecordingEnter", {
      callback = function()
        lualine.refresh({ place = { "statusline" }, trigger = "autocmd" })
      end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
      callback = function()
        -- wait one tick so reg_recording() becomes ""
        vim.schedule(function()
          lualine.refresh({ place = { "statusline" }, trigger = "autocmd" })
        end)
      end,
    })
  end
}
