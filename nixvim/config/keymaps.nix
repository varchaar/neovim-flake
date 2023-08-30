{
  globals.mapleader = " ";
  maps = {
    normal = {
      "<leader>e" = {
        action = "<cmd>Neotree toggle<cr>";
        desc = "Toggle Explorer";
      };

      "<C-h>" = {
        action = "<C-w>h";
        desc = "Go to left window";
      };
      "<C-j>" = {
        action = "<C-w>j";
        desc = "Go to lower window";
        remap = true;
      };
      "<C-k>" = {
        action = "<C-w>k";
        desc = "Go to upper window";
        remap = true;
      };
      "<C-l>" = {
        action = "<C-w>l";
        desc = "Go to left window";
        remap = true;
      };
      # Window management
      "<leader>ww" = {
        action = "<C-W>p";
        desc = "Other window";
        remap = true;
      };
      "<leader>wd" = {
        action = "<C-W>c";
        desc = "Delete window";
        remap = true;
      };
      "<leader>w-" = {
        action = "<C-W>s";
        desc = "Split window below";
        remap = true;
      };
      "<leader>w|" = {
        action = "<C-W>v";
        desc = "Split window right";
        remap = true;
      };
      "<leader>-" = {
        action = "<C-W>s";
        desc = "Split window below";
        remap = true;
      };
      "<leader>|" = {
        action = "<C-W>v";
        desc = "Split window right";
        remap = true;
      };
    }; 
  };
}
