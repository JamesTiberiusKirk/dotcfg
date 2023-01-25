require("jamestiberiuskirk.set")
require("jamestiberiuskirk.remap")
require("jamestiberiuskirk.packer")
require("jamestiberiuskirk.reload")

vim.api.nvim_set_keymap("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>", { noremap = true, silent = false })
