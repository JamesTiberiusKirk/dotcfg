return {
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "vrischmann/tree-sitter-templ",
    init = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
  -- add more treesitter parsers
  {
    dependencies = {
      "vrischmann/tree-sitter-templ",
    },
    "nvim-treesitter/nvim-treesitter",
    init = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "go",
        "gomod",
        "gowork",
        "hcl",
        "http",
        "templ",
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
        enable = true,
      },
      autotag = {
        enable = true,
      },
    },
  },
}
