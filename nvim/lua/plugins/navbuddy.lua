return {
  "SmiteshP/nvim-navbuddy",
  cmd = "NavBuddy",
  lazy = true,
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
  },
  keys = {
    { "<leader>nv", "<cmd>Navbuddy<cr>" },
  },
  opts = {
    lsp = { auto_attach = true },
    window = {
      border = "rounded",
      size = {
        width = "90%",
        height = "80%",
      },
      sections = {
        left = {
          size = "20%",
        },
        mid = {
          size = "35%",
        },
        right = {
          preview = "always",
        },
      },
    },
  },
}
