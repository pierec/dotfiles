" ETC
filetype off
filetype plugin indent on
set nobackup

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'moll/vim-bbye'
Plug 'wellle/targets.vim'
Plug 'leafgarland/typescript-vim'
Plug 'shougo/unite.vim'
Plug 'shougo/vimproc.vim'

" PLUGINS - THEMES
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
call plug#end()

" COLORSCHEME
set t_Co=256
"set background=dark
"colorscheme zenburn
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

au FileType python set colorcolumn=80
au FileType python set textwidth=79

" STATUSLINE
set laststatus=2

" SEARCH
set incsearch
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" YCM
let g:ycm_filetype_whitelist = {'javascript': 1, 'python': 1, 'typescript': 1}
nnoremap <F1> :YcmCompleter GoToDefinition<CR>

" NERDTREE
nnoremap <F2> :NERDTreeToggle<CR> 

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8', 'flake8', 'pychecker']
let g:syntastic_aggregate_error = 1
let g:syntastic_loc_list_height = 5

" JEDI
let g:jedi#force_py_version = 3


" SHORTCUTS
let mapleader=" "
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><left> <C-W><C-H>
nnoremap <leader>w :bnext<CR>
nnoremap <leader>q :bprevious<CR>
nnoremap <leader>x :Bd<CR>
nnoremap <leader>X :bd<CR>

" CTRLP
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra' 

" UNITE
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>t :<C-u>UniteWithProjectDir -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
"nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
"nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru   -start-insert file_mru<cr>
"nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" SET TERM TITLE
set title
