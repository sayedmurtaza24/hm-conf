-- local source_priority = {
--   lsp = 4,
--   buffer = 3,
--   path = 2,
--   snippets = 1,
-- }
--
-- local function priority_sort(a, b)
--   local a_priority = source_priority[a.source_id]
--   local b_priority = source_priority[b.source_id]
--   if a_priority ~= b_priority then return a_priority > b_priority end
-- end
--
return {
  'saghen/blink.cmp',
  lazy = false,
  dependencies = 'rafamadriz/friendly-snippets',
  -- build = 'rustup run nightly cargo build --release',
  version = "1.*",
  opts = {
    keymap = { preset = 'default' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'snippets', 'dadbod', 'buffer' },
      },
      -- add vim-dadbod-completion to your completion providers
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
    signature = {
      enabled = true,
      window = {
        winblend = 1
      },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
        window = {
          winblend = 1
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      use_proximity = false,
      frecency = { enabled = false },
    },
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}
