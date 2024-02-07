{
  plugins.trouble.enable = true;

  keymaps = [
    {
      key = "<leader>xx";
      mode = "n";
      action = ''<cmd>TroubleToggle document_diagnostics<cr>'';
      options.desc = "Document Diagnostics (Trouble)";
    }
    {
      key = "<leader>xX";
      mode = "n";
      action = ''<cmd>TroubleToggle workspace_diagnostics<cr>'';
      options.desc = "Workspace Diagnostics (Trouble)";
    }
    {
      key = "<leader>xL";
      mode = "n";
      action = ''<cmd>TroubleToggle loclist<cr>'';
      options.desc = "Location List (Trouble)";
    }
    {
      key = "<leader>xQ";
      mode = "n";
      action = ''<cmd>TroubleToggle quickfix<cr>'';
      options.desc = "Quickfix List (Trouble)";
    }
  ];
}
