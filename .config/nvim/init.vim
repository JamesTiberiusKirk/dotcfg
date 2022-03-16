syntax on
filetype off

" .vimrc.plug

call plug#begin('~/.config/nvim/plugged')


" Powerline theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terraform
Plug 'hashivim/vim-terraform'

Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" Dependency of telescope and todo-comments
Plug 'nvim-lua/plenary.nvim'

" Comments parser
Plug 'folke/todo-comments.nvim'

" Telescope fuzzy finder
Plug 'nvim-telescope/telescope.nvim'

" Window resize mode
Plug 'https://github.com/simeji/winresizer'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Code commenter
Plug 'preservim/nerdcommenter'

" Syntax highlighting
Plug 'dense-analysis/ale'

" NERDTree
Plug 'preservim/nerdtree'
" NERDTree plugins
Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'PhilRunninger/nerdtree-buffer-ops'
"Plug 'scrooloose/nerdtree-project-plugin' "the nerdtree state save
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-visual-selection'

" Buffer as tab list
Plug 'ap/vim-buftabline'

" Git
Plug 'airblade/vim-gitgutter'

" Statusbar
Plug 'itchyny/lightline.vim'

" File finder
Plug 'vifm/vifm.vim'

" Theme
Plug 'morhetz/gruvbox'

" Tabs
Plug 'ap/vim-buftabline'

" Vim-go plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

"""""""""""""""""""""""""
set statusline+=%m

filetype plugin indent on
syntax on

" Making the active window more obvious
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=120
    autocmd WinLeave * set colorcolumn=0
augroup END

set mouse=a
set number relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
"set scrolloff=12
set splitbelow splitright
set spell!
set title
set mouse=a
set background=dark
colorscheme gruvbox

set clipboard+=unnamedplus

let mapleader=" "

" Pane navigation
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" For navigating buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Pugin configs

" NERD Comments settings
let g:NERDleaderDelims = 1
nmap <C-c> <leader>c<leader>
vmap <C-c> <leader>c<leader>

" NERD Tree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
nnoremap <leader>t :NERDTreeMirror<CR>:NERDTreeToggle<CR>
nnoremap <leader>ll :NERDTreeFind<CR>

" Navigating buffers (Tabs)
nnoremap <C-M> :bnext<CR>
nnoremap <C-N> :bprev<CR>

" Closing buffer without closing window
nmap <leader>d :b#<bar>bd#<CR>

" Make leader then Esc clear search highlights
nnoremap <silent> <leader><Esc> <Esc>:nohlsearch<CR><Esc>

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Autosave
" let g:auto_save = 1

" CoC
" Rename/reformat doesn't work atm for GO 
"nmap <leader>r <Plug>(coc-rename) 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'


" Go Stuff
let g:go_fmt_command = "goimports"
let g:go_build_tags = "integration,testcontainers"

" Todo-comments config
lua << EOF
  require("todo-comments").setup {}
EOF

nnoremap <silent> td :TodoTelescope<CR>
" Run TodoTelescope at startup if tab is empty
augroup LaunchShowContext | au!
    autocmd BufEnter *
        \ if TabIsEmpty()
            \ | execute 'autocmd VimEnter * TodoTelescope'
        \ | endif
augroup end

" Telescope config
nnoremap <leader>p <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<cr>

" Git vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" vim-airline - vim powerline theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'


nnoremap <silent> <leader># :call OpenTermInFileFolder()<CR>



" Terraform
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" /Terraform


"""""""""""""' Functions """""""""""""""""""""""""""""""""""""""""""""""

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
function! OpenTermInFileFolder()

  if TabIsEmpty() == 1
    echo "No open file"
    return 0
  endif

  let dir = expand('%:p:h')
  let shell_str="$TERM --working-directory " . dir . " &"

  echo(system(shell_str))
   
endfunction
