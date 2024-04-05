return {

  -- treesitter stuff
  { "nvim-treesitter/nvim-treesitter-context" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
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

  -- LSP stuff
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "gopls",
        "lua",
        "js-debug-adapter",
        "prettier",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim"
    },
    init = function()
    end,
  },

  -- CMP stuff
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp" ,
    },
    init = function()
      -- Set up nvim-cmp.
      local cmp = require'cmp'

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("lspconfig")["gopls"].setup({
        capabilities = capabilities,
      })

    end,
  },
  {
    "kassio/neoterm",
    -- keys = {
    --   { "<leader>L", "<cmd>Tclear!<cr>", desc = "Clear terminal" },
    -- },
  },
  {
    "vim-test/vim-test",
    init = function()
      vim.cmd([[
      let test#strategy = "neoterm"
      ]])
    end,
    keys = {
      { "<leader>t", "<cmd>TestNearest<cr>", desc = "Test nearest function" },
      -- {
      --   "<leader>t",
      --   function()
      --     vim.cmd("vsplit")
      --     vim.cmd("TestNearest")
      --   end,
      --   desc = "Test nearest function",
      -- },
      { "<leader>T", "<cmd>TestFile<cr>", desc = "Test entire file" },
      -- {
      --   "<leader>T",
      --   function()
      --     vim.cmd("vsplit")
      --     vim.cmd("TestFile")
      --   end,
      --   desc = "Test entire file",
      -- },
    },
  },
}
