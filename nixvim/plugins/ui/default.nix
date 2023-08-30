{
  imports = [
    ./alpha.nix
    ./indent-blankline.nix
  ];

  plugins = {
    noice.enable = true;
    which-key.enable = true;
    lualine = {
      enable = true;
      globalstatus = true;
    };
  };
}
