{helpers, ...}: {
  plugins.bufferline = {
    enable = true;
    alwaysShowBufferline = false;
    diagnostics = "nvim_lsp";
    closeCommand = {__raw = ''function(n) require("mini.bufremove").delete(n, false) end'';};
    rightMouseCommand = {__raw = ''function(n) require("mini.bufremove").delete(n, false) end'';};
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
      action =
        helpers.mkRaw
        /*
        lua
        */
        ''
          function() require("mini.bufremove").delete(0, false) end
        '';
      options.desc = "Delete Buffer";
    }
    {
      key = "<leader>bD";
      mode = "n";
      action =
        helpers.mkRaw
        /*
        lua
        */
        ''
          function() require("mini.bufremove").delete(0, true) end
        '';
      options.desc = "Delete Buffer (Force)";
    }

    {
      key = "<leader>bp";
      mode = "n";
      action = ''<Cmd>BufferLineTogglePin<CR>'';
      options.desc = "Toggle pin";
    }
    {
      key = "<leader>bP";
      mode = "n";
      action = ''<Cmd>BufferLineGroupClose ungrouped<CR>'';
      options.desc = "Delete non-pinned buffers";
    }
    {
      key = "<leader>bo";
      mode = "n";
      action = ''<Cmd>BufferLineCloseOthers<CR>'';
      options.desc = "Delete other buffers";
    }
    {
      key = "<leader>br";
      mode = "n";
      action = ''<Cmd>BufferLineCloseRight<CR>'';
      options.desc = "Delete buffers to the right";
    }
    {
      key = "<leader>bl";
      mode = "n";
      action = ''<Cmd>BufferLineCloseLeft<CR>'';
      options.desc = "Delete buffers to the left";
    }
  ];
}
