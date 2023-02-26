local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
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
    "zig",
    "tsx",
    "php",
    "swift"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
-- nnoremap("<C-c>", "<cmd>lua require('ts_context_commentstring.internal').update_commentstring()<cr>")
