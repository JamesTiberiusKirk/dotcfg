-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    relativenumber = true,
    number = true,
    adaptive_size = true,
    centralize_selection = true,
    width = 40,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" }, -- EXAMPLE
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
nnoremap("<leader>t","<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>ll","<cmd>NvimTreeFindFile<CR>")
