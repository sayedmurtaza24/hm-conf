vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.laststatus = 3

vim.opt.splitright = true

vim.opt.cursorline = true
vim.opt.scrolloff = 8     -- Lines of context around the cursor
vim.opt.sidescrolloff = 8 -- Columns of context around the cursor
vim.opt.wrap = false      -- Disable line wrapping
vim.opt.showmode = false

vim.o.virtualedit = 'block'

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.foldcolumn = '1'
vim.opt.signcolumn = 'yes'

vim.opt.winblend = 1

-- Search
vim.opt.ignorecase = true -- Case insensitive search...
vim.opt.smartcase = true  -- ...unless uppercase is present
vim.opt.hlsearch = true   -- Enable highlight search
vim.opt.incsearch = true  -- Show matches while typing
vim.opt.wrapscan = true   -- Search wraps around the end

vim.opt.sessionoptions:append 'globals'
vim.opt.sessionoptions:append 'buffers'
vim.opt.sessionoptions:append 'tabpages'

-- save and quit
vim.cmd("command! W :w")
vim.cmd("command! WA :wa")
vim.cmd("command! Wq :wq")
vim.cmd("command! Q :q")
vim.cmd("command! Qa :qa")
vim.cmd("command! WA :wa")
vim.cmd("command! QA :qa")

vim.cmd("packadd cfilter")

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local space_2 = {
  expandtab = "",
  tabstop = "2",
  shiftwidth = "2",
}

local space_4 = {
  expandtab = "",
  tabstop = "4",
  shiftwidth = "4",
}

local tab_4 = {
  noexpandtab = "",
  tabstop = "4",
  shiftwidth = "4",
}

local langs = {
  css = space_2,
  html = space_2,
  javascript = space_2,
  typescript = space_2,
  typescriptreact = space_2,
  go = tab_4,
  rust = space_4,
  c = tab_4,
  cpp = tab_4,
  lua = space_2,
  cs = space_4,
  dart = space_2,
  proto = space_2,
  json = space_2,
  sql = space_2,
  nix = space_2,
}

for lang, options in pairs(langs) do
  local command = "autocmd FileType " .. lang .. " setlocal"
  for opt, val in pairs(options) do
    if string.len(val) < 1 then
      command = command .. " " .. opt
    else
      command = command .. " " .. opt .. "=" .. val
    end
  end
  vim.cmd(command)
end

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params(vim.api.nvim_get_current_win(), "utf-8")
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    -- Disable word highlighting under the cursor
    if client.server_capabilities.documentHighlightProvider then
      client.server_capabilities.documentHighlightProvider = false
    end
  end,
})

vim.api.nvim_create_user_command('CopyBreakpoint', function()
  local breakpoint = "b " .. vim.fn.expand('%') .. ":" .. vim.fn.line('.')
  vim.fn.setreg('+', breakpoint) -- Copy to system clipboard
end, {})

local keycode = vim.keycode or function(x)
  return vim.api.nvim_replace_termcodes(x, true, true, true)
end
local keys = {
  ['cr']        = keycode('<CR>'),
  ['ctrl-y']    = keycode('<C-y>'),
  ['ctrl-y_cr'] = keycode('<C-y><CR>'),
}

_G.cr_action = function()
  if vim.fn.pumvisible() ~= 0 then
    -- If popup is visible, confirm selected item or add new line otherwise
    local item_selected = vim.fn.complete_info()['selected'] ~= -1
    return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
  else
    -- If popup is not visible, use plain `<CR>`. You might want to customize
    -- according to other plugins. For example, to use 'mini.pairs', replace
    -- next line with `return require('mini.pairs').cr()`
    return keys['cr']
  end
end

vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', { expr = true })
