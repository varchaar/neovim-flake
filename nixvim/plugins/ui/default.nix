{
  imports = [
    ./alpha.nix
    # ./dashboard.nix
    ./indent-blankline.nix
    ./bufferline.nix
    ./dressing.nix
    ./lazygit.nix
  ];

  plugins = {
    noice = {
      enable = true;
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = false;
        lsp_doc_border = false;
      };
      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
    };
    notify = {
      enable = true;
    };
    which-key = {
      enable = true;
      plugins = {
        spelling = {
          enabled = true;
        };
      };
      registrations = {
        "<leader><tab>" = "+tabs";
        "<leader>b" = "+buffer";
        "<leader>c" = "+code";
        "<leader>f" = "+file/find";
        "<leader>g" = "+git";
        "<leader>gh" = "+hunks";
        "<leader>q" = "+quit/session";
        "<leader>s" = "+search";
        "<leader>u" = "+ui";
        "<leader>w" = "+windows";
        "<leader>x" = "+diagnostics/quickfix";
      };

      # defaults = {
      #   mode = { "n", "v" },
      #   ["g" = { name = "+goto" },
      #   ["gs" = { name = "+surround" },
      #   ["]" = { name = "+next" },
      #   ["[" = { name = "+prev" },
      #   ["<leader><tab>" = { name = "+tabs" },
      #   ["<leader>b" = { name = "+buffer" },
      #   ["<leader>c" = { name = "+code" },
      #   ["<leader>f" = { name = "+file/find" },
      #   ["<leader>g" = { name = "+git" },
      #   ["<leader>gh" = { name = "+hunks" },
      #   ["<leader>q" = { name = "+quit/session" },
      #   ["<leader>s" = { name = "+search" },
      #   ["<leader>u" = { name = "+ui" },
      #   ["<leader>w" = { name = "+windows" },
      #   ["<leader>x" = { name = "+diagnostics/quickfix" },
      # },
    };
    lualine = {
      enable = true;
      globalstatus = true;
    };
  };
}
