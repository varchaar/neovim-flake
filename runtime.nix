{ pkgs, ... }:
let
  make-lazy =
    pkg: bin:
    pkgs.writeShellScriptBin "${bin}" ''
      # Get the full path of this wrapper script
      WRAPPER_PATH="$(readlink -f "$0")"

      # Search through PATH for the real binary, excluding this wrapper
      IFS=':'
      for dir in $PATH; do
        CANDIDATE="$dir/${bin}"
        if [ -x "$CANDIDATE" ] && [ "$(readlink -f "$CANDIDATE")" != "$WRAPPER_PATH" ]; then
          exec "$CANDIDATE" "$@"
        fi
      done

      # If not found in PATH, use nix shell
      exec nix shell nixpkgs#${pkg} --command ${bin} "$@"
    '';

  clangd = pkgs.writeShellScriptBin "clangd" ''
    if [ -f /opt/vector-clang-tidy/bin/clangd ]; then
      /opt/vector-clang-tidy/bin/clangd "$@"
    else
      nix shell nixpkgs#clang-tools_16 --command clangd "$@"
    fi
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
    fzf
    ghostscript
    tectonic
    mermaid-cli
    imagemagick
    tree-sitter

    # LSP's
    clangd
    (make-lazy "cmake-format" "cmake-lint")
    (make-lazy "nil" "nil")
    (make-lazy "taplo" "taplo")
    (make-lazy "marksman" "marksman")
    (make-lazy "neocmakelsp" "neocmakelsp")
    (make-lazy "yaml-language-server" "yaml-language-server")
    (make-lazy "lua-language-server" "lua-language-server")
    (make-lazy "luarocks" "luarocks")
    (make-lazy "lua51Packages.lua" "lua")
    (make-lazy "vue-language-server" "vue-language-server")
    (make-lazy "astro-language-server" "astro-ls")
    (make-lazy "nodePackages.@prisma/language-server" "prisma-language-server")
    (make-lazy "vtsls" "vtsls")

    ## Rust
    (make-lazy "rust-analyzer" "rust-analyzer")
    (make-lazy "rustc" "rustc")
    (make-lazy "rustfmt" "rustfmt")
    (make-lazy "cargo" "cargo")
    (make-lazy "codelldb" "codelldb")

    ##  Go
    (make-lazy "gopls" "gopls")
    (make-lazy "gotools" "goimports")
    (make-lazy "gomodifytags" "gomodifytags")
    (make-lazy "gofumpt" "gofumpt")
    (make-lazy "impl" "impl")
    (make-lazy "delve" "delve")

    ## Javascript
    (make-lazy "nodePackages.prettier" "prettier")

    # Debuggers

    # Formatters
    (make-lazy "stylua" "stylua")
    (make-lazy "nixpkgs-fmt" "nixpkgs-fmt")
    (make-lazy "jq" "jq")

    # Linters
    (make-lazy "markdownlint-cli" "markdownlint-cli")
  ];
}
