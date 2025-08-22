return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  enabled = true,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    image = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    picker = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    explorer = {
      replace_netrw = false,
      enabled = true
    },
    terminal = {
      enabled = true,
      win = {
        style = "float"
      },
    },
    statuscolumn = { enabled = true },
    -- words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    -- Picker Explorer
    { "<leader>fe",       function() Snacks.explorer() end,                                         desc = "Explorer" },
    { "<leader>bb",       function() Snacks.picker.buffers() end,                                   desc = "Buffers" },
    { "<leader>ff",       function() Snacks.picker.smart({ exclude = { ".git" } }) end,             desc = "Smart find files" },
    -- Picker File Finder
    { "<leader>fF",       function() Snacks.picker.files() end,                                     desc = "Find Files" },
    { "<leader>fr",       function() Snacks.picker.recent({ dirs = { vim.fn.expand('%:h') } }) end, desc = "Find Recent" },
    -- Picker File Grep
    { "<leader>gf",       function() Snacks.picker.grep() end,                                      desc = "Grep from project root" },
    { "<leader>gl",       function() Snacks.picker.grep({ dirs = { vim.fn.expand('%:h') } }) end,   desc = "Grep down from current buffer" },
    -- Picker File LSP
    { "gd",               function() Snacks.picker.lsp_definitions() end,                           desc = "Goto Definition" },
    { "gD",               function() Snacks.picker.lsp_declarations() end,                          desc = "Goto Declaration" },
    { "gr",               function() Snacks.picker.lsp_references() end,                            nowait = true,                         desc = "References" },
    { "gI",               function() Snacks.picker.lsp_implementations() end,                       desc = "Goto Implementation" },
    { "<leader>ggb",      function() Snacks.git.blame_line() end,                                   desc = "Git Blame Line" },
    { "<leader>lg",       function() Snacks.lazygit() end,                                          desc = "Lazygit" },
    { "<leader><leader>", function() vim.cmd.noh() Snacks.notifier.hide() end,                      desc = "Dismiss All Notifications" },
    { "<leader>n",        function() Snacks.notifier.show_history() end,                            desc = "Notification History" },
    { "<leader>.",        function() Snacks.scratch() end,                                          desc = "Toggle Scratch Buffer" },
    { "<leader>tr",       function() Snacks.terminal(nil, {}) end,                                  desc = "Toggle Terminal" },
    { "<leader>tt",       function() Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") }) end,    desc = "Toggle Terminal" },
    { "<leader>z",        function() Snacks.zen() end,                                              desc = "Toggle Zen Mode" },
    { "<leader>Z",        function() Snacks.zen.zoom() end,                                         desc = "Toggle Zoom" },
    -- { "<c-/>",            mode = "t",                                                               "<cmd>close<cr>",                      desc = "Close term window" },
    -- { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
    -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    -- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
    -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
  }
}
