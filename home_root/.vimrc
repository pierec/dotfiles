" ETC
filetype off
filetype plugin indent on
set nobackup

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'csexton/trailertrash.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-dirvish'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-bbye'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/matchit'
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
"au FileType python set textwidth=79

" CLIPBOARD
set clipboard=unnamedplus

" SET TERM TITLE
set title

" STATUSLINE
set laststatus=2

" SEARCH
set incsearch
set hlsearch

" BACKUPS
set noswapfile
set backupdir=/tmp/

" LEADER KEY
let mapleader=" "

" YCM
let g:ycm_filetype_whitelist = {'javascript': 1, 'python': 1, 'typescript': 1}
let g:ycm_python_binary_path = 'python'

" SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8', 'pep8']

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 0

" CTRLP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

" AIRLINE
let g:airline_theme = 'raven'
"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ''

" AUTOCMD
autocmd FileType c,cpp,python,javascript,shell autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python,js,ts,bash,html autocmd BufWritePre <buffer> %s/\s\+$//e

" SHORTCUTS
nnoremap <Tab> <c-w>w

nnoremap M J

nnoremap K <C-W><C-K>
nnoremap J <C-W><C-J>
nnoremap L <C-W><C-L>
nnoremap H <C-W><C-H>
nnoremap <leader>x :Bd<CR>
nnoremap <leader>X :bd<CR>

nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader><leader> :nohlsearch<CR>

nnoremap ; :call NERDComment(0,"toggle")<CR>
vnoremap ; :call NERDComment(0,"toggle")<CR>
