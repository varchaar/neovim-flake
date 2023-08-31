{pkgs, ...}: {
  imports = [
    ./cmp.nix
  ];
  extraPlugins = [
    pkgs.vimPlugins.friendly-snippets
    pkgs.vimPlugins.nvim-ts-context-commentstring
  ];

  plugins = {
    luasnip = {
      enable = true;
      fromVscode = [
        {
          lazyLoad = true;
        }
        {
          lazyLoad = true;
          paths = [
            ./snippets
          ];
        }
      ];
    };
    mini = {
      modules = {
        pairs = {};
        surround = {
          mappings = {
            add = "gza"; # Add surrounding in Normal and Visual modes
            delete = "gzd"; # Delete surrounding
            find = "gzf"; # Find surrounding (to the right)
            find_left = "gzF"; # Find surrounding (to the left)
            highlight = "gzh"; # Highlight surrounding
            replace = "gzr"; # Replace surrounding
            update_n_lines = "gzn"; # Update `n_lines`
          };
        };
      };
    };
  };

  extraConfigLuaPre = ''
    luasnip = require'luasnip'
  '';
}
