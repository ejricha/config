local utils = require("config.utils")
utils.nnoremap("gh", ":LspClangdSwitchSourceHeader<CR>", {})

return {
  cmd = {
    "clangd",
    "--enable-config",
    "--query-driver=/usr/bin/gcc-12",
    "--offset-encoding=utf-16",
    "--background-index",
    "--background-index-priority=normal",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--header-insertion-decorators",
    "-j=20",
    "--log=verbose",
    "--pretty",
    "--pch-storage=memory",
  },
  filetypes = {
    "c",
    "h",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
    "hpp",
  },
}
