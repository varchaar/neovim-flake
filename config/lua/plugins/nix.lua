return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        nil_ls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        nix = { "nixfmt", "injected" },
      },
    },
  },
  {
    "figsoda/nix-develop.nvim",
    event = "VeryLazy",
  },
}
