return {
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
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
