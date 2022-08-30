require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "gowork",
    "hcl",
    "help",
    "html",
    "http",
    "javascript",
    "typescript",
    "vue",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "ruby",
    "rust",
    "toml",
    "vim",
    "yaml",
    "zig"
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

-- local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
-- nnoremap("<C-c>", "<cmd>lua require('ts_context_commentstring.internal').update_commentstring()<cr>")
