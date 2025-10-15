return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'rose-pine',
                icons_enabled = false, -- Explicitly disable icons
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
            },
        })
    end,
}
