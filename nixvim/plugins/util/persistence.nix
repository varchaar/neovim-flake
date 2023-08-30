{pkgs, ...}: {
  extraPlugins = [
    pkgs.vimPlugins.persistence-nvim
  ];

  extraConfigLua = ''    require("persistence").setup({
        options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }   
      })'';

  maps.normal = {
    "<leader>qs" = {
      action = ''function() require("persistence").load() end'';
      lua = true;
      desc = "Restore Session";
    };
    "<leader>ql" = {
      action = ''function() require("persistence").load({ last = true }) end'';
      lua = true;
      desc = "Restore Last Session";
    };
    "<leader>qd" = {
      action = ''function() require("persistence").stop() end'';
      lua = true;
      desc = "Don't Save Current Session";
    };
  };
}
