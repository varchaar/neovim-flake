{
  pkgs,
  config,
  ...
}: {
  extraPlugins = [
    config.plugins.dashboard.package
    pkgs.neovimPlugins.pokemon-nvim
  ];

  extraConfigLua = ''
    local opts = function()
      local pokemon = require('pokemon')

      math.randomseed(os.time())
      local pokemonNumber = string.format("%04d", math.random(1, 493))
      pokemon.setup({
        number = pokemonNumber,
        size = 'auto',
      })
      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = pokemon.header(),
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",              desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                 desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",               desc = " Find text",       icon = " ", key = "g" },
            { action = "e ~/.dotfiles",                     desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "PokemonTogglePokedex",              desc = " Open Pokedex",    icon = "󰐝 ", key = "p" },
            { action = "qa",                                desc = " Quit",            icon = " ", key = "q" },
          },
          footer = {""},
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      return opts
    end

  require('dashboard').setup(opts())
  '';
}
