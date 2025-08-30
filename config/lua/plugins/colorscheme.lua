return {
    { "rebelot/kanagawa.nvim", priority = 1000, event = "VeryLazy" },
    { "Mofiqul/dracula.nvim",  priority = 1000, event = "VeryLazy" },
    { "folke/tokyonight.nvim", priority = 1000, event = "VeryLazy" },
    { "Mofiqul/vscode.nvim",   priority = 1000, event = "VeryLazy" },
    {
        "varchaar/chameleon.nvim",
        event = "VeryLazy",
        config = function()
            require("chameleon").setup("0.8", "5")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        init = function()
            local bufline = require("catppuccin.groups.integrations.bufferline")
            function bufline.get()
                return bufline.get_theme()
            end
        end,
    },
    {
        "LazyVim/LazyVim",
        dependencies = { "varchaar/chameleon.nvim" },
        opts = {
            news = { lazyvim = false },
            colorscheme = "catppuccin",
            -- colorscheme = function()
            --   -- local colorscheme = require("huez-manager.api.colorscheme").get()
            --   -- vim.cmd("colorscheme " .. colorscheme)
            --   require("chameleon").apply()
            --   return "catppuccin"
            -- end,
        },
    },
    -- {
    --   "nvim-telescope/telescope.nvim",
    --   keys = {
    --     { "<leader>uC", false },
    --   },
    -- },
    -- {
    --   "vague2k/huez.nvim",
    --   branch = "stable",
    --   event = "UIEnter",
    --   config = function()
    --     require("huez").setup({
    --       fallback = "catppuccin",
    --     })
    --   end,
    --   keys = {
    --     { "<leader>uC", "<cmd>Huez<CR>", desc = "Colorscheme with Preview" },
    --   },
    -- },
}
