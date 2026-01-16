return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd", "prettier", },
      javascriptreact = { "prettierd", "prettier", },
      typescript = { "prettierd", "prettier", },
      typescriptreact = { "prettierd", "prettier", },
    },
    format_on_save = {
      timeout_ms = 1000,
    },
  },
}
