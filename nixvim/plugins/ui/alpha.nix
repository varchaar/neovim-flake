{
  pkgs,
  config,
  ...
}: let
  pokemon-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "pokemon.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ColaMint";
      repo = "pokemon.nvim";
      rev = "50c618f88f1ee7cbd0e0d8194176b0d47f6f1c40";
      sha256 = "ZTMkSe7PZYOvdUwgx6x9iruwQ/ioxTPzRFeOh4LAylM=";
    };
  };
  
in {
  extraPlugins = [
    config.plugins.alpha.package
    pokemon-nvim
  ];

  extraConfigLua = ''
    local dashboard = require("alpha.themes.dashboard")
    local pokemon = require('pokemon')

    math.randomseed(os.time())
    local pokemonNumber = string.format("%04d", math.random(1, 493)) 
    pokemon.setup({
      number = pokemonNumber, 
      size = 'tiny',
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
    dashboard.opts.layout[1].val = 8
    require("alpha").setup(dashboard.opts)
  '';
}
