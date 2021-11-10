
syntax on
filetype off

" .vimrc.plug

call plug#begin('~/.config/nvim/plugged')


" Vim window resizer
Plug 'https://github.com/simeji/winresizer'

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

" Dart & Flutter
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" These are for dart autocompletion
Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'

" Vim-go plugin
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }


call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""

syntax on

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

"noremap <ALT-h> <C-w>h
"noremap <ALT-j> <C-w>j
"noremap <ALT-k> <C-w>k
"noremap <ALT-l> <C-w>l

" Pane navigation
" noremap <Space>h <C-w>h
" noremap <Space>j <C-w>j
" noremap <Space>k <C-w>k
" noremap <Space>l <C-w>l
" noremap <Space>s <C-w><CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-s> <C-w><CR>

" NERD Comments settings
let g:NERDSpaceDelims = 1
nmap <C-c> <leader>c<Space>
vmap <C-c> <leader>c<Space>

" NERD Tree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <Space>t :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" autocmd VimEnter * NERDTree | wincmd p

" Navigating buffers (Tabs)
nnoremap <C-M> :bnext<CR>
nnoremap <C-N> :bprev<CR>
nnoremap <C-W><C-W> :bd<CR>

" Make Space then Esc clear search highlights
nnoremap <silent> <Space><Esc> <Esc>:nohlsearch<CR><Esc>

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


" Dart & Flutter
"let g:lsc_auto_map = v:true
"nnoremap <leader>fa :FlutterRun<cr>
"nnoremap <leader>fq :FlutterQuit<cr>
"nnoremap <leader>fr :FlutterHotReload<cr>
"nnoremap <leader>fR :FlutterHotRestart<cr>
"nnoremap <leader>fD :FlutterVisualDebug<cr>

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'

" FZF
nnoremap <silent> <C-p> :GFiles<CR>
" nnoremap <silent> <C-^p>:Files <CR>

" Go Stuff
" This is for managing go imports on autosave
let g:go_fmt_command = "goimports"
"au filetype go inoremap <buffer> . .<C-x><C-o>
