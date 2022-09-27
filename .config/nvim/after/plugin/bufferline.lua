require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = "bdelete! %d",-- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      style = 'icon',
      icon = '|',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 35,
    -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 10,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    diagnostics_indicator = function(_, _, diagnostics_dict, _)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center" }},
    color_icons = true , -- whether or not to add the filetype icon highlights
    show_buffer_icons = true , -- disable filetype icons for buffers
    show_buffer_close_icons = true ,
    show_buffer_default_icon = true , -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true ,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick",
    enforce_regular_tabs = false,
    always_show_bufferline = true ,
    sort_by = 'insert_at_end',
  }
}

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers <cmd>bnext and :bprevious will not respect the custom ordering
nnoremap("<leader>m","<cmd>BufferLineCycleNext<CR>")
nnoremap("<leader>n","<cmd>BufferLineCyclePrev<CR>")

-- These commands will move the current buffer backwards or forwards in the bufferline
nnoremap("<leader>M","<cmd>BufferLineMoveNext<CR>")
nnoremap("<leader>N","<cmd>BufferLineMovePrev<CR>")

-- These commands will sort buffers by directory, language, or a custom criteria
-- nnoremap("be","<cmd>BufferLineSortByExtension<CR>")
nnoremap("<silent>bd","<cmd>BufferLineSortByDirectory<CR>")
-- nnoremap("<silent><mymap>","<cmd>lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>")
