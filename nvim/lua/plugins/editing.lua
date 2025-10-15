return {
    -- Autopairs
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({})
        end,
    },

    -- Commenting
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    },
}
