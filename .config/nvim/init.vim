
syntax on
filetype off

" .vimrc.plug

call plug#begin('~/.config/nvim/plugged')

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

" Statusbar
Plug 'itchyny/lightline.vim'

" Finder
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

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

filetype plugin indent on
syntax on

" Making the active window more obvious
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    autocmd WinLeave * set colorcolumn=0
augroup END

set mouse=a
set number relativenumber
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set scrolloff=12
set splitbelow splitright
set spell!
set title

set background=dark
colorscheme gruvbox

let mapleader=" "

" Pane navigation
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" NERD Comments settings
let g:NERDleaderDelims = 1
nmap <C-c> <leader>c<leader>
vmap <C-c> <leader>c<leader>

" NERD Tree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" autocmd VimEnter * NERDTree | wincmd p

" Navigating buffers (Tabs)
nnoremap <C-M> :bnext<CR>
nnoremap <C-N> :bprev<CR>
" nnoremap <C-W><C-W> :bd<CR>

" Closing buffer without closing window
nmap <leader>d :b#<bar>bd#<CR>

" Make leader then Esc clear search highlights
nnoremap <silent> <leader><Esc> <Esc>:nohlsearch<CR><Esc>

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Autosave
" let g:auto_save = 1

" Auto compile latex
" autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
" autocmd BufWritePost *.tex silent! execute "!pdflatex -interaction=nonstopmode % >/dev/null 2>&1" | redraw!

" JS-beautify binding
" nnoremap <leader>ff :%!js-beautify -P -j -q -B -f -<CR>
" nnoremap <leader>ff :%! prettydiff beautify source:<CR>


" CoC
" Rename/reformat doesn't work atm for GO 
nmap <leader>r <Plug>(coc-rename) 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'


" Go Stuff
let g:go_fmt_command = "goimports"
"au filetype go inoremap <buffer> . .<C-x><C-o>


" Todo-comments config
lua << EOF
  require("todo-comments").setup {}
EOF

nnoremap <silent> <leader>tt :TodoTelescope<CR>
" Run TodoTelescope if tab is empty
augroup LaunchShowContext | au!
    autocmd BufEnter *
        \ if TabIsEmpty()
            \ | execute 'autocmd VimEnter * TodoTelescope'
        \ | endif
augroup end

" Telescope config
nnoremap <leader>p <cmd>lua require('telescope.builtin').git_files()<cr>

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

