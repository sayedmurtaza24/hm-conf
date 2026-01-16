local servers = {
  pylsp = {},
  biome = {},
  ts_ls = {},
  eslint = {},
  lua_ls = {},
  gopls = {},
  protols = {},
  rust_analyzer = {},
  dartls = {},
  jsonls = {},
  zls = {},
  tailwindcss = {},
  dart_ls = {},
}

return {
  "neovim/nvim-lspconfig",
  lazy = true,
  event = { "BufEnter", "BufReadPost" },
  dependencies = {
    "saghen/blink.cmp",
    {
      "williamboman/mason.nvim",
      config = function()
        local ensure_installed = { "prettier" }
        for ls, _ in pairs(servers) do
          table.insert(ensure_installed, ls)
        end
        require("mason").setup({
          ensure_installed = ensure_installed,
        })
      end,
    },
  },
  config = function()
    for ls, _ in pairs(servers) do
      vim.lsp.enable(ls)
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        vim.keymap.set("n", "grn", vim.lsp.buf.rename)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        vim.keymap.set("n", "gff", vim.lsp.buf.format)

        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "<leader>dg", function()
          vim.diagnostic.setqflist({
            severity = "ERROR",
          })
        end)

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        local formatting = "textDocument/formatting"
        local onTypeFormatting = "textDocument/onTypeFormatting"
        ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
        if (client.supports_method(formatting) or client.supports_method(onTypeFormatting))
            and client.name ~= "protols" and client.name ~= "ts_ls" then
          -- Format the current buffer on save
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
          })
        end
      end,
    })
  end
}
