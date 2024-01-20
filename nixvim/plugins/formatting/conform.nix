{
  pkgs,
  config,
  ...
}: {
  extraPlugins = [
    pkgs.neovimPlugins.conform-nvim
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "Toggle Explorer";
      };
    }
  ];

  extraConfigLua = ''
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        nix = { "alejandra" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
      },
    })

    require("conform").setup({
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.autoformat or vim.b[bufnr].autoformat then
          return { timeout_ms = 500, lsp_fallback = true }
        end
        return
      end,
    })

    vim.api.nvim_create_user_command("FormatOnSaveToggle", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.autoformat = not vim.b.autoformat
      else
        vim.g.autoformat = not vim.g.autoformat
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';
}
