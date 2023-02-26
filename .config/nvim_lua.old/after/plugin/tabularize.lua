local nnoremap = require("jamestiberiuskirk.keymap").nnoremap

vim.api.nvim_set_keymap("n", "T", "<cmd>Tabularize /:\zs<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "T", "<cmd>Tabularize /:\zs<CR>", { noremap = true, silent = false })


