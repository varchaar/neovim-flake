{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>/" = {
        options.desc = "Grep (root dir)";
        action = "live_grep";
      };
      "<leader>ff" = {
        options.desc = "Find Files (root dir)";
        action = "find_files";
      };
      "<leader><space>" = {
        options.desc = "Find Files (root dir)";
        action = "find_files";
      };
    };
    extensions = {
      fzf-native = {
        enable = true;
        settings.fuzzy = true;
      };
    };
    settings = {
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
}
