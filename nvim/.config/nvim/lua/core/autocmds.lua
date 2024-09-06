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

-- attack autocompletion for dap REPL
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])

-- Fugitive TODO
--autocmd BufReadPost fugitive://* set bufhidden=delete

vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
    callback = function()
        -- force enable auto-completion when exiting insert/command mode
        vim.g.cmp_enabled = true
    end,
})
