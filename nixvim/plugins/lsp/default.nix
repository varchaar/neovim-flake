{pkgs, ...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      vuels.enable = true;
      rust-analyzer.enable = true;
      nil_ls.enable = true;
      tsserver.enable = true;
    };
  };
  extraPackages = with pkgs; [
    cargo
  ];
}
