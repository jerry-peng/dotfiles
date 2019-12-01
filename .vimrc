" Jerry Peng's vimrc
" Credit:
" https://dougblack.io/words/a-good-vimrc.html
" https://gist.github.com/simonista/8703722#file-vimrc-L1

""" === Vanilla Vim Config ===

""" basic
set nocompatible                " set to not be vi-compatible
set encoding=utf-8
set ttyfast                     " rendering
set modelines=0                 " disable modelines for security reasons
set hidden                      " allow hidden buffers
set viminfo='100,<9999,s100   " store info no more than 100 files at a time, 9999 lines of text, 100kb of data"
set clipboard^="unamed,unnamedplus"

""" visual
syntax enable                       " enable syntax highlighting
set cursorline                  " highlight current line
set listchars=tab:▸\ ,eol:¬     " visualize tabs and newlines
set lazyredraw                  " redraw only when we need to
set number                      " show line numbers
set relativenumber              " show relative line numbers
set showmatch                   " highlight matching [{()}]
set wrap                        " enable text wrapping

""" tab/whitespace
set expandtab                   " tabs are spaces
set tabstop=2                   " number of visual spaces per TAB
set shiftwidth=2                " on pressing tab, insert 2 spaces:
set softtabstop=2               " number of spaces in tab when editing

""" cursor motion
set scrolloff=5                 " # of lines from top/bottom edges before window scrolls
set backspace=indent,eol,start  " behavior of backspace key in insert mode

""" search
set hlsearch                    " highlight matches
set incsearch                   " search as characters are entered
set ignorecase                  " ignore case, 'apple' can match 'AppLe'
set smartcase                   " if uppercase is present in search, `ignorecase` is disabled

""" undo tree
set undofile
set undodir=~/.vim/undo
set undolevels=10000

""" formatting
set formatoptions=cron

""" leader key
let mapleader = " "

""" misc
set updatetime=500
" set autoread | au CursorHold * checktime | call feedkeys("lh")
  " autoread file every updatetime, more info:
  " https://vi.stackexchange.com/questions/2702/how-can-i-make-vim-autoread-a-file-while-it-doesnt-have-focus


""" === FileType Config ===

filetype plugin indent on

""" Filetype indentations
au FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

""" Formatters
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
au FileType vue syntax sync fromstart


""" === Key Remap ===

""" Vanilla

" Map ctrl-e to esc
inoremap fj <Esc>
vnoremap fj <Esc>

" move linewise when texts are wrapped
nnoremap j gj
nnoremap k gk

" auto indent for brackets
inoremap {<CR> {<CR>}<Esc>O

" easier write and quit
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" Adjust windows
nnoremap <Up>    <C-w>-
nnoremap <Down>  <C-w>+
nnoremap <Left>  <C-w><
nnoremap <Right> <C-w>>

" zoom windows
nnoremap <leader>= <c-w><Bar><c-w>_<cr>
nnoremap <leader>- <c-w>=

" verymagic search
nnoremap / /\v
vnoremap / /\v
nnoremap ? /\V
vnoremap ? /\V

" clear search
map <leader>c :let @/=''<CR>

" toggle tab/EOL characters
map <leader>l :set list!<CR>

" copy and paste from outside buffer
nnoremap <leader>p :set paste<CR>"*p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"*p:set nopaste<CR>
" inoremap <leader>p <Esc>:set paste<CR>"*p<Esc>:set nopaste<CR>a

vnoremap <leader>y "+y

""" Plugin

" easy-align: align markdown tables
vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" tagbar
nmap <leader>t :TagbarOpenAutoClose<CR>

" unimpaired: copy and paste from outside buffer
nmap <leader>=p "*=p


""" === Plugin Config ===
" ALE
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
  \ 'c': ['clang'],
  \ 'cpp': ['clang'],
  \ 'css': ['stylelint'],
  \ 'html': ['stylelint'],
  \ 'java': ['javac'],
  \ 'javascript': ['eslint'],
  \ 'python': ['pylint'],
\ }

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'c': ['clang-format'],
  \ 'cpp': ['clang-format'],
  \ 'html': ['prettier'],
  \ 'java': ['google_java_format'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'json': ['prettier'],
  \ 'python': ['black'],
  \ 'xml': ['xmllint'],
  \ 'yaml': ['prettier'],
\ }
  " \ 'markdown': ['prettier'],

nmap <leader>ad :ALEDetail<CR>
nmap <leader>af :ALEFix<CR>
nmap <leader>afs :ALEFixSuggest<CR>
nmap <leader>ai :ALEInfo<CR>
nmap <leader>al :ALELint<CR>
nmap <leader>ao :help ale-integration-options


" Fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = 'right:60%'
" let g:fzf_files_options = '--preview "bat" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nmap <leader>ff :FzfFiles<CR>
nmap <leader>fg :FzfGFiles<CR>
nmap <leader>fg? :FzfGFiles?<CR>
nmap <leader>fb :FzfBuffers<CR>
nmap <leader>fr :FzfRg<CR>
nmap <leader>fl :FzfLines<CR>
nmap <leader>fbl :FzfBLines<CR>
nmap <leader>ft :FzfTags<CR>
nmap <leader>fbt :FzfBTags<CR>
nmap <leader>fh :FzfHistory<CR>
nmap <leader>fc: :FzfCommits:<CR>
nmap <leader>fbc :FzfBCommits<CR>
nmap <leader>fcmd: :FzfCommands<CR>
nmap <leader>fm: :FzfMaps<CR>
nmap <leader>fhlp: :FzfHelptags<CR>HistoryCR


" NERDTree
let g:NERDTreeWinSize=30
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" colorColumn
" set colorcolumn=120 " Set line length marker
" hi ColorColumn ctermbg=LightGray
" let &colorcolumn=join(range(121,999),",")

" indentline
let g:indentLine_char = '▏'

" vim-airline default theme
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

" resolve delimitmate and closetag conflict
let b:delimitMate_matchpairs = "(:),[:],{:}"

" disable polyglot markdown
let g:polyglot_disabled = ['markdown']

" use default mapping for camelCaseMotion
let g:camelcasemotion_key = '<leader>'

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


""" === Plugin Installation ===

call plug#begin()

" basic
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'

" UI
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'

" syntax/auto-completion
Plug 'sheerun/vim-polyglot'
" Plug 'dense-analysis/ale'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'majutsushi/tagbar'

" motion
Plug 'vim-scripts/argtextobj.vim'
" file tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" surrounding
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag', { 'for': ['html', 'xml', 'javascript', 'javascriptreact']}
Plug 'raimondi/delimitmate'

" comment
Plug 'tpope/vim-commentary'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" misc
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Solarized light
" set background=light
" colorscheme solarized
