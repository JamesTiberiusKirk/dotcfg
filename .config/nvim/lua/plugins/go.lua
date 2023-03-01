return {
  {
    "fatih/vim-go",
    lazy = false,
    init = function()
      vim.cmd("let g:go_fmt_command = 'goimports'")
      -- vim.cmd("au BufRead,BufNewFile *.html set filetype=gohtmltmpl")
      vim.cmd("au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl")
      -- vim.cmd("au BufRead,BufNewFile *.gohtml set filetype=html")
    end,
    keys = {
      { "gcov", "<cmd>GoCoverage<cr>", desc = "Go Coverage" },
      { "gC", "<cmd>GoCoverageClear<cr>", desc = "Go Coverage Clear" },
    },
  },
}
