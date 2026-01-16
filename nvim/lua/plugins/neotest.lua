return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
    -- { "fredrikaverpil/neotest-golang", version = "*" },
  },
  keys = {
    {
      '<leader>tt',
      function()
        require("neotest").run.run()
      end,
      silent = true
    },
    {
      '<leader>td',
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      silent = true
    },
    {
      '<leader>ta',
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      silent = true
    },
    {
      '<leader>to',
      function()
        require("neotest").output.open()
      end,
      silent = true
    },
  },
  -- config = function()
  --   local neotest_golang_opts = {} -- Specify custom configuration
  --   require("neotest").setup({
  --     adapters = {
  --       require("neotest-golang")(neotest_golang_opts), -- Registration
  --     },
  --   })
  -- end,

  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      -- your neotest config here
      adapters = {
        require("neotest-go"),
      },
    })
  end,
}
