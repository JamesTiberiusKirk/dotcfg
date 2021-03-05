set nocompatible
syntax on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/vim-auto-save'


call vundle#end()
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


"noremap <ALT-h> <C-h>
"noremap <ALT-j> <C-j>
"noremap <ALT-k> <C-k>
"noremap <ALT-l> <C-l>

noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l


inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"let g:auto_save = 1


autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!

