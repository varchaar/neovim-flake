{
  plugins.noice.enable = true;
  plugins.which-key.enable = true;
  plugins.indent-blankline.enable = true;
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>fg" = "live_grep";
      "<leader>ff" = "find_files";
      "<leader><space>" = "find_files";
    };
    extraOptions = {
      defaults = {
        prompt_prefix = " ";
        selection_caret = " ";
        mappings = {
          n = {
            q = {
              __raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
            };
          };
        };
      };
    };
  };
  plugins.lualine = {
    enable = true;
    globalstatus = true;
  };
  plugins.alpha = {
    enable = true;
  };
}
