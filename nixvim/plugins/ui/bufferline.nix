{
  plugins.bufferline = {
    enable = true;
    alwaysShowBufferline = false;
    diagnostics = "nvim_lsp";
    closeCommand = ''function(n) require("mini.bufremove").delete(n, false) end'';
    rightMouseCommand = ''function(n) require("mini.bufremove").delete(n, false) end'';
    offsets = [
      {
        filetype = "neo-tree";
        text = "Neo-tree";
        highlight = "Directory";
        text_align = "left";
      }
    ];
  };

  plugins.mini = {
    enable = true;
    modules = {
      bufremove = {};
    };
  };

  keymaps = [
    {
      key = "<s-h>";
      mode = "n";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "<s-l>";
      mode = "n";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }
    {
      key = "[b";
      mode = "n";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.desc = "Prev Buffer";
    }
    {
      key = "]b";
      mode = "n";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.desc = "Next Buffer";
    }

    {
      key = "<leader>bd";
      mode = "n";
      action = ''function() require("mini.bufremove").delete(0, false) end'';
      lua = true;
      options.desc = "Delete Buffer";
    }
    {
      key = "<leader>bD";
      mode = "n";
      action = ''function() require("mini.bufremove").delete(0, true) end'';
      lua = true;
      options.desc = "Delete Buffer (Force)";
    }
  ];
}
