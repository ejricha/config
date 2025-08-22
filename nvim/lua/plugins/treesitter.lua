-- TODO: This conflicts with snacks nvim for whatever reason
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    event = { "VeryLazy" },
    dependencies = {
      -- Additional text objects for treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    enabled = vim.g.enabled_plugins,
    build = { ":TSUpdate", ":TSInstall regex" },
    opts = {
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "json",
        "lua",
        "markdown",
        "python",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "vim",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "cpp", "c" },
      },

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "tree-sitter-grammars/tree-sitter-markdown",
    event = { "VeryLazy" },
    enabled = vim.g.enabled_plugins,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
