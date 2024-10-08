return {
  -- {
  --     "davidosomething/format-ts-errors.nvim",
  -- },
  -- {
  --     "neovim/nvim-lspconfig",
  --     opts = {
  --       servers = {
  --         tsserver = {
  --           handlers = {
  --           ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
  --             if result.diagnostics == nil then
  --               return
  --             end
  --
  --             -- ignore some tsserver diagnostics
  --             local idx = 1
  --             while idx <= #result.diagnostics do
  --               local entry = result.diagnostics[idx]
  --
  --               local formatter = require("format-ts-errors")[entry.code]
  --               entry.message = formatter and formatter(entry.message) or entry.message
  --
  --               -- codes: https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json
  --               if entry.code == 80001 then
  --                 -- { message = "File is a CommonJS module; it may be converted to an ES module.", }
  --                 table.remove(result.diagnostics, idx)
  --               else
  --                 idx = idx + 1
  --               end
  --             end
  --
  --             vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
  --           end,
  --         },
  --       },
  --     },
  --     },
  -- },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
    },
  },
}

