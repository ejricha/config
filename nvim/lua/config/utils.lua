local M = {}

local function bind(mode, outer_opts)
  -- Wrapper function for setting keymaps
  outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})

  return function(keybind, cmd, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(mode, keybind, cmd, opts)
  end
end

--M.map = bind("", { noremap = false })
--M.nmap = bind("n", { noremap = true })
M.nnoremap = bind("n", { noremap = true })
M.vnoremap = bind("v", { noremap = true })
M.xnoremap = bind("x", { noremap = true })
M.inoremap = bind("i", { noremap = true })
M.tnoremap = bind("t", { noremap = true })

M.is_git_directory = function()
  local result = vim.fn.system("git rev-parse --is-inside-work-tree")
  if vim.v.shell_error == 0 and result:find("true") then
    return true
  else
    return false
  end
end

M.force_format_full = function()
  print("Formatting full document")
  vim.lsp.buf.format()
end

M.format_on_save = true

local cache_path = vim.fn.stdpath("data") .. package.config:sub(1, 1) .. "iro.json"

local function load_user_settings()
  local file = io.open(cache_path, "r")
  if not file then
    return
  end

  local json_data = file:read("*a")
  local settings = vim.fn.json_decode(json_data)
  M.format_on_save = settings.format_on_save
end
load_user_settings()

local function save_user_settings()
  local file = io.open(cache_path, "w")
  if not file then
    error("Failed to save settings to:" .. cache_path)
  end

  local save_settings = {
    format_on_save = M.format_on_save,
  }

  local json_object = vim.fn.json_encode(save_settings)
  file:write(json_object)
  file:close()
end

vim.api.nvim_create_user_command("FormatToColumn", function(opts)
  -- Retrieve the delimiter from the user's argument or default to a space (" ")
  local delimiter = opts.args ~= "" and opts.args or " "
  -- Get the current visual selection range
  local start_pos = vim.fn.getpos("'<") -- Start of the selection
  local end_pos = vim.fn.getpos("'>")  -- End of the selection
  -- Ensure the command is run only on a selection
  if start_pos[2] > 0 and end_pos[2] > 0 then
    -- Escape special characters in the delimiter for the shell command
    local escaped_delimiter = vim.fn.escape(delimiter, "'")
    -- Format the selected lines using the external 'column' command with the provided delimiter
    vim.cmd(string.format("'<,'>!column -t -o '%s'", escaped_delimiter))
  else
    print("Please select text in visual mode.")
  end
end, {
  range = true,
  nargs = "?", -- Command accepts zero or one argument
  desc = "Formats text into aligned columns using external 'column' command. Optionally pass a delimiter.",
})

vim.api.nvim_create_user_command("BlameDiff", function()
  -- Get the current file and line number
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")

  local path = "/var/tmp/diff.lua"

  local ok, err = pcall(dofile, path)
  if not ok then
    print("Failed to load " .. path .. ": " .. err)
    return
  end

  if type(Annotate) == "function" then
    Annotate(file, line)
  else
    print("Annotate() is not defined in " .. path)
  end

  -- -- Run git blame to get the commit hash for the current line
  -- local blame_cmd = string.format("git blame -L %d,%d --porcelain -- %s", line, line, vim.fn.shellescape(file))
  -- local handle = io.popen(blame_cmd)
  -- if not handle then
  --   print("Failed to run git blame")
  --   return
  -- end
  --
  -- local output = handle:read("*l") -- first line of --porcelain output is the commit hash
  -- handle:close()
  --
  -- local commit = output:match("^[0-9a-f]+")
  -- if not commit or commit == "0000000000000000000000000000000000000000" then
  --   print("No valid commit found for current line")
  --   return
  -- end
  --
  -- -- Use :Git diff <parent> <commit>
  -- local cmd = string.format("Git diff %s~1 %s", commit, commit)
  -- vim.cmd(cmd)
end, {
  desc = "Git diff between current line's blamed commit and its parent",
})

vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
  M.format_on_save = not M.format_on_save
  save_user_settings()
  if M.format_on_save then
    print("Enabled format on save")
  else
    print("Disabled format on save")
  end
end, {})

M.smart_format = function()
  if M.format_on_save and M.is_git_directory() and vim.fn.exists(":FormatModifications") ~= 0 then
    --print("Formatting modifications only")
    vim.cmd("FormatModifications")
  else
    M.force_format_full()
  end
end

M.cmd_runner = vim.fn.stdpath("data") .. package.config:sub(1, 1) .. "run.sh"

-- Return a "runnable" script. local scripts take priority, followed by cache
M.find_runner = function()
  -- if there is a runer in the local directory
  local local_runner = vim.fn.getcwd() .. "/run.sh"
  if vim.fn.filereadable(local_runner) == 1 then
    return local_runner
  elseif vim.fn.filereadable(M.cmd_runner) == 1 then
    return M.cmd_runner
  end
  print(M.cmd_runner)
  return nil
end

return M
