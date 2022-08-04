require('nvim_comment').setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  -- line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  -- operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_objemct = "ic",

  -- to make it work with treesitter commenter logic
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})


-- TODO: this does not work properly in visual mode. vim.cmd fix bellow
-- vim.api.nvim_set_keymap('v', '<C-c>', "<cmd>CommentToggle<cr><Esc>", { noremap = true, silent = true });
-- vim.api.nvim_set_keymap('n', '<C-c>', "<cmd>CommentToggle<cr>", { noremap = true, silent = true });

vim.cmd[[
  nmap <C-c> :CommentToggle<cr>
  vmap <C-c> :CommentToggle<cr>
]]
