-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.api.nvim_del_keymap("n", "<C-h>")
-- vim.api.nvim_del_keymap("n", "<C-j>")
-- vim.api.nvim_del_keymap("n", "<C-k>")
-- vim.api.nvim_del_keymap("n", "<C-l>")

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

vim.keymap.set("v", "(", "di()<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "[", "di[]<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "{", "di{}<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "'", "di''<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", '"', 'di""<Esc>hp', { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "`", "di``<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
