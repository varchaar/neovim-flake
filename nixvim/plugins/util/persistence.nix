{pkgs, ...}: {
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
      action = ''function() require("persistence").load() end'';
      lua = true;
      options.desc = "Restore Session";
    }
    {
      key = "<leader>ql";
      mode = "n";
      action = ''function() require("persistence").load({ last = true }) end'';
      lua = true;
      options.desc = "Restore Last Session";
    }
    {
      key = "<leader>qd";
      mode = "n";
      action = ''function() require("persistence").stop() end'';
      lua = true;
      options.desc = "Don't Save Current Session";
    }
  ];
}
