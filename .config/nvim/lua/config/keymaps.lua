-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>d",
  "<cmd>b#<bar>bd#<CR>",
  { noremap = true, silent = true, desc = "Close current buffer without closing pane" }
)
vim.keymap.set(
  "n",
  "<leader>D",
  "<cmd>b#<bar>bd!#<CR>",
  { noremap = true, silent = true, desc = "Force quit current buffer without closing pane" }
)
