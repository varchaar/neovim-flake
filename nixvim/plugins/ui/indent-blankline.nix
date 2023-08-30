{
  plugins = {
    indent-blankline = {
      enable = true;
      filetypeExclude = [
        "help"
        "alpha"
        "dashboard"
        "neo-tree"
        "Trouble"
        "notify"
        "toggleterm"
      ];
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
