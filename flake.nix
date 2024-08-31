{
  description = "Setup LazyVim using NixVim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";

    # Plugins not available in nixpkgs
    huez-nvim = { url = "github:vague2k/huez.nvim"; flake = false; };
    blame-me-nvim = { url = "github:hougesen/blame-me.nvim"; flake = false; };
    pokemon-nvim = { url = "github:ColaMint/pokemon.nvim"; flake = false; };
  };

  outputs = { self, nixpkgs, flake-parts, ... } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { pkgs, lib, system, config, ... }:
        let
          # Derivation containing all plugins
          pluginPath = import ./plugins.nix { inherit pkgs lib inputs; };

          # Derivation containing all runtime dependencies
          runtimePath = import ./runtime.nix { inherit pkgs; };

          # Link together all treesitter grammars into single derivation
          treesitterPath = pkgs.symlinkJoin {
            name = "lazyvim-nix-treesitter-parsers";
            paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
          };

          # Use nightly neovim only ;)
          neovimNightly = inputs.neovim-nightly-overlay.packages.${system}.default;
          # Wrap neovim with custom init and plugins
          neovimWrapped = pkgs.wrapNeovim neovimNightly {
            configure = {
              customRC = /* vim */ ''
                " Populate paths to neovim
                let g:config_path = "${./config}"
                let g:plugin_path = "${pluginPath}"
                let g:runtime_path = "${runtimePath}"
                let g:treesitter_path = "${treesitterPath}"
                " Begin initialization
                source ${./config/init.lua}
              '';
              packages.all.start = [ pkgs.vimPlugins.lazy-nvim ];
            };
          };
        in
        {
          packages =
            rec {
              vtsls = pkgs.callPackage ./pkgs/vtsls { };
              # Wrap neovim again to make runtime dependencies available
              nvim = pkgs.writeShellApplication {
                name = "nvim";
                runtimeInputs = [ runtimePath ];
                text = ''export VUE_LANGUAGE_SERVER_PATH="${pkgs.vue-language-server}";
              exec ${neovimWrapped}/bin/nvim "$@"'';
              };
              default = nvim;
            };
        };
    };
}
