require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

-- require('navigator.lspclient.mapping').setup()

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
-- nnoremap("gd","<cmd>lua vim.lsp.buf.declaration()<cr>")
nnoremap("gd","<cmd>lua vim.lsp.buf.definition()<cr>")
-- go to deginition in a split and vertical split bellow
nnoremap("sgd","<cmd>sp<cr><C-w>j<cmd>lua vim.lsp.buf.definition()<cr>")
nnoremap("vgd","<cmd>vsp<cr><C-w>l<cmd>lua vim.lsp.buf.definition()<cr>")

nnoremap("gi","<cmd>lua vim.lsp.buf.implementation()<cr>")
nnoremap("gr","<cmd>lua vim.lsp.buf.reference()<cr>")
nnoremap("<leader>g","<cmd>lua vim.lsp.buf.hover()<cr>")
nnoremap("<leader>r","<cmd>lua vim.lsp.buf.rename()<cr>")
nnoremap("<leader>do","<cmd>lua vim.lsp.buf.action()<cr>")
nnoremap("err","<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")
