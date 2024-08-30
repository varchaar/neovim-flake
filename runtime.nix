{ pkgs, ... }:
let
  make-lazy = pkg: bin: pkgs.writeShellScriptBin "${bin}" ''
    nix shell nixpkgs#${pkg} --command ${bin} "$@"
  '';
in
# Link together all runtime dependencies into one derivation
pkgs.symlinkJoin {
  name = "lazyvim-nix-runtime";
  paths = with pkgs; [
    # LazyVim dependencies
    lazygit
    ripgrep
    fd

    # LSP's
    (make-lazy "nil" "nil")
    (make-lazy "taplo" "taplo")
    (make-lazy "rust-analyzer" "rust-analyzer")
    (make-lazy "marksman" "marksman")
    (make-lazy "neocmakelsp" "neocmakelsp")
    (make-lazy "yaml-language-server" "yaml-language-server")
    (make-lazy "lua-language-server" "lua-language-server")

    # Debuggers

    # Formatters
    (make-lazy "stylua" "stylua")
    (make-lazy "nixpkgs-fmt" "nixpkgs-fmt")
    (make-lazy "jq" "jq")

    # Linters
    (make-lazy "markdownlint-cli" "markdownlint-cli")
  ];
}
