" ETC
filetype off
filetype plugin indent on
set nobackup

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'klen/python-mode'
Plug 'scrooloose/nerdtree'
call plug#end()

" INDENTATION
set tabstop=4
set softtabstop=4
set expandtab

" UI
set number
set cursorline
set showcmd
set wildmenu
set lazyredraw
set showmatch

au FileType python set colorcolumn=81
au FileType python set textwidth=79

" SEARCH
set incsearch
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" SHORTCUTS
let mapleader=","
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_folding = 0
nnoremap <C-UP> <C-W><C-K>
nnoremap <C-DOWN> <C-W><C-J>
nnoremap <C-RIGHT> <C-W><C-L>
nnoremap <C-LEFT> <C-W><C-H>
