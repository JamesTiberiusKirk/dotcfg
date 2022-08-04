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

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
-- nnoremap("gd","<cmd>lua vim.lsp.buf.declaration()<cr>")
nnoremap("gd","<cmd>lua vim.lsp.buf.definition()<cr>")
nnoremap("gi","<cmd>lua vim.lsp.buf.implementation()<cr>")
nnoremap("gr","<cmd>lua vim.lsp.buf.reference()<cr>")
nnoremap("<leader>g","<cmd>lua vim.lsp.buf.hover()<cr>")
nnoremap("<leader>r","<cmd>lua vim.lsp.buf.rename()<cr>")
nnoremap("<leader>do","<cmd>lua vim.lsp.buf.action()<cr>")
