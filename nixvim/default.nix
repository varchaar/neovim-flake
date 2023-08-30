{pkgs, ...}: {
  imports = [
    ./config
    ./plugins
  ];
  config = {
    plugins.lsp.enable = true;
    plugins.neo-tree = {
      closeIfLastWindow = true;
      buffers.followCurrentFile.enabled = true;
      filesystem.followCurrentFile.enabled = true;
      enable = true;
    };
    plugins.treesitter.enable = true;
  };
}
