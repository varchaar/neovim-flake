{pkgs, ...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      vuels.enable = true;
      rust-analyzer.enable = true;
      nil_ls.enable = true;
      tsserver.enable = true;
      eslint.enable = true;
      eslint.onAttach.function = ''
        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
      '';
    };
  };
  extraPackages = with pkgs; [
    cargo
  ];
}
