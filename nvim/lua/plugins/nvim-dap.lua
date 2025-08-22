return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },

  config = function()
    local dap = require("dap")
    local keys = require("config.utils")
    keys.nnoremap("<leader>db", dap.toggle_breakpoint, { desc = "[d]dap [b]reakpoint toggle" })
    keys.nnoremap("<leader>dc", dap.continue, { desc = "[d]dap [c]continue" })

    keys.nnoremap("<F1>", dap.continue, { desc = "dap [continue]" })
    keys.nnoremap("<F2>", dap.step_into, { desc = "dap [step into]" })
    keys.nnoremap("<F3>", dap.step_over, { desc = "dap [step over]" })
    keys.nnoremap("<F4>", dap.step_out, { desc = "dap [step out]" })
    keys.nnoremap("<F5>", dap.step_back, { desc = "dap [step back]" })
    keys.nnoremap("<F13>", dap.restart, { desc = "dap [restart]" })

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Attach to gdbserver :1234",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
    }

    -- UI setup
    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
