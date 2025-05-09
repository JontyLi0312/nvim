return {
  {
    "mfussenegger/nvim-dap",
    recommended = true,
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      "rcarriga/nvim-dap-ui",
      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
  -- stylua: ignore
    keys = {
      {"<f4>", function() require("dap").terminate() end, desc = "dap terminate"},
      {"<f5>", function() require("dap").continue() end, desc = "dap launch/continue"},
      {"<f8>", function() require("dap").step_out() end, desc = "step out"},
      {"<f9>", function() require("dap").step_into() end, desc = "step into"},
      {"<f10>", function() require("dap").step_over() end, desc = "step over"},
    },
    opts = function()
      local dap = require("dap")
      dap.set_log_level("ERROR")

      -- dap.configurations.c = {
      --   {
      --     name = "Launch file",
      --     type = "cppdbg",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/bin", "file")
      --     end,
      --     cwd = "${workspaceFolder}",
      --     stopAtEntry = true,
      --   },
      --   {
      --     name = "Attach to gdbserver :1234",
      --     type = "cppdbg",
      --     request = "launch",
      --     MIMode = "gdb",
      --     miDebuggerServerAddress = "localhost:1234",
      --     miDebuggerPath = "/usr/bin/gdb",
      --     cwd = "${workspaceFolder}",
      --     program = function()
      --       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      --     end,
      --   },
      -- }

      -- if not dap.adapters["codelldb"] then
      --   dap.adapters["codelldb"] = {
      --     type = "server",
      --     host = "localhost",
      --     port = "${port}",
      --     executable = {
      --       command = "codelldb",
      --       args = {
      --         "--port",
      --         "${port}",
      --       },
      --     },
      --   }
      -- end

      -- local mason_path = vim.fn.glob(vim.fn.stdpath("data")) .. "/mason/"
      -- local cppdbg_exec_path = mason_path .. "packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
      --
      -- if not dap.adapters["cppdbg"] then
      --   require("dap").adapters["cppdbg"] = {
      --     id = "cppdbg",
      --     type = "executable",
      --     command = cppdbg_exec_path,
      --     args = {},
      --   }
      -- end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
        --- @param buf number
        --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
        --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
        --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
        --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
        display_callback = function(variable, buf, stackframe, node, options)
          -- by default, strip out new line characters
          if options.virt_text_pos == "inline" then
            return " = " .. variable.value:gsub("%s+", " ")
          else
            return variable.name .. " = " .. variable.value:gsub("%s+", " ")
          end
        end,
        -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
        virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

        -- experimental features:
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      })
    end,
  },
  {
    "LiadOz/nvim-dap-repl-highlights",
    config = function()
      require("nvim-dap-repl-highlights").setup()
    end,
  },
  {},
}
