require("lazy").setup({
  defaults = { lazy = true },
  dev = {
    -- reuse files from pkgs.vimPlugins.*
    path = vim.g.plugin_path,
    patterns = { "." },
    -- fallback to download
    fallback = false,
  },
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.go" },
    -- The following configs are needed for fixing lazyvim on nix
    -- force enable telescope-fzf-native.nvim
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = true },
    -- disable mason.nvim, use config.extraPackages
    { "williamboman/mason-lspconfig.nvim", enabled = false },
    { "williamboman/mason.nvim", enabled = false },
    { "jaybaby/mason-nvim-dap.nvim", enabled = false },
    -- uncomment to import/override with your plugins
    { import = "plugins" },
    -- put this line at the end of spec to clear ensure_installed
    {
      "nvim-treesitter/nvim-treesitter",
      init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
      end,
      opts_extend = {},
      opts = {
        auto_install = false,
        ensure_installed = {},
        parser_install_dir = "~/.local/share/nvim/treesitter/parser",
      },
    },
  },
  performance = {
    rtp = {
      -- Setup correct config path
      paths = { vim.g.config_path },
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
