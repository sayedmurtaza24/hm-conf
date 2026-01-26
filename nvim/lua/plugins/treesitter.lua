return {
  'nvim-treesitter/nvim-treesitter',
  branch = "master",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ':TSUpdate',
  event = { "VeryLazy", "BufReadPre" },
  lazy = vim.fn.argc(-1) == 0,
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require 'nvim-treesitter.configs'.setup {
      ensure_installed = { "regex", "bash", "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "go", "rust", "html" },
      sync_install = false,
      highlight = { enable = true },
      folding = {
        enable = true,
        disable = {},
      },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.inner",
          },
        },
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ag"] = "@source_file",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ih"] = "@assignment.lhs",
            ["il"] = "@assignment.rhs",
            ["ah"] = "@assignment.lhs",
            ["al"] = "@assignment.rhs",
            ["im"] = "@method.name",
            ["am"] = "@method.name",
            ["ik"] = "@key.name",
            ["ak"] = "@key.name",
            ["iv"] = "@value.name",
            ["av"] = "@value.name",
            -- ["au"] = "@pair",
          },
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V',  -- linewise
            ['@class.outer'] = 'v',     -- linewise
          },
          include_surrounding_whitespace = false,
        },
      },
    }

    local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

    -- Repeat movement with ; and ,
    -- ensure ; goes forward and , goes backward regardless of the last direction
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

    -- vim way: ; goes to the direction you were moving.
    -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

    -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end
}
