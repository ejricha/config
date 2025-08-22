local userGroup = vim.api.nvim_create_augroup("UserGroup", {})

-- When editing a file save the last known cursor position. Make sure that
-- the context is an actual file and not a git commit
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Remeber the last place we left a cursor",
  group = userGroup,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) <= vim.fn.line("$")
    local not_commit = vim.b[args.buf].filetype ~= "commit"

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local utils = require("config.utils")
    local map = function(keys, func, desc)
      utils.nnoremap(keys, func, { desc = "LspAttach: " .. desc })
    end
    local buffer = event.buf
    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    if client.server_capabilities.documentHighlightProvider then
      -- Highlight any words that are similar across a document.
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = buffer,
        callback = vim.lsp.buf.document_highlight,
      })

      -- Clear them out once you've moved.
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = buffer,
        callback = vim.lsp.buf.clear_references,
      })
    end

    -- local formatter = require("lsp-format-modifications")
    -- local cur_buff = vim.api.nvim_get_current_buf()
    -- local conf = require("conform")
    -- local f = conf.list_formatters_for_buffer(cur_buff)
    -- for i, value in ipairs(f) do
    --   vim.notify("We have the buffer: " .. i .. "name: " .. value)
    -- end
    --
    -- local is_supported = true
    -- -- is_supported = is_supported and client.server_capabilities.documentRangeFormattingProvider
    -- if is_supported then
    --   local format_mods = function()
    --     formatter.format_modifications(client, buffer)
    --   end
    --
    --   -- Generate user command to save on modifications.
    --   vim.api.nvim_buf_create_user_command(buffer, "FormatModifications", format_mods, {})
    --   local group = vim.api.nvim_create_augroup("FormatModDocumentGroup", { clear = false })
    --   vim.api.nvim_clear_autocmds({ group = group, buffer = buffer })
    --   vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    --     group = group,
    --     buffer = buffer,
    --     callback = function()
    --       if utils.format_on_save then
    --         format_mods()
    --       end
    --     end,
    --   })
    -- end
  end
})
