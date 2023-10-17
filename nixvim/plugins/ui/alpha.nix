{
  pkgs,
  config,
  ...
}: {
  extraPlugins = [
    config.plugins.alpha.package
    pkgs.vimPlugins.pokemon-nvim
  ];

  extraConfigLua = ''
    local dashboard = require("alpha.themes.dashboard")
    local pokemon = require('pokemon')

    math.randomseed(os.time())
    local pokemonNumber = string.format("%04d", math.random(1, 493))
    pokemon.setup({
      number = pokemonNumber,
      size = 'auto',
    })
    dashboard.section.header.val = pokemon.header()

    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e ~/.dotfiles <CR>"),
      dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("p", "󰐝 " .. " Open Pokedex", ":PokemonTogglePokedex <CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    -- dashboard.opts.layout[1].val = 8
    require("alpha").setup(dashboard.opts)
  '';
}
