local HOME = os.getenv("HOME")
local opt = vim.opt
local api = vim.api

vim.g.mapleader = " " -- leader key
vim.g.did_load_filetypes = 1 -- do not source the default filetype.vim

-- Basic settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
opt.completeopt = "menu,menuone,noselect" -- completion options: show popup menu when there are selections, and do not select a match in menu
opt.shell = "/usr/local/bin/zsh" -- zsh as default shell
opt.dictionary = "/usr/share/dict/words" -- file path to spell check dictionary
opt.startofline = true -- cursor is moved to first non-blank char when using some move commands
opt.hidden = true -- opening a new file when current buffer has unsaved changes causes current buffer file to be hidden instead of closed
opt.path = opt.path + "~,.,**" -- path searched when using various find commands (** means every file recursively in current directory)
opt.iskeyword = opt.iskeyword + "-" -- append "-" as keyword, which are recognized by many commands such as "w", "*", e.g. "a-b" is counted as 1 word instead of 3
opt.autoread = true -- automatically load file without prompt if file changes
opt.updatetime = 250 -- the amount of time in ms to trigger CursorHold event

-- Mapping waiting time
-- For more info: https://vi.stackexchange.com/questions/24925/usage-of-timeoutlen-and-ttimeoutlen
opt.timeout = true -- mapping sequence timeout
opt.ttimeout = true -- key code timeout
opt.timeoutlen = 750 -- the amount of time to wait after each keystroke
opt.ttimeoutlen = 5 -- the amount of time to wait for key code sequences

-- Display
opt.termguicolors = true -- emit true (24-bit) color
opt.showmatch = true -- show matching brackets
opt.lazyredraw = true -- buffer screen updates
opt.scrolloff = 3 -- always show 3 rows from edge of the screen
opt.sidescrolloff = 5 -- always show 5 columns from edge of the screen
opt.synmaxcol = 180 -- stop syntax highlight after x'th column for performance
opt.laststatus = 2 -- always show status line
opt.linebreak = true -- wrap line at character in 'breakat' option
opt.showbreak = "↳  " -- show wrap character
opt.listchars = {
    eol = "↲",
    tab = "▶ ",
    trail = "•",
    precedes = "«",
    extends = "»",
    nbsp = "␣",
    space = " "
}
opt.cursorline = true -- highlight cursor line
opt.virtualedit = "block" -- allow block selection in visual block mode past EOL

-- Side columns
opt.modelines = 0 -- disable for security reasons
opt.number = true -- enable line number
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
opt.autoindent = true -- copy indent from current line when starting new line
opt.smartindent = true -- smart autoindent when starting a new line
opt.expandtab = true -- use appropriate number of spaces to insert a <Tab>
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
opt.foldexpr = "nvim_treesitter#foldexpr()" -- use treesitter fold

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
