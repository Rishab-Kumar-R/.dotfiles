return {
    'stevearc/conform.nvim',
    config = function()
        local conform = require('conform')

        conform.setup({
            formatters_by_ft = {
                lua        = { 'stylua' },
                javascript = { 'prettierd' },
                typescript = { 'prettierd' },
                rust       = { 'rustfmt' },
                java       = { 'google_java_format' },
                go         = { 'gofmt', 'goimports' },
                python     = { 'black', 'isort' },
                sh         = { 'shfmt' },
                html       = { 'prettierd' },
                css        = { 'prettierd' },
                json       = { 'prettierd' },
                yaml       = { 'prettierd' },
                toml       = { 'taplo' },
                xml        = { 'xmlformatter' },
            },

            -- Set up format-on-save
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        -- Add a keymap for manual formatting
        vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
            conform.format({ async = true, lsp_fallback = true })
        end, { desc = 'Format buffer' })
    end,
}
