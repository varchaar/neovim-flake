{pkgs, ...}: {
  imports = [
    ./cmp.nix
  ];
  extraPlugins = [
    pkgs.vimPlugins.friendly-snippets
  ];
  plugins.luasnip = {
    enable = true;
    fromVscode = [{}];
  };
}
