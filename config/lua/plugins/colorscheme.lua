return {
  { "rebelot/kanagawa.nvim", priority = 1000, event = "VeryLazy" },
  { "Mofiqul/dracula.nvim", priority = 1000, event = "VeryLazy" },
  { "folke/tokyonight.nvim", priority = 1000, event = "VeryLazy" },
  { "Mofiqul/vscode.nvim", priority = 1000, event = "VeryLazy" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, event = "VeryLazy" },
  {
    "LazyVim/LazyVim",
    dependencies = "vague2k/huez.nvim",
    opts = {
      news = { lazyvim = false },
      colorscheme = function()
        local colorscheme = require("huez-manager.api.colorscheme").get()
        vim.cmd("colorscheme " .. colorscheme)
      end,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>uC", false },
    },
  },
  {
    "vague2k/huez.nvim",
    branch = "stable",
    event = "UIEnter",
    config = function()
      require("huez").setup({
        fallback = "catppuccin",
      })
    end,
    keys = {
      { "<leader>uC", "<cmd>Huez<CR>", desc = "Colorscheme with Preview" },
    },
  },
}
