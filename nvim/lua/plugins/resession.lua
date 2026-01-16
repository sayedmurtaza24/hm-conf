local function get_session_name()
  local name = vim.fn.getcwd()
  local branch = vim.trim(vim.fn.system("git branch --show-current"))
  if vim.v.shell_error == 0 then
    return name .. "--" .. branch
  else
    return name
  end
end

return {
  'stevearc/resession.nvim',
  dependencies = {
    'romgrk/barbar.nvim',
  },
  opts = {
    extensions = {
      barbar = {},
    }
  },
  config = function(_, opts)
    require("resession").setup(opts)

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        require("resession").save(get_session_name(), { notify = false })
      end,
    })

    vim.api.nvim_create_user_command("LoadSession", function()
      require("resession").load(get_session_name(), { silence_errors = true })
    end, {})
  end
}
