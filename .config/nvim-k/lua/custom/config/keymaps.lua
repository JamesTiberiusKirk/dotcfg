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
vim.keymap.set(
  "n",
  "<leader>rr",
  "<cmd>LspRestart<CR>",
  { noremap = true, silent = true, desc = "Restart the lsp" }
)

vim.keymap.set("v", "(", "di()<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "[", "di[]<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "{", "di{}<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "'", "di''<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", '"', 'di""<Esc>hp', { noremap = true, silent = true, desc = "Sorround with ()" })
vim.keymap.set("v", "`", "di``<Esc>hp", { noremap = true, silent = true, desc = "Sorround with ()" })



-- Clear highlighting
vim.keymap.set("n", "<leader><ESC>", "<cmd>noh<cr>", { noremap = true, silent = true, desc = "Sorround with ()" })



