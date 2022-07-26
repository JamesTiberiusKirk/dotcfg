" .vimrc.plug
call plug#begin('~/.config/nvim/plugged')
  
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

" Navigating buffers
map <leader>m :bnext<CR>
map <leader>n :bprev<CR>

" Navigating tabs (vimtabs)
map <leader>v :tabnext<CR>

" Closing buffer without closing window
nmap <leader>d :b#<bar>bd#<CR>

" Make leader then Esc clear search highlights
nnoremap <silent> <leader><Esc> <Esc>:nohlsearch<CR><Esc>

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


"""""""""""""' Functions """""""""""""""""""""""""""""""""""""""""""""""

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
