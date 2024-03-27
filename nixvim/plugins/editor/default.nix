{
  imports = [
    ./telescope.nix
    ./gitsigns.nix
  ];

  plugins = {
    illuminate = {
      enable = true;
      delay = 200;
      largeFileCutoff = 2000;
      filetypesDenylist = [
        "dirvish"
        "fugitive"
        "alpha"
      ];
    };
  };
}
