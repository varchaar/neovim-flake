{
  pkgs,
  config,
  ...
}: {
  extraPlugins = [
    pkgs.vimPlugins.lazygit-nvim
  ];

  extraPackages = [
    pkgs.lazygit
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<cr>";
      options = {
        desc = "Toggle Lazygit";
      };
    }
  ];
  # extraConfigLua = ''
  #   require('lazygit.nvim').setup({})
  # '';
}
