return {
  {
    "cursortab/cursortab.nvim",
    -- version = "*",  -- Use latest tagged version for more stability
    lazy = false, -- The server is already lazy loaded
    build = "cd server && go build",
    config = function()
      require("cursortab").setup({
        provider = {
          type = "zeta-2",
          model = "zed-industries_zeta-2",
          url = "http://192.168.100.204:8080",
        },
      })
    end,
  },
}
