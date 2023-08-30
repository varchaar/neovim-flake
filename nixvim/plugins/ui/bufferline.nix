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

  maps.normal = {
    "<s-h>" = {
      action = "<cmd>BufferLineCyclePrev<cr>";
      desc = "Prev Buffer";
    };
    "<s-l>" = {
      action = "<cmd>BufferLineCycleNext<cr>";
      desc = "Next Buffer";
    };
    "[b" = {
      action = "<cmd>BufferLineCyclePrev<cr>";
      desc = "Prev Buffer";
    };
    "]b" = {
      action = "<cmd>BufferLineCycleNext<cr>";
      desc = "Next Buffer";
    };

    "<leader>bd" = {
      action = ''function() require("mini.bufremove").delete(0, false) end'';
      lua = true;
      desc = "Delete Buffer";
    };
    "<leader>bD" = {
      action = ''function() require("mini.bufremove").delete(0, true) end'';
      lua = true;
      desc = "Delete Buffer (Force)";
    };
  };
}
