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

            -- vim.cmd([[ 
            --     set softtabstop=2
            --     set tabstop=2
            --     set shiftwidth=2
            --     set expandtab
            --     set conceallevel=0
            -- ]])

            eslint.setup({
                bin = "eslint", -- or `eslint_d`
                code_actions = {
                    enable = true,
                    -- apply_on_save = {
                    --   enable = false,
                    --   types = { "directive", "problem", "suggestion", "layout" },
                    -- },
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

                ---@type lspconfig.options.tsserver
                tsserver = {
                    keys = {
                        {
                            "<leader>co",
                            function()
                                vim.lsp.buf.code_action({
                                    apply = true,
                                    context = {
                                        only = { "source.organizeImports.ts" },
                                        diagnostics = {},
                                    },
                                })
                            end,
                            desc = "Organize Imports",
                        },
                    },
                    settings = {
                        typescript = {
                            format = {
                                indentSize = vim.o.shiftwidth,
                                convertTabsToSpaces = vim.o.expandtab,
                                tabSize = vim.o.tabstop,
                            },
                        },
                        javascript = {
                            format = {
                                indentSize = vim.o.shiftwidth,
                                convertTabsToSpaces = vim.o.expandtab,
                                tabSize = vim.o.tabstop,
                            },
                        },
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                },


            },
        },
        keys = {
            { "sgd", "<cmd>split<cr>gd<cr>", desc = "Goto definition in split" },
            { "vgd", "<cmd>vsplit<cr>gd<cr>", desc = "Goto definition in vertical split" },
        },
    },
}
