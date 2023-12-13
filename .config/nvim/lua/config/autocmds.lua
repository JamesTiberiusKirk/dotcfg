-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = no_autoformat,
  pattern = {
    "html",
  },
  callback = function(event)
    vim.b.autoformat = false
  end,
})
