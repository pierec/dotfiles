" python env
let g:python_host_prog='/usr/bin/python'

" ETC
filetype off
filetype plugin indent on
set nobackup

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'moll/vim-bbye'
Plug 'wellle/targets.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'fisadev/vim-isort'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'csexton/trailertrash.vim'
Plug 'Shougo/vimproc.vim'

" PLUGINS - THEMES
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
call plug#end()

" COLORSCHEME
"set t_Co=256
"set background=dark
colorscheme zenburn
"highlight ColorColumn ctermbg=1

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
set scrolloff=5
set mouse=a

au FileType python set colorcolumn=80
au FileType python set textwidth=79

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
set backupdir=/tmp//

" LEADER KEY
let mapleader=" "

" YCM
let g:ycm_filetype_whitelist = {'javascript': 1, 'python': 1, 'typescript': 1}

" SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8', 'flake8', 'python']
let g:syntastic_aggregate_error = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1

" CTRLP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

" ISORT
let g:vim_isort_map = ''

" AUTOCMD
autocmd FileType c,cpp,python,javascript,shell autocmd BufWritePre <buffer> %s/\s\+$//e

" SHORTCUTS
nnoremap <Tab> <c-w>w
nnoremap <bs> <c-w>W

nnoremap <S-Up> <C-W><C-K>
nnoremap <S-Down> <C-W><C-J>
nnoremap <S-Right> <C-W><C-L>
nnoremap <S-Left> <C-W><C-H>
nnoremap <leader>x :Bd<CR>
nnoremap <leader>X :bd<CR>

nnoremap <leader>b :CtrlPBuffer<CR>

nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader><leader> :nohlsearch<CR>

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TagbarToggle<CR>

nnoremap <leader>; :call NERDComment(0,"toggle")<CR>
vnoremap <leader>; :call NERDComment(0,"toggle")<CR>

" TRIM TRAILING WHITESPACE ON SAVE
autocmd FileType python,js,ts,bash,html autocmd BufWritePre <buffer> %s/\s\+$//e
