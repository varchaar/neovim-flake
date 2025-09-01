return {
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
        image = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false }, -- we set this in options.lua
        -- toggle = { map = LazyVim.safe_keymap_set },
        words = { enabled = true },
        picker = {
          sources = {
            noice = {
              confirm = { "yank", "close" },
            },
          },
        },
      }
    end,
  },
}
