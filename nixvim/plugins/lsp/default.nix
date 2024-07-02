{pkgs, helpers, ...}: {
  imports = [
    ./trouble.nix
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      volar.enable = true;
      volar.extraOptions = {
        init_options = {
          typescript = {
            tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
          };
        };
      };
      rust-analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      nil-ls.enable = true;
      tsserver.enable = true;
      eslint.enable = true;
      eslint.onAttach.function = ''
        if client.name == "eslint" then
          client.server_capabilities.documentFormattingProvider = true
        elseif client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end
      '';
    };
  };

  plugins.inc-rename.enable = true;

  plugins.hmts.enable = true;

  extraPackages = with pkgs; [
    cargo
  ];

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options = {desc = "Lsp Info";};
    }
    {
      mode = ["n"];
      key = "gd";
      action = helpers.mkRaw /*lua*/ "function() require(\"telescope.builtin\").lsp_definitions({ reuse_win = true }) end";
      options = {desc = "Goto Definition";};
    }
    {
      mode = ["n"];
      key = "gr";
      action = "<cmd>Telescope lsp_references<cr>";
      options = {desc = "References";};
    }
    {
      mode = ["n"];
      key = "gD";
      action = helpers.mkRaw /*lua*/ "vim.lsp.buf.declaration";
      options = {desc = "Goto Declaration";};
    }
    {
      mode = ["n"];
      key = "gI";
      action = helpers.mkRaw /*lua*/ "function() require(\"telescope.builtin\").lsp_implementations({ reuse_win = true }) end";
      options = {desc = "Goto Implementation";};
    }
    {
      mode = ["n"];
      key = "gy";
      action = helpers.mkRaw /*lua*/ "function() require(\"telescope.builtin\").lsp_type_definitions({ reuse_win = true }) end";
      options = {desc = "Goto T[y]pe Definition";};
    }
    {
      mode = ["n"];
      key = "K";
      action = helpers.mkRaw /*lua*/ "vim.lsp.buf.hover";
      options = {desc = "Hover";};
    }
    {
      mode = ["n"];
      key = "gK";
      action = helpers.mkRaw /*lua*/ "vim.lsp.buf.signature_help";
      options = {desc = "Signature Help";};
    }
    {
      mode = ["i"];
      key = "<c-k>";
      action = helpers.mkRaw /*lua*/ "vim.lsp.buf.signature_help";
      options = {desc = "Signature Help";};
    }
    {
      mode = ["n"];
      key = "<leader>cr";
      action = helpers.mkRaw /*lua*/ ''
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end'';
      options = {
        desc = "Rename Symbol";
        expr = true;
      };
    }
  ];
}
