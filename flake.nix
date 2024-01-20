{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";

    #vim plugins
    plugin_conform-nvim = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };
    plugin_pokemon-nvim = {
      url = "github:ColaMint/pokemon.nvim";
      flake = false;
    };
    plugin_night-owl-nvim = {
      url = "github:oxfist/night-owl.nvim";
      flake = false;
    };
    plugin_hydrate-nvim = {
      url = "github:stefanlogue/hydrate.nvim";
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
          (final: prev:
          let
            inherit (prev.vimUtils) buildVimPlugin;
            plugins = builtins.filter
              (s: (builtins.match "plugin_.*" s) != null)
              (builtins.attrNames inputs);
            plugName = input:
              builtins.substring
                (builtins.stringLength "plugin_")
                (builtins.stringLength input)
                input;
            buildPlug = name: buildVimPlugin {
              pname = plugName name;
              version = "master";
              src = builtins.getAttr name inputs;

              # Tree-sitter fails for a variety of lang grammars unless using :TSUpdate
              # For now install imperatively
              #postPatch =
              #  if (name == "nvim-treesitter") then ''
              #    rm -r parser
              #    ln -s ${treesitterGrammars} parser
              #  '' else "";
            };
          in
          {
            neovimPlugins = builtins.listToAttrs (map
              (plugin: {
                name = plugName plugin;
                value = buildPlug plugin;
              })
              plugins);
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
