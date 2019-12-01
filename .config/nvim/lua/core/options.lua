local HOME = os.getenv("HOME")
local opt = vim.opt
local api = vim.api

vim.g.mapleader = " " -- leader key
vim.g.did_load_filetypes = 1 -- Do not source the default filetype.vim

-- Basic settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
opt.completeopt = "menu,menuone,noselect"
opt.shell = "/usr/local/bin/zsh"
opt.dictionary = "/usr/share/dict/words"
opt.startofline = true -- cursor is moved to first non-blank char when using some move commands
opt.hidden = true -- hidden buffer
opt.path = opt.path + "~,.,**" -- path searched when using various find commands
opt.iskeyword = opt.iskeyword + "-"
opt.autoread = true -- automatically load file without prompt if file changes
opt.updatetime = 250

-- Mapping waiting time
opt.timeout = true -- mapping sequence timeout
opt.ttimeout = true -- key code timeout
opt.timeoutlen = 750
opt.ttimeoutlen = 5

-- Display
opt.termguicolors = true -- emit true (24-bit) color
opt.showmatch = true -- show matching brackets
opt.lazyredraw = true --
opt.scrolloff = 3 -- always show 3 rows from edge of the screen
opt.sidescrolloff = 5 -- always show 5 columns from edge of the screen
opt.synmaxcol = 300 -- stop syntax highlight after x'th column for performance
opt.laststatus = 2 -- always show status line
opt.linebreak = true -- wrap line at character in 'breakat'
opt.showbreak = "↳  " -- show wrap character
opt.listchars = { eol = "↲", tab = "▶ ", trail = "•", precedes = "«", extends = "»", nbsp = "␣", space = " " }
opt.cursorline = true

-- Side columns
opt.modelines = 0 -- disable for security reasons
opt.number = true -- line number on the left
opt.relativenumber = true -- enable relative number

-- Search
opt.incsearch = true -- starts searching as soon as typing
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- case insentive unless capitals used in search
opt.wildignorecase = true -- ignore case when completing file names and dirs
opt.inccommand = "nosplit" -- start substitution as soon as typing

-- Match pair
opt.matchtime = 2 -- delay before showing matching paren (tenth of a second)
opt.mps = opt.mps + "<:>" -- Add <> match pair

-- Indentations
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.formatoptions = opt.formatoptions
    - "a" -- disable auto formatting
    - "t" -- disable auto-wrap
    + "c" -- enable auto-wrap comments
    + "q" -- enable formatting comments w/ gq
    - "o" -- disable auto-insert comment leader after hitting 'o' or 'O' in normal mode
    + "r" -- enable auto-insert comment leader when pressing enter in insert mode.
    + "n" -- recognize numbered lists using 'formatlistpat' option
    + "j" -- remove comment leader when joining lines
    - "2" -- disable indent first line in paragraph

-- Shada file
opt.shada = "'200,<10000,s100,/10000,:1000,n~/.config/nvim/.shada"

-- Backup files
opt.backup = true -- use backup files
opt.writebackup = false -- do not delete backup file after write succeeds
opt.swapfile = false -- do not use swap file
opt.backupdir = HOME .. "/.config/nvim/.backup//"

-- Undo files
opt.undofile = true -- enable storing undo
opt.undodir = HOME .. "/.config/nvim/.undo//"
opt.undolevels = 1000

-- Wildmenu
opt.wildignore = { ".git", ".hg", ".svn", "*.pyc", "*.o", "*.out", "*.jpg", "*.jpeg", "*.png", "*.gif", "*.zip" }
opt.wildignore = opt.wildignore + { "**/node_modules/**", "**/bower_modules/**", "__pycache__", "*~", "*.DS_Store" }
opt.wildmode = { "full", "list", "full" }

-- Window
opt.splitbelow = true -- split window below
opt.splitright = true -- split window right

-- Fold
opt.foldlevel = 99 -- prevent folding when opening files
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Disable builtin plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
