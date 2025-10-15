return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope.builtin')
        local keymap = vim.keymap

        keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Find files' })
        keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Grep for text' })
        keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find buffers' })
        keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Find help tags' })
    end,
}
