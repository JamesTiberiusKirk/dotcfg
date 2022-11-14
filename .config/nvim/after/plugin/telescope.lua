require('telescope').setup{
defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
        i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
        }
    }
},
pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
        -- file_ignore_pattern = "vendor",
        find_command  = {
            "fd",
            "--no-ignore",
            "--type",
            "f",
            "--unrestricted",
            "-H",
            "-E",
            "db-data",
            "-E",
            "vendor",
            "-E",
            ".git"
        },
    }
},
extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
}
}

local nnoremap = require("jamestiberiuskirk.keymap").nnoremap
nnoremap("<leader>o", "<cmd>lua require('telescope.builtin').git_branches()<cr>")
-- nnoremap("<leader>p", "<cmd>lua require('telescope.builtin').git_files()<cr>")
nnoremap("<leader>p", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>f", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>v", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader>1", "<cmd>lua require('telescope.builtin').colorscheme()<cr>")
nnoremap("<silent>gs","<cmd>lua require('telescope.builtin').git_status()<cr>")
nnoremap("<leader>?","<cmd>Telescope keymaps<cr>")
