{
  description = "Portable nvim config with flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      # url = "github:nix-community/nixvim/nixos-23.05";

      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    neovim,
    nixvim,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
        overlays = [
          (self: super: {
            vimPlugins =
              super.vimPlugins;
          })
        ];
      };

      configModule = {
      };

      customNeovim = nixvim.legacyPackages.x86_64-linux.makeNixvim {
        plugins.lsp.enable = true;
        globals.mapleader = " ";
        colorschemes.tokyonight.enable = true;
        colorschemes.tokyonight.style = "night";
        plugins.noice.enable = true;
        plugins.neo-tree.enable = true;
        plugins.which-key.enable = true;
        maps = {
          normal = {
            "<leader>e" = {
              action = "<cmd>Neotree toggle<cr>";
              desc = "Toggle Explorer";
            };
            "<C-h>" = {
              action = "<C-w>h";
              desc = "Go to left window";
            };
            "<C-j>" = {
              action = "<C-w>j";
              desc = "Go to lower window";
              remap = true;
            };
            "<C-k>" = {
              action = "<C-w>k";
              desc = "Go to upper window";
              remap = true;
            };
            "<C-l>" = {
              action = "<C-w>l";
              desc = "Go to left window";
              remap = true;
            };
          }; # Same as nnoremap <leader>m <silent> <cmd>make<CR>
        };
      };
    in rec {
      packages.neovim = customNeovim;
      apps.my_neovim = flake-utils.lib.mkApp {
        drv = packages.neovim;
        name = "my_neovim";
        exePath = "/bin/nvim";
      };
      packages.default = packages.my_neovim;
      apps.default = apps.my_neovim;
    });
}
