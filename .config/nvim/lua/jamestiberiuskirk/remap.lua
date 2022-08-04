local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
local inoremap = require("jamestiberiuskirk.keymap").inoremap

nnoremap("<leader>2", "<cmd>Ex<CR>")

-- Pane navigation
nnoremap("<leader>h", "<C-w>h")
nnoremap("<leader>j", "<C-w>j")
nnoremap("<leader>k", "<C-w>k")
nnoremap("<leader>l", "<C-w>l")

-- Closing buffer
nnoremap("<leader>d", "<cmd>b#<bar>bd#<CR>")
nnoremap("<leader>D", "<cmd>b#<bar>bd!#<CR>")

-- Make leader then Esc clear search highlights
nnoremap("<leader><Esc>", "<Esc><cmd>nohlsearch<CR><Esc>")

-- Autocompleting brakets
inoremap("{<cr>", "{<cr>}<c-o><s-o>")
inoremap("[<cr>", "[<cr>]<c-o><s-o>")
inoremap("(<cr>", "(<cr>)<c-o><s-o>")


-- Navigating buffers
nnoremap("<leader>m", "<cmd>bnext<CR>")
nnoremap("<leader>n", "<cmd>bprev<CR>")

-- Navigating tabs (vimtabs)
nnoremap("<leader>v", "<cmd>tabnext<CR>")


