{pkgs, ...}: {
  imports = [
    ./config
    ./plugins
  ];
  config = {
    plugins.lsp.enable = true;
    plugins.neo-tree = {
      closeIfLastWindow = true;
      enable = true;
    };
    plugins.treesitter.enable = true;
  };
}
