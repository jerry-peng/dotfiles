-- auto-reload file
vim.cmd([[
    au! FocusGained * checktime
]])

-- only show cursorline in the current window and in normal mode
vim.cmd([[
    augroup cline
        au!
        au WinLeave * set nocursorline
        au WinEnter * set cursorline
        au InsertEnter * set nocursorline
        au InsertLeave * set cursorline
    augroup END
]])

-- highlight on yank
vim.cmd([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=250})
    augroup end
]])

-- override filetype formatoptions
vim.cmd([[au BufWinEnter * set formatoptions=cqnj]])

-- attack autocompletion for dap REPL
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
