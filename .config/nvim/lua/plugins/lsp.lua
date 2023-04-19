return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {},
        templ = {
          default_config = {
            cmd = { "templ", "lsp" },
            filetypes = { "templ" },
            settings = {},
          },
        },
      },
    },
  },
}
