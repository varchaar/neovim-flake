{
  pkgs,
  helpers,
  ...
}: {
  extraPlugins = [
    pkgs.vimPlugins.persistence-nvim
  ];

  extraConfigLua = ''    require("persistence").setup({
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }   
      })'';

  keymaps = [
    {
      key = "<leader>qs";
      mode = "n";
      action =
        helpers.mkRaw
        /*
        lua
        */
        ''
          function() require("persistence").load() end
        '';
      options.desc = "Restore Session";
    }
    {
      key = "<leader>ql";
      mode = "n";
      action =
        helpers.mkRaw
        /*
        lua
        */
        ''
          function() require("persistence").load({ last = true }) end
        '';
      options.desc = "Restore Last Session";
    }
    {
      key = "<leader>qd";
      mode = "n";
      action =
        helpers.mkRaw
        /*
        lua
        */
        ''
          function() require("persistence").stop() end
        '';
      options.desc = "Don't Save Current Session";
    }
  ];
}
