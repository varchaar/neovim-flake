{
  imports = [
    ./alpha.nix
    ./indent-blankline.nix
    ./bufferline.nix
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
