vim.cmd("let g:go_fmt_command = 'goimports'")
vim.cmd("au BufRead,BufNewFile *.html set filetype=gohtmltmpl")
vim.cmd("au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl")
vim.cmd("au BufRead,BufNewFile *.gohtml set filetype=html")

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
nnoremap("gc","<cmd>GoCoverage<CR>")
nnoremap("gcc","<cmd>GoCoverageClear<CR>")

-- setup lsp client
require('lspconfig').gopls.setup({})
