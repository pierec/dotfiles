" ETC
set nobackup

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'csexton/trailertrash.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-dirvish'
Plug 'leafgarland/typescript-vim'
Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" PLUGINS - THEMES
Plug 'xero/sourcerer.vim'
call plug#end()

" COLORSCHEME
set background=dark
colorscheme sourcerer

" INDENTATION
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" UI
set number
set showcmd
set wildmenu
set lazyredraw
set showmatch
set scrolloff=10

au FileType python set colorcolumn=80
au FileType python set textwidth=79

" CLIPBOARD
set clipboard=unnamedplus

" STATUSLINE
set laststatus=2

" BACKUPS
set noswapfile
set backupdir=/tmp/

" LEADER KEY
let mapleader=" "

" DEOPLETE
let g:deoplete#enable_at_startup = 1

" NEOMAKE
let g:neomake_typescript_tslint_maker = {
    \ 'args': [],
    \ 'errorformat': '%EERROR: %f[%l\, %c]: %m',
    \ }
let g:neomake_typescript_enabled_makers= ['tslint']
autocmd BufWritePost,BufEnter * Neomake

" CTRLP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

" AIRLINE
let g:airline_theme = 'raven'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ''

" DIRVISH
nnoremap <leader>d :Dirvish<CR>

" AUTOCMD
autocmd FileType c,cpp,python,javascript,shell autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python,js,ts,bash,html autocmd BufWritePre <buffer> %s/\s\+$//e

" SHORTCUTS
nnoremap <Tab> <c-w>w

nnoremap M J

"nnoremap <up> <C-W><C-K>
"nnoremap <down> <C-W><C-J>
"nnoremap <right> <C-W><C-L>
"nnoremap <left> <C-W><C-H>
nnoremap <leader>x :Bd<CR>
nnoremap <leader>X :bd<CR>

nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap ; :call NERDComment(0,"toggle")<CR>
vnoremap ; :call NERDComment(0,"toggle")<CR>
