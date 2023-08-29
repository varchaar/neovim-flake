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

      customNeovim = nixvim.legacyPackages.x86_64-linux.makeNixvimWithModule {
        module = {
          imports = [./nixvim];
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
