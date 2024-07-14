{
  plugins.cmp = {
    enable = true;
    # preselect = "None";
    settings = {
      snippet.expand = "luasnip";
      mappingPresets = ["insert" "cmdline"];
      mapping = {
        "<C-n>" = ''cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })'';
          "<C-p>" = ''cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert })'';
          "<C-b>" = ''cmp.mapping.scroll_docs(-4)'';
          "<C-f>" = ''cmp.mapping.scroll_docs(4)'';
          "<C-Space>" = ''cmp.mapping.complete()'';
          "<C-e>" = ''cmp.mapping.abort()'';
          "<CR>" = ''cmp.mapping.confirm({ select = true })''; # Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items
          "<S-CR>" = ''cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })''; # Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          "<C-CR>" = ''function(fallback)
            cmp.abort()
            fallback()
          end'';
      };

      formatting = {
        fields = [
          "kind"
          "abbr"
          "menu"
        ];
        format = ''
            function(entry, vim_item)
              -- Kind icons
              vim_item.kind = string.format(" %s ", kind_icons[vim_item.kind])
              -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
          end
        '';
      };

      # window = {
      #   # completion = {
      #   #   side_padding = 0;
      #   # };
      # };

      sources = [
        # { name = "copilot"; }
        {name = "luasnip";} #-- For luasnip users.
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];
    };

    # confirm_opts = {
    #   behavior = "Replace";
    #   select = false;
    # };
  };

  extraConfigLuaPre = ''
    mycmp = require'cmp'

    check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    --   פּ ﯟ   some other good icons
    kind_icons = {
      Text = "",
      Method = "m",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
  '';
}
