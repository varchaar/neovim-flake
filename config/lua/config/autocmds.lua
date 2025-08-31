-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Auto-exit when only non-file windows remain (explorer, help, etc.)
vim.api.nvim_create_autocmd("WinClosed", {
  callback = function()
    -- Delay the check to ensure window closing is complete
    vim.schedule(function()
      local wins = vim.api.nvim_list_wins()
      local file_windows = 0

      for _, win in ipairs(wins) do
        if vim.api.nvim_win_is_valid(win) then
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_is_valid(buf) then
            local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
            local bt = vim.api.nvim_get_option_value("buftype", { buf = buf })
            -- local name = vim.api.nvim_buf_get_name(buf)
            -- print(string.format("Win: %d, Buf: %d, FT: '%s', BT: '%s', Name: '%s'", win, buf, ft, bt, name))
            -- Count windows with normal file buffers (empty buftype)
            if bt == "" or ft == "snacks_dashboard" then
              file_windows = file_windows + 1
            end
          end
        end
      end

      -- If no file windows remain but we still have windows open, exit
      if file_windows == 0 and #wins > 0 then
        vim.cmd("qa")
      end
    end)
  end,
})
