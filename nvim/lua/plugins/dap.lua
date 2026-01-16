return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
      {
        "rcarriga/nvim-dap-ui",
        opts = {},
        cmd = "DapUI"
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
      },
    },
    lazy = true,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
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
      vim.api.nvim_create_user_command("DapClose", function()
        dapui.close()
      end, {})
      vim.api.nvim_create_user_command("DapGo", function(opts)
        local program = opts.args ~= "" and opts.args or vim.fn.input('Path to main: ', './main.go', 'file')
        require 'dap'.run({ type = "go", request = "launch", program = program })
      end, { nargs = '?' })
    end,
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>if", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
        { "<C-.>",      function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
        { "<C-,>",      function() require("dap").step_over() end,                                            desc = "Step Over" },
        { "<C-;>",      function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
        { "<leader>si", function() require("dap").step_into() end,                                            desc = "Step Into" },
        { "<leader>so", function() require("dap").step_out() end,                                             desc = "Step Out" },
        { "<C-c>",      function() require("dap").continue() end,                                             desc = "Continue" },
        { "<C-S-x>",    function() require("dap").terminate() end,                                            desc = "Terminate" },
        { "D",          function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
        { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
        { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
        { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
        { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
        { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
        { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
      }
    end,
  }
}
