{ pkgs
, inputs
, lib
, ...
}:
let
  # Build plugins from github
  # huez-nvim = pkgs.vimUtils.buildVimPlugin { name = "huez.nvim"; src = inputs.huez-nvim; };
  blame-me-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "blame-me.nvim";
    src = inputs.blame-me-nvim;
  };
  pokemon-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "pokemon.nvim";
    src = inputs.pokemon-nvim;
  };
  chameleon-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "chameleon.nvim";
    src = inputs.chameleon-nvim;
  };

  mkEntryFromDrv =
    drv:
    if lib.isDerivation drv then
      {
        name = "${lib.getName drv}";
        path = drv;
      }
    else
      drv;

  plugins = with pkgs.vimPlugins; [
    LazyVim
    snacks-nvim
    better-escape-nvim
    clangd_extensions-nvim
    cmake-tools-nvim
    cmp-buffer
    cmp-nvim-lsp
    cmp-path
    cmp_luasnip
    conform-nvim
    crates-nvim
    dracula-nvim
    dressing-nvim
    flash-nvim
    friendly-snippets
    nvim-snippets
    gitsigns-nvim
    markdown-nvim
    indent-blankline-nvim
    kanagawa-nvim
    lualine-nvim
    marks-nvim
    neo-tree-nvim
    neoconf-nvim
    neorg
    nix-develop-nvim
    noice-nvim
    none-ls-nvim
    nui-nvim
    #nvim-cmp
    blink-cmp
    nvim-dap
    nvim-dap-ui
    nvim-dap-virtual-text
    nvim-lint
    nvim-lspconfig
    nvim-notify
    nvim-spectre
    nvim-treesitter
    nvim-treesitter-context
    nvim-treesitter-textobjects
    nvim-ts-autotag
    nvim-ts-context-commentstring
    ts-comments-nvim
    nvim-web-devicons
    oil-nvim
    overseer-nvim
    persistence-nvim
    plenary-nvim
    project-nvim
    rust-tools-nvim
    sqlite-lua
    rustaceanvim
    telescope-fzf-native-nvim
    # telescope-nvim
    fzf-lua
    tmux-navigator
    todo-comments-nvim
    tokyonight-nvim
    trouble-nvim
    vim-illuminate
    vim-startuptime
    vscode-nvim
    which-key-nvim
    bufferline-nvim
    alpha-nvim
    lazydev-nvim
    grug-far-nvim
    git-blame-nvim
    {
      name = "LuaSnip";
      path = luasnip;
    }
    {
      name = "blame-me.nvim";
      path = blame-me-nvim;
    }
    {
      name = "catppuccin";
      path = catppuccin-nvim;
    }
    # { name = "huez.nvim"; path = huez-nvim; }
    {
      name = "pokemon.nvim";
      path = pokemon-nvim;
    }
    {
      name = "chameleon.nvim";
      path = chameleon-nvim;
    }
    {
      name = "mini.ai";
      path = mini-nvim;
    }
    {
      name = "mini.icons";
      path = mini-nvim;
    }
    {
      name = "mini.bufremove";
      path = mini-nvim;
    }
    {
      name = "mini.comment";
      path = mini-nvim;
    }
    {
      name = "mini.indentscope";
      path = mini-nvim;
    }
    {
      name = "mini.pairs";
      path = mini-nvim;
    }
    {
      name = "mini.surround";
      path = mini-nvim;
    }
    {
      name = "yanky.nvim";
      path = yanky-nvim;
    }
  ];
in
# Link together all plugins into a single derivation
pkgs.linkFarm "lazyvim-nix-plugins" (builtins.map mkEntryFromDrv plugins)
