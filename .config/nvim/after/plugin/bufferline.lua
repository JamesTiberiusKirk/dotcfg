require("bufferline").setup{}

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers <cmd>bnext and :bprevious will not respect the custom ordering
nnoremap("<leader>m","<cmd>BufferLineCycleNext<CR>")
nnoremap("<leader>n","<cmd>BufferLineCyclePrev<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
nnoremap("<leader>M","<cmd>BufferLineMoveNext<CR>")
nnoremap("<leader>N","<cmd>BufferLineMovePrev<CR>")

-- These commands will sort buffers by directory, language, or a custom criteria
-- nnoremap("be","<cmd>BufferLineSortByExtension<CR>")
nnoremap("<silent>bd","<cmd>BufferLineSortByDirectory<CR>")
-- nnoremap("<silent><mymap>","<cmd>lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>")
