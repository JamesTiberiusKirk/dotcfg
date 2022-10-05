" .vimrc.plug
call plug#begin('~/.config/nvim/plugged')

  " Overseer runner
  Plug 'stevearc/overseer.nvim'
  
  " Git Blamer
  Plug 'APZelos/blamer.nvim'
  
  " Telescope fuzzy finder and dependency
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-github.nvim'
  "Plug 'nvim-telescope/telescope-file-browser.nvim'
  
  " Window resize mode
  Plug 'https://github.com/simeji/winresizer'
  
  " Code completion
  "Plug 'neovim/nvim-lspconfig'
  "Plug 'hrsh7th/cmp-nvim-lsp'
  "Plug 'hrsh7th/cmp-buffer'
  "Plug 'hrsh7th/cmp-path'
  "Plug 'hrsh7th/cmp-cmdline'
  "Plug 'hrsh7th/nvim-cmp'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
  Plug 'neoclide/jsonc.vim'

  " Code commenter
  Plug 'preservim/nerdcommenter'
  
  " NERDTree
  Plug 'preservim/nerdtree'
  " NERDTree plugins
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  
  " Buffer as tab list
  Plug 'ap/vim-buftabline'
  
  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  " Statusbar
  Plug 'itchyny/lightline.vim'
  
  " Theme
  Plug 'rafi/awesome-vim-colorschemes'
  
  " Tabs
  Plug 'ap/vim-buftabline'
  
  " Vim-go plugin
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  " Treesitter 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  
call plug#end()

"""""""""""""""""""""""""

filetype plugin indent on
syntax on

set statusline+=%m

set mouse=a
set number relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=8
set splitbelow splitright
set spell!
set title
set mouse=a
set background=dark
colorscheme space-vim-dark  
set colorcolumn=90

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

set clipboard+=unnamedplus

let mapleader=" "

" Pane navigation
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Save binding bc its annoying to type :w with my keyboard
map <leader>s :w<CR>

" Navigating buffers
map <leader>m :bnext<CR>
map <leader>n :bprev<CR>

" Navigating tabs (vimtabs)
map <leader>v :tabnext<CR>

" Closing buffer without closing window
nmap <leader>d :b#<bar>bd#<CR>
nmap <leader>D :b#<bar>bd!#<CR>

" Make leader then Esc clear search highlights
nnoremap <silent> <leader><Esc> <Esc>:nohlsearch<CR><Esc>

" Pugin configs

" NERD Comments settings
let g:NERDleaderDelims = 1
nmap <C-c> <leader>c<leader>
vmap <C-c> <leader>c<leader>

" NERD Tree Settings
"nnoremap <leader>n :NERDTreeFocus<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
nnoremap <leader>t :NERDTreeMirror<CR>:NERDTreeToggle<CR>
nnoremap <leader>ll :NERDTreeFind<CR>


" CoC
let g:coc_global_extensions = ['coc-tsserver']
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = 'vsplit'
nmap <leader>r <Plug>(coc-rename) 
nmap <silent> <leader>g :call <SID>show_documentation()<CR>
nmap <silent> gd :call CocAction("jumpDefinition")<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gc :GoCoverage<CR>
nmap <silent> gcc :GoCoverageClear<CR>
nmap <leader>do <Plug>(coc-codeaction)

" Go Stuff
let g:go_fmt_command = "goimports"
let g:go_build_tags = "integration"

" Telescope config
lua << EOF
  require('telescope').load_extension('gh')
EOF
nnoremap <leader>i <cmd>lua require('telescope').extensions.gh.pull_request()<cr>
nnoremap <leader>o <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>p <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>1 <cmd>lua require('telescope.builtin').colorscheme()<cr>
nnoremap <silent>gs <cmd>lua require('telescope.builtin').git_status()<cr>

" Git vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

nnoremap <leader>tff :!terraform fmt %<CR>

" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 500

" Setup Treesitter and friends
"
" NOTE: originally used `ensure_installed = "all"` but an experimental PHP
" parser was causing NPM lockfile errors.
"
lua <<EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "css",
    "dockerfile",
    "go",
    "gomod",
    "gowork",
    "hcl",
    "help",
    "html",
    "http",
    "javascript",
    "typescript",
    "vue",
    "json",
    "lua",
    "make",
    "markdown",
    "python",
    "regex",
    "ruby",
    "rust",
    "toml",
    "vim",
    "yaml",
    "zig"
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
EOF


" Overseer setup 
"lua << EOF
"require("overseer").setup({
  "-- Default task strategy
  "strategy = "terminal",
  "-- Template modules to load
  "templates = { "builtin" },
  "-- When true, tries to detect a green color from your colorscheme to use for success highlight
  "auto_detect_success_color = true,
  "-- Patch nvim-dap to support preLaunchTask and postDebugTask
  "dap = true,
  "-- Configure the task list
  "task_list = {
    "-- Default detail level for tasks. Can be 1-3.
    "default_detail = 1,
    "-- max_width = {100, 0.2} means "the lesser of 100 columns or 20% of total"
    "max_width = { 100, 0.2 },
    "-- min_width = {40, 0.1} means "the greater of 40 columns or 10% of total"
    "min_width = { 40, 0.1 },
    "-- String that separates tasks
    "separator = "────────────────────────────────────────",
    "-- Default direction. Can be "left" or "right"
    "direction = "right",
    "-- Set keymap to false to remove default behavior
    "-- You can add custom keymaps here as well (anything vim.keymap.set accepts)
    "bindings = {
      "["?"] = "ShowHelp",
      "["<CR>"] = "RunAction",
      "["<C-e>"] = "Edit",
      "["o"] = "Open",
      "["<C-v>"] = "OpenVsplit",
      "["<C-f>"] = "OpenFloat",
      "["p"] = "TogglePreview",
      "["<C-l>"] = "IncreaseDetail",
      "["<C-h>"] = "DecreaseDetail",
      "["L"] = "IncreaseAllDetail",
      "["H"] = "DecreaseAllDetail",
      "["["] = "DecreaseWidth",
      "["]"] = "IncreaseWidth",
      "["{"] = "PrevTask",
      "["}"] = "NextTask",
    "},
  "},
  "-- See :help overseer.actions
  "actions = {},
  "-- Configure the floating window used for task templates that require input
  "-- and the floating window used for editing tasks
  "form = {
    "border = "rounded",
    "zindex = 40,
    "min_width = 80,
    "max_width = 0.9,
    "min_height = 10,
    "max_height = 0.9,
    "-- Set any window options here (e.g. winhighlight)
    "win_opts = {
      "winblend = 10,
    "},
  "},
  "task_launcher = {
    "-- Set keymap to false to remove default behavior
    "-- You can add custom keymaps here as well (anything vim.keymap.set accepts)
    "bindings = {
      "i = {
        "["<C-s>"] = "Submit",
      "},
      "n = {
        "["<CR>"] = "Submit",
        "["<C-s>"] = "Submit",
        "["?"] = "ShowHelp",
      "},
    "},
  "},
  "task_editor = {
    "-- Set keymap to false to remove default behavior
    "-- You can add custom keymaps here as well (anything vim.keymap.set accepts)
    "bindings = {
      "i = {
        "["<CR>"] = "NextOrSubmit",
        "["<C-s>"] = "Submit",
        "["<Tab>"] = "Next",
        "["<S-Tab>"] = "Prev",
      "},
      "n = {
        "["<CR>"] = "NextOrSubmit",
        "["<C-s>"] = "Submit",
        "["<Tab>"] = "Next",
        "["<S-Tab>"] = "Prev",
        "["?"] = "ShowHelp",
      "},
    "},
  "},
  "-- Configure the floating window used for confirmation prompts
  "confirm = {
    "border = "rounded",
    "zindex = 40,
    "min_width = 80,
    "max_width = 0.5,
    "min_height = 10,
    "max_height = 0.9,
    "-- Set any window options here (e.g. winhighlight)
    "win_opts = {
      "winblend = 10,
    "},
  "},
  "-- Configuration for task floating windows
  "task_win = {
    "-- How much space to leave around the floating window
    "padding = 2,
    "border = "rounded",
    "-- Set any window options here (e.g. winhighlight)
    "win_opts = {
      "winblend = 10,
    "},
  "},
  "-- Aliases for bundles of components. Redefine the builtins, or create your own.
  "component_aliases = {
    "-- Most tasks are initialized with the default components
    "default = {
      ""on_output_summarize",
      ""on_exit_set_status",
      ""on_complete_notify",
      ""on_complete_dispose",
    "},
  "},
  "-- This is run before creating tasks from a template
  "pre_task_hook = function(task_defn, util)
    "-- util.add_component(task_defn, "on_result_diagnostics", {"timeout", timeout = 20})
    "-- util.remove_component(task_defn, "on_complete_dispose")
    "-- task_defn.env = { MY_VAR = 'value' }
  "end,
  "-- A list of components to preload on setup.
  "-- Only matters if you want them to show up in the task editor.
  "preload_components = {},
  "-- Configure where the logs go and what level to use
  "-- Types are "echo", "notify", and "file"
  "log = {
    "{
      "type = "echo",
      "level = vim.log.levels.WARN,
    "},
    "{
      "type = "file",
      "filename = "overseer.log",
      "level = vim.log.levels.WARN,
    "},
  "},
"})
"EOF


"""""""""""""" Lua Utils """""""""""""""""""""""""""""""""""""""""""""""

lua <<EOF
  vim.keymap.set('n', '<Leader>2', '<Cmd>lua require("lua/utils").buff_run({"go","test","-v","./..."})<CR>')
EOF


""""""""""""" Functions """""""""""""""""""""""""""""""""""""""""""""""

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
     let &hidden=s:maximize_hidden_save  unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Function to determine if the current window is empty
" Stolen from https://stackoverflow.com/questions/5025558/check-if-current-tab-is-empty-in-vim#5026456
function! TabIsEmpty()
    " Remember which window we're in at the moment
    let initial_win_num = winnr()

    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction

" Function to open up a fresh terminal in the working folder of the currently opened file
" TODO: if in tumux, open new tmux window or pane
function! OpenTermInFileFolder()

  if TabIsEmpty() == 1
    echo "No open file"
    return 0
  endif

  let dir = expand('%:p:h')
  let shell_str="$TERM --working-directory " . dir . " &"

  echo(system(shell_str))
   
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
