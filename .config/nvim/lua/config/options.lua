-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd([[ 
  set softtabstop=4
  set tabstop=4
  set shiftwidth=4
  set expandtab
  set conceallevel=0
]])

vim.cmd([[
  command ToggleRelative lua ToggleRelative()
  " command ToggleTabWidth lua ToggleTabWidth()
]])

function ToggleRelative()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

-- function ToggleTabWidth()
--   local current_tab_width = vim.api.nvim_buf_get_option(0, "tabstop")
--
--   if current_tab_width == 2 then
--     vim.api.nvim_buf_set_option(0, "tabstop", 4)
--     vim.api.nvim_buf_set_option(0, "shiftwidth", 4)
--     vim.api.nvim_command('echo "Tab width set to 4"')
--   elseif current_tab_width == 4 then
--     vim.api.nvim_buf_set_option(0, "tabstop", 2)
--     vim.api.nvim_buf_set_option(0, "shiftwidth", 2)
--     vim.api.nvim_command('echo "Tab width set to 2"')
--   else
--     vim.api.nvim_command('echoerr "Invalid tab width"')
--   end
-- end
