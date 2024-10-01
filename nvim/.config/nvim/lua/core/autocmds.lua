-- auto-reload file
vim.api.nvim_create_autocmd({ "FocusGained" }, {
    group = vim.api.nvim_create_augroup("custom_checktime", { clear = true }),
    command = "checktime",
})

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "fugitive://*",
    command = "set bufhidden=delete",
})

vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
    callback = function()
        -- force enable auto-completion when exiting insert/command mode
        vim.g.cmp_enabled = true
    end,
})

-- link navigation in help
vim.api.nvim_create_autocmd("FileType", {
    pattern = "help",
    callback = function(ev)
        vim.keymap.set("n", require("core.key-passthru").help.enter, "<C-]>", { silent = true, buffer = ev.buf })
        vim.keymap.set("n", require("core.key-passthru").help.back, "<C-T>", { silent = true, buffer = ev.buf })
    end,
})
