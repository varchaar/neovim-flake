{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";

    #vim plugins
    conform-nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };
    pokemon-nvim = {
      url = "github:ColaMint/pokemon.nvim";
      flake = false;
    };
    chameleon-nvim = {
      url = "github:shaun-mathew/Chameleon.nvim";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs: let
    config = import ./nixvim; # import the module directly
  in
    flake-utils.lib.eachDefaultSystem (system: let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (self: super: {
            vimPlugins =
              super.vimPlugins
              // {
                conform-nvim = super.vimUtils.buildVimPlugin {
                  name = "conform-nvim";
                  pname = "conform-nvim";
                  src = inputs.conform-nvim;
                };
                pokemon-nvim = super.vimUtils.buildVimPlugin {
                  name = "pokemon-nvim";
                  pname = "pokemon-nvim";
                  src = inputs.pokemon-nvim;
                };
                chameleon-nvim = super.vimUtils.buildVimPlugin {
                  name = "chameleon-nvim";
                  pname = "chamelon-nvim";
                  src = inputs.chameleon-nvim;
                };
              };
          })
        ];
      };
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
      };
    in {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "A nixvim configuration";
        };
      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
    });
}
