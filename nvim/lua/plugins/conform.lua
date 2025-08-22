-- local function is_git_dir()
--   local result = vim.fn.system("git rev-parse --is-inside-work-tree")
--   if vim.v.shell_error == 0 and result:find("true") then
--     return true
--   else
--     return false
--   end
-- end

local function format_hunks()
  local ignore_filetypes = { "lua" }
  -- vim.notify("Filetype - " .. vim.bo.filetype)
  if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
    -- vim.notify("range formatting for " .. vim.bo.filetype .. " not working properly.")
    return
  end

  local hunks = require("gitsigns").get_hunks(vim.api.nvim_get_current_buf())
  if hunks == nil then
    return
  end

  local format = require("conform").format

  local function format_range()
    if next(hunks) == nil then
      return
    end
    local hunk = nil
    while next(hunks) ~= nil and (hunk == nil or hunk.type == "delete") do
      hunk = table.remove(hunks)
    end

    if hunk ~= nil and hunk.type ~= "delete" then
      local start = hunk.added.start
      local last = start + hunk.added.count
      -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
      local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
      local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
      format({ range = range, async = true, lsp_fallback = true }, function()
        vim.defer_fn(function()
          format_range()
        end, 1)
      end)
    end
  end

  format_range()
end

local function format_full()
  local cur_buff = vim.api.nvim_get_current_buf()
  local conf = require("conform")
  local f = conf.list_formatters_for_buffer(cur_buff)
  if f then
    conf.format({ lsp_format = "fallback" })
    for i, value in ipairs(f) do
      vim.notify("We have the buffer: " .. i .. "name: " .. value)
    end
  end
end

local function format_file()
  local hunks = require("gitsigns").get_hunks(vim.api.nvim_get_current_buf())
  if hunks then
    -- vim.notify("Formatting hunks")
    format_hunks()
  -- else
  --   format_full()
  end
end

return {
  "stevearc/conform.nvim",
  dependencies = { "lewis6991/gitsigns.nvim" },
  enabled = vim.g.enabled_plugins,
  opts = {
    formatters_by_ft = {
      sh = { "shfmt" },
      lua = { "stylua" },
      -- go = { "goimports", "golines", "gofmt" },
      python = { "black" },
    },

    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function()
      format_file()
    end
  },
}
