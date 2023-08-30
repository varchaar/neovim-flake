{
  imports = [
    ./alpha.nix
    ./indent-blankline.nix
    ./bufferline.nix
    ./dressing.nix
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
    which-key.enable = true;
    lualine = {
      enable = true;
      globalstatus = true;
    };
  };
}
