{
  description = "Portable nvim config with flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    neovim = {
      url = "github:neovim/neovim?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    neovim,
    ...
  } @inputs: 
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

      recursiveMerge = attrList: let
        f = attrPath:
          builtins.zipAttrsWith (n: values:
            if pkgs.lib.tail values == []
            then pkgs.lib.head values
            else if pkgs.lib.all pkgs.lib.isList values
            then pkgs.lib.unique (pkgs.lib.concatLists values)
            else if pkgs.lib.all pkgs.lib.isAttrs values
            then f (attrPath ++ [n]) values
            else pkgs.lib.last values);
      in
        f [] attrList;
    in rec {
      dependencies = with pkgs;
        [
        ]
        ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
        ]
        ++ pkgs.lib.optionals pkgs.stdenv.isDarwin
        []; 

      neovim-augmented = recursiveMerge [
        pkgs.neovim-unwrapped
        {buildInputs = dependencies;}
      ];

      packages.my_neovim = pkgs.wrapNeovim neovim-augmented {
        viAlias = true;
        vimAlias = true;
        withNodeJs = false;
        withPython3 = false;
        withRuby = false;
        extraPython3Packages = false;
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}"'';
        # make sure impatient is loaded before everything else to speed things up
        configure = {
          customRC =
            ''
              lua << EOF
                package.path = "${self}/?.lua;" .. package.path
                rustsrc_path = "${pkgs.rustPlatform.rustLibSrc}/core/Cargo.toml"
                vim.env.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}"
                vim.env.RA_LOG = "info,salsa::derived::slot=warn,chalk_recursive=warn,hir_ty::traits=warn,flycheck=trace,rust_analyzer::main_loop=warn,ide_db::apply_change=warn,project_model=debug,proc_macro_api=debug,hir_expand::db=error,ide_assists=debug,ide=debug"
                rustanalyzer_path = "${pkgs.rust-analyzer}/bin/rust-analyzer"
            ''
            + pkgs.lib.readFile ./init.lua
            + ''
              EOF
            '';
          packages.myPlugins = with pkgs.vimPlugins; {
            start = with pkgs.vimPlugins;
              [
                tokyonight-nvim # tokyonight theme
              ]
              ++ pkgs.lib.optionals (!pkgs.stdenv.isDarwin) [
              ];
            opt = with pkgs.vimPlugins; [
            ];
          };
        };
      };
      apps.my_neovim = flake-utils.lib.mkApp {
        drv = packages.my_neovim;
        name = "my_neovim";
        exePath = "/bin/nvim";
      };
      packages.default = packages.my_neovim;
      apps.default = apps.my_neovim;
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [packages.my_neovim] ++ dependencies;
      };
    });
}
