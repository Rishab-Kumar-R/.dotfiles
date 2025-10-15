-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    group = highlight_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
    desc = 'Highlight yanked text',
})

-- Go to last location when opening a file
local remember_cursor_group = vim.api.nvim_create_augroup('RememberCursor', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
    group = remember_cursor_group,
    pattern = '*',
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line('$') then
            vim.cmd('normal! g`"')
        end
    end,
    desc = 'Jump to last cursor position',
})

-- Center the screen on the cursor when entering a buffer
local center_cursor_group = vim.api.nvim_create_augroup('CenterCursor', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = center_cursor_group,
    pattern = '*',
    command = 'normal! zz',
    desc = 'Center screen on cursor',
})
