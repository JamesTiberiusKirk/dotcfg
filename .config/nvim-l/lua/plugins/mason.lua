return {
  -- add any tools you want to have installed below
  --
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prettier")
      table.insert(opts.ensure_installed, "gopls")
      table.insert(opts.ensure_installed, "html-lsp")
    end,
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "stylua",
  --       "shellcheck",
  --       "shfmt",
  --       "flake8",
  --       "gopls",
  --       "js-debug-adapter",
  --       "prettier",
  --     },
  --   },
  -- },
}
