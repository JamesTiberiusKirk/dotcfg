require("telescope").setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
      "vendor",
      "db-data"
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }

    }
  },
  pickers = {
    find_files = {
      find_command  = {
        "fd",
        "--no-ignore",
        "--type",
        "f",
        "--unrestricted",
        "-H",
        "-E",
        "db-data",
        "-E",
        "vendor*",
        "-E",
        "vendor",
        "-E",
        "*node_modules*",
        "-E",
        ".git"
      },
    }
  },
  extensions = {
  }
}

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
nnoremap("<leader>o", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
nnoremap("<leader>p", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>f", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>v", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>1", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")
nnoremap("<silent>gs","<cmd>lua require('telescope.builtin').git_status()<cr>")
nnoremap("<leader>?","<cmd>Telescope keymaps<cr>")
