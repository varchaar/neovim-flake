{
  globals.mapleader = " ";
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Toggle Explorer";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Go to left window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Go to lower window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Go to upper window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Go to left window";
        remap = true;
      };
    }
    # Window management
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        desc = "Other window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        desc = "Delete window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        desc = "Split window below";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        desc = "Split window right";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        desc = "Split window below";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        desc = "Split window right";
        remap = true;
      };
    }
  ];
}
