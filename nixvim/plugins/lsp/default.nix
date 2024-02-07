{pkgs, ...}: {
  imports = [
    ./trouble.nix
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      volar.enable = true;
      volar.extraOptions = {
        init_options = {
          typescript = {
            tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
          };
        };
      };
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
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
