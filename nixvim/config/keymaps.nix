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
    }; # Same as nnoremap <leader>m <silent> <cmd>make<CR>
  };
}
