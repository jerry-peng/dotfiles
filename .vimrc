" Jerry Peng's vimrc
" Credit:
" https://dougblack.io/words/a-good-vimrc.html
" https://gist.github.com/simonista/8703722#file-vimrc-L1

set nocompatible    " set to not be vi-compatible
filetype off        " force plugins to load when it is turned back on below

""" Plugins
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'raimondi/delimitmate'
Plug 'mattn/emmet-vim'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ajh17/VimCompletesMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml', 'javascript', 'javascript.jsx']}
Plug 'tpope/vim-commentary'
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript.jsx'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['javascript', 'typescript'] }
call plug#end()

""" Syntax
syntax on		    " enable syntax highlighting
filetype plugin indent on

""" Leader key
let mapleader = ","

""" UI Config
set cursorline      " highlight current linee
set listchars=tab:▸\ ,eol:¬     " visualize tabs and newlines
set lazyredraw      " redraw only when we need to
set number		    " show line numbers
set showmatch       " highlight matching [{()}]
set visualbell      " show blink cursor
set wrap

""" Whitespace
set tabstop=4		" number of visual spaces per TAB
set shiftwidth=4    " on pressing tab, insert 2 spaces:
set softtabstop=4	" number of spaces in tab when editing
set expandtab		" tabs are spaces

""" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>     " use % to jump between pairs
runtime! macros/matchit.vim

""" Searching
set hlsearch        " highlight matches
set incsearch       " search as characters are entered
set ignorecase
set smartcase
set showmatch

""" Formatting
set textwidth=79
set formatoptions=tcqrn1


""" Folding
set foldmethod=manual   " fold based on indent level
set foldnestmax=10      " 10 nested fold max
set foldlevel=1
set nofoldenable

""" Misc
set encoding=utf-8
set hidden          " allow hidden buffers
set modelines=0     " disable modelines for security reasons
set mouse=a         " enable mouse selection
set ttyfast         " rendering
set viminfo='100,<9999,s100   " store info no more than 100 files at a time, 9999 lines of text, 100kb of data"

""" Key remap
nnoremap j gj
nnoremap k gk
nnoremap <Up>    <C-w>-
nnoremap <Down>  <C-w>+
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>

" verymagic search
nnoremap / /\v
vnoremap / /\v

" clear search
map <leader><space> :let @/=''<CR>

" toggle tab/EOL characters
map <leader>l :set list!<CR>

""" Filetype indentations
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType vue syntax sync fromstart
au BufNewFile,BufRead *.vue set ft=vue

""" Formatters
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css


""" Plugin configurations

" NERDTree
let g:NERDTreeWinSize=30
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

" colorColumn
set colorcolumn=120 " Set line length marker
hi ColorColumn ctermbg=LightGray
let &colorcolumn=join(range(121,999),",")

" indentline
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" vim-airline default theme
let g:airline_theme='solarized'

" resolve delimitmate and closetag conflict
let b:delimitMate_matchpairs = "(:),[:],{:}"
