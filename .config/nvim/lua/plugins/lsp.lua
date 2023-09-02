return {
  {
    "https://github.com/MunifTanjim/prettier.nvim",
    init = function()
      local prettier = require("prettier")

      prettier.setup({
        bin = "prettier", -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      })
    end,
  },
  {
    "MunifTanjim/eslint.nvim",
    init = function()
      local eslint = require("eslint")

      eslint.setup({
        bin = "eslint", -- or `eslint_d`
        code_actions = {
          enable = true,
          apply_on_save = {
            enable = false,
            types = { "directive", "problem", "suggestion", "layout" },
          },
          disable_rule_comment = {
            enable = true,
            location = "separate_line", -- or `same_line`
          },
        },
        diagnostics = {
          enable = true,
          report_unused_disable_directives = false,
          run_on = "type", -- or `save`
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = function()
      local null_ls = require("null-ls")
      null_ls.setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.lsp.buf.format({ timeout_ms = 3000 })
    end,
    opts = {
      servers = {
        tailwindcss = {},
      },
    },
    keys = {
      { "sgd", "<cmd>split<cr>gd<cr>", desc = "Goto definition in split" },
      { "vgd", "<cmd>vsplit<cr>gd<cr>", desc = "Goto definition in vertical split" },
    },
  },
}
