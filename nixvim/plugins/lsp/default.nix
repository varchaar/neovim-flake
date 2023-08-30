{pkgs, ...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      volar.enable = true;
      rust-analyzer.enable = true;
    };
  };
  extraPackages = with pkgs; [
    cargo
  ];
}
