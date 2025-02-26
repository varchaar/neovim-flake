{
  config.vim = {
    filetree.neo-tree = {
      enable = true;

    };
    maps.normal = {
      "<leader>e" = {
        silent = true;
        noremap = true;
        action = "<cmd>Neotree toggle<CR>";
        desc = "Toggle neotree";
      };
    };
  };
}
