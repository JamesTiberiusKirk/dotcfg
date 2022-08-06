local tree_cb = require'nvim-tree.config'.nvim_tree_callback
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
        { key = "?", cb = tree_cb("toggle_help") },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = "1",
  },
  filters = {
    dotfiles = false,
    ignored = false,
  },
  git = {
    ignore = false,
  },
})

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
nnoremap("<leader>t","<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>ll","<cmd>NvimTreeFindFile<CR>")
