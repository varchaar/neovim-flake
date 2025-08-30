return {
    -- {
    --   "2KAbhishek/nerdy.nvim",
    --   dependencies = {
    --     "stevearc/dressing.nvim",
    --     "nvim-telescope/telescope.nvim",
    --   },
    --   cmd = "Nerdy",
    --   keys = {
    --     { "<leader>n", "<cmd>Nerdy<CR>", "Pick icon" },
    --   },
    -- },
    {
        "stevearc/oil.nvim",
        event = "VeryLazy",
        config = true,
        keys = {
            { "-", "<cmd>Oil<CR>", desc = "Open Oil" },
        },
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
                "size",
            },
        },
    },
    {
        "folke/snacks.nvim",
        dependencies = {
            "ColaMint/pokemon.nvim",
            "varchaar/chameleon.nvim",
        },
        opts = function()
            local pokemon = require("pokemon")
            math.randomseed(os.time())
            local pokemonNumber = string.format("%04d", math.random(1, 493))
            pokemon.setup({
                number = pokemonNumber,
                size = "auto",
            })
            return {
                dashboard = {
                    preset = {
                        header = table.concat(pokemon.header(), "\n"),
                        -- stylua: ignore
                        keys = {
                            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                            { icon = "󰐝 ", key = "p", desc = "Pokédex", action = ":PokemonTogglePokedex" },
                            -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
                            -- { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                            {
                                icon = " ",
                                key = "q",
                                desc = "Quit",
                                action = function()
                                    require("chameleon").restore()
                                    vim.api.nvim_command(":qa")
                                end
                            },
                        },
                    },
                },
                explorer = {
                    replace_netrw = true,
                },
            }
        end,
    },
    -- {
    --   "goolord/alpha-nvim",
    --   event = "VimEnter",
    --   dependencies = {
    --     "ColaMint/pokemon.nvim",
    --     "varchaar/chameleon.nvim",
    --   },
    --   enabled = true,
    --   init = false,
    --   opts = function()
    --     local dashboard = require("alpha.themes.dashboard")
    --     local pokemon = require("pokemon")
    --     math.randomseed(os.time())
    --     local pokemonNumber = string.format("%04d", math.random(1, 493))
    --     pokemon.setup({
    --       number = pokemonNumber,
    --       size = "auto",
    --     })
    --
    --     dashboard.section.header.val = pokemon.header()
    --     -- stylua: ignore
    --     dashboard.section.buttons.val = {
    --       dashboard.button("f", " " .. " Find file",       LazyVim.pick()),
    --       dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
    --       dashboard.button("r", " " .. " Recent files",    LazyVim.pick("oldfiles")),
    --       dashboard.button("g", " " .. " Find text",       LazyVim.pick("live_grep")),
    --       dashboard.button("c", " " .. " Config",          LazyVim.pick.config_files()),
    --       dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
    --       dashboard.button("p", "󰐝 " .. " Pokédex",         [[<cmd> PokemonTogglePokedex <cr>]]),
    --       dashboard.button("q", " " .. " Quit",            [[<cmd> lua require("chameleon").restore() <cr><cmd> qa <cr>]]),
    --     }
    --     for _, button in ipairs(dashboard.section.buttons.val) do
    --       button.opts.hl = "AlphaButtons"
    --       button.opts.hl_shortcut = "AlphaShortcut"
    --     end
    --     dashboard.section.header.opts.hl = "AlphaHeader"
    --     dashboard.section.buttons.opts.hl = "AlphaButtons"
    --     dashboard.section.footer.opts.hl = "AlphaFooter"
    --     return dashboard
    --   end,
    --   config = function(_, dashboard)
    --     -- close Lazy and re-open when the dashboard is ready
    --     if vim.o.filetype == "lazy" then
    --       vim.cmd.close()
    --       vim.api.nvim_create_autocmd("User", {
    --         once = true,
    --         pattern = "AlphaReady",
    --         callback = function()
    --           require("lazy").show()
    --         end,
    --       })
    --     end
    --
    --     require("alpha").setup(dashboard.opts)
    --
    --     vim.api.nvim_create_autocmd("User", {
    --       once = true,
    --       pattern = "LazyVimStarted",
    --       callback = function()
    --         local stats = require("lazy").stats()
    --         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    --         dashboard.section.footer.val = "⚡ Neovim loaded "
    --           .. stats.loaded
    --           .. "/"
    --           .. stats.count
    --           .. " plugins in "
    --           .. ms
    --           .. "ms"
    --         pcall(vim.cmd.AlphaRedraw)
    --       end,
    --     })
    --   end,
    -- },
    -- {
    --   "nvimdev/dashboard-nvim",
    --   enabled = false,
    -- },
}
