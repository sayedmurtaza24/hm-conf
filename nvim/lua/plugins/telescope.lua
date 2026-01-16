return {
  'nvim-telescope/telescope.nvim',
  enabled = false,
  event = "BufReadPre",
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
  },
  opts = function()
    return {
      defaults = {
        layout_config = {
          horizontal = {
            height = 0.95,
            preview_cutoff = 120,
            prompt_position = "bottom",
            width = 0.95,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require("telescope.themes").get_cursor {}
        },
      }
    }
  end,
  keys = {
    { '<leader><leader>', ':Telescope find_files theme=get_ivy<CR>', silent = true },
    { '<leader>fw',       ':Telescope live_grep theme=get_ivy<CR>',  silent = true },
    { '<leader>fr',       ':Telescope resume theme=get_ivy<CR>',     silent = true },
    { '<leader>bb',       ':Telescope buffers theme=get_ivy<CR>',    silent = true },
    -- { 'grr',              ':Telescope lsp_references theme=get_ivy<CR>', silent = true },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    telescope.load_extension("fzy_native")
    telescope.load_extension("ui-select")

    require("config.multigrep").setup()
  end
}
