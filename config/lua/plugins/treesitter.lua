return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      vim.opt.rtp:prepend(vim.g.treesitter_path)
      require("lazy.core.loader").add_to_rtp(plugin)
      -- require("nvim-treesitter.install e")
    end,
    opts_extend = {},
    opts = {
      auto_install = false,
      ensure_installed = {},
      parser_install_dir = vim.g.treesitter_path .. "/parsers",
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
            ["ix"] = "@comment.inner",
            ["ax"] = "@comment.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]a"] = "@parameter.inner",
            ["]m"] = "@function.outer",
          },
          goto_next_end = {
            ["]A"] = "@parameter.outer",
            ["]M"] = "@function.outer",
          },
          goto_previous_start = {
            ["[a"] = "@parameter.outer",
            ["[m"] = "@function.outer",
          },
          goto_previous_end = {
            ["[A"] = "@parameter.outer",
            ["[M"] = "@function.outer",
          },
        },
      },
    },
  },
}
