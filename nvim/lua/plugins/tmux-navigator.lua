vim.keymap.set("t", "<C-h>", [[<C-\><C-n><Cmd>TmuxNavigateLeft<CR>]], { silent = true, noremap = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><Cmd>TmuxNavigateDown<CR>]], { silent = true, noremap = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><Cmd>TmuxNavigateUp<CR>]], { silent = true, noremap = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><Cmd>TmuxNavigateRight<CR>]], { silent = true, noremap = true })

return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>",  mode = { "n" } },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>",  mode = { "n" } },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>",    mode = { "n" } },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", mode = { "n" } },
  },
}
