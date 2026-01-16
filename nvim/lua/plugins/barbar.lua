return {
  'romgrk/barbar.nvim',
  event = "BufEnter",
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  version = '^1.0.0',              -- optional: only update when a new 1.x version is released
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    auto_hide = false,
    icons = {
      pinned = { button = '', filename = true },
    },
    exclude_ft = { '', 'snacks_win' },
  },
  keys = {
    { "<A-x>",      ":BufferClose<CR>",             silent = true },
    { "<leader>bp", ":BufferPin<CR>",               silent = true },
    { "<leader>xx", ":BufferCloseAllButPinned<CR>", silent = true },
    {
      "H",
      function()
        vim.cmd("BufferPrevious")
      end,
      silent = true
    },
    {
      "L",
      function()
        vim.cmd("BufferNext")
      end,
      silent = true
    },
  }
}
