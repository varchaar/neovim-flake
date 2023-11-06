{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>/" = {
        desc = "Grep (root dir)";
        action = "live_grep";
      };
      "<leader>ff" = {
        desc = "Find Files (root dir)";
        action = "find_files";
      };
      "<leader><space>" = {
        desc = "Find Files (root dir)";
        action = "find_files";
      };
    };
    extensions = {
      fzf-native = {
        enable = true;
        fuzzy = true;
      };
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
}
