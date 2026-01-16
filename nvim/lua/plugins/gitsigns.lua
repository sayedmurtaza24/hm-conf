return {
  'lewis6991/gitsigns.nvim',
  event = "BufReadPre",
  opts = {
    current_line_blame = true
  },
  keys = {
    { '<leader>bl', ':Gitsigns blame_line<CR>',   silent = true },
    { ']h',         ':Gitsigns next_hunk<CR>',    silent = true },
    { '[h',         ':Gitsigns prev_hunk<CR>',    silent = true },
    { '<leader>hp', ':Gitsigns preview_hunk<CR>', silent = true },
    { '<leader>hr', ':Gitsigns reset_hunk<CR>',   silent = true },
  }
}
