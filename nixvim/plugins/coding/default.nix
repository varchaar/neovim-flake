{pkgs, ...}: {
  imports = [
  ];
  extraPlugins = [
    pkgs.vimPlugins.friendly-snippets
  ];
  plugins.luasnip = {
    enable = true;
    fromVscode = [{}];
  };
}
