return {
  'echasnovski/mini.trailspace',
  event = "VeryLazy",
  version = '*',
  opts = {
    only_in_normal_buffers = true,
  },
  config = function(_, opts)
    require("mini.trailspace").setup(opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = MiniTrailspace.trim,
    })
  end
}
