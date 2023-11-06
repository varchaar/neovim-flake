{pkgs, ...}: {
  plugins = {
    indent-blankline = {
      enable = true;
      exclude = {
        filetypes = [
          "help"
          "alpha"
          "dashboard"
          "neo-tree"
          "Trouble"
          "lazy"
          "mason"
          "notify"
          "toggleterm"
          "lazyterm"
        ];
      };
    };
    mini = {
      enable = true;
      modules = {
        indentscope = {
          symbol = "│";
          options = {try_as_border = true;};
        };
      };
    };
  };

  #  extraPlugins = [
  #    pkgs.vimPlugins.indent-blankline-nvim
  #  ];
  #
  #  extraConfigLua = ''
  #    require("ibl").setup()
  #  '';
  #
  autoCmd = [
    {
      event = ["FileType"];
      pattern = [
        "help"
        "alpha"
        "dashboard"
        "neo-tree"
        "Trouble"
        "lazy"
        "mason"
        "notify"
        "toggleterm"
        "lazyterm"
      ];
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }
  ];
}
