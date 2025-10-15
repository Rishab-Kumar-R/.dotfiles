return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', opts = {} },

        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local cmp = require('cmp')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- The on_attach function is called whenever an LSP attaches to a buffer
        local on_attach = function(client, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define local variables and functions with behavior that depends on the variables
            -- defined in the surrounding scope.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end
                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
            nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

            nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
            nmap('gr', require('telescope.builtin').lsp_references, 'Go to References')
            nmap('gI', vim.lsp.buf.implementation, 'Go to Implementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

            -- See `:help K` for why this keymap is so strange
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, 'Go to Declaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, 'List Workspace Folders')
        end

        -- vim.diagnostic.config({
        --     virtual_text = true, -- show error messages as virtual text
        --     signs = true,
        --     underline = true,
        --     update_in_insert = false,
        --     severity_sort = true,
        -- })

        -- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        -- for type, icon in pairs(signs) do
        --     local hl = "DiagnosticSign" .. type
        --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        -- end


        vim.diagnostic.config({
            virtual_text = true,
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN]  = " ",
                    [vim.diagnostic.severity.HINT]  = " ",
                    [vim.diagnostic.severity.INFO]  = " ",
                },
                -- optionally, you can set numhl or linehl if you want highlighting
                -- numhl = { [vim.diagnostic.severity.WARN] = "DiagnosticSignWarnNumhl", ... },
                -- linehl = { [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine", ... },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })



        local keymap = vim.keymap
        keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
        keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
        keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic in float' })

        -- Setup mason so it can manage external tooling
        require('mason').setup()
        require('mason-lspconfig').setup({
            -- A list of servers to automatically install if they're not already installed
            ensure_installed = { 'lua_ls', 'ts_ls', 'pyright' },
            handlers = {
                function(server_name) -- default handler (for servers that don't have special options)
                    require('lspconfig')[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                    })
                end,
            },
        })

        -- Configure nvim-cmp
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
        })
    end,
}
