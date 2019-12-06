""" Syntax
syntax on		" enable syntax processing
filetype indent plugin on " enable auto indent

""" Mouse
set mouse=a

""" Spaces & Tabs
set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set expandtab		" tabs are spaces
set shiftwidth=4    " on pressing tab, insert 2 spaces:

""" Backspace
set backspace=indent,eol,start

""" UI Config
set number		    " show line numbers
set showcmd		    " show command in bottom bar
set cursorline      " highlight current linee
filetype indent on  " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
set colorcolumn=120  " Set line length marker

""" Searching
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

""" Folding
set foldmethod=manual   " fold based on indent level
set foldnestmax=10      " 10 nested fold max
set foldlevel=1
set nofoldenable

""" Key remap
nnoremap j gj
nnoremap k gk

""" Alter Behaviors from filetype
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType vue syntax sync fromstart
autocmd BufNewFile,BufRead *.vue set ft=vue

"""" NERDTree
let g:NERDTreeWinSize=30
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <silent> <C-k> :NERDTreeFocus<CR>

""" ColorColumn
hi ColorColumn ctermbg=LightGray
let &colorcolumn=join(range(121,999),",")

""" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

""" vim-airline default theme
let g:airline_theme='solarized'

""" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Sensible Vim Conf
Plugin 'tpope/vim-sensible'

" Style
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

" Utilities
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'alvan/vim-closetag'
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-fugitive'

" Syntax highlightings
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'posva/vim-vue'
"Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()
filetype plugin indent on
