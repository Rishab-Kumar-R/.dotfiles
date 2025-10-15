return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Disable netrw completely
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require('nvim-tree').setup({
            -- keeps tree in sync
            update_focused_file = {
                enable = true,
            },

            filters = {
                git_ignored = false,
            },
            git = {
                ignore = false,
            },

            renderer = {
                icons = {
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                    },
                },
            },
            -- Keep the UI clean
            view = {
                width = 30,
                side = 'left',
            },
        })

        -- Set the keymap to toggle the file explorer
        local keymap = vim.keymap
        keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    end,
}
