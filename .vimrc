set nocompatible
syntax on
filetype off

" .vimrc.plug

call plug#begin('~/.vim/plugged')

" Git
" plug 'tpope/vim-fugitive'

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File finder
Plug 'vifm/vifm.vim'

" Theme
Plug 'morhetz/gruvbox'

" Tabs
Plug 'ap/vim-buftabline'


call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""

syntax on

set number relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set splitbelow splitright
set spell!

"set background=dark
"colorscheme gruvbox

"noremap <ALT-h> <C-w>h
"noremap <ALT-j> <C-w>j
"noremap <ALT-k> <C-w>k
"noremap <ALT-l> <C-w>l

" Pane navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" fsf settings
let g:fzf_preview_window = ['right:50%', 'ctrl-x']

" NERD Comments settings
let g:NERDSpaceDelims = 1
nmap <C-c> <leader>c<Space>
vmap <C-c> <leader>c<Space>

" NERD Tree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" autocmd VimEnter * NERDTree | wincmd p

" Navigating buffers 
nnoremap <C-N> :bnext<CR>
nnoremap <C-M> :bprev<CR>

inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

" Autosave
" let g:auto_save = 1

" Auto compile latex
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

" JS-beautify binding
" nnoremap <leader>ff :%!js-beautify -P -j -q -B -f -<CR>
nnoremap <leader>ff :%! prettydiff beautify source:<CR>

