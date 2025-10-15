local opt = vim.opt -- for conciseness

-- Line numbers
opt.number = true         -- show line numbers
opt.relativenumber = true -- show relative line numbers
opt.cursorline = true     -- highlight the current line
opt.termguicolors = true  -- enable 24-bit RGB colors
opt.scrolloff = 8         -- keep 8 lines of context vertically
opt.sidescrolloff = 8     -- keep 8 columns of context horizontally
opt.signcolumn = 'yes'    -- always show the sign column, otherwise it would shift the text
opt.cmdheight = 1         -- more space in the command line for displaying messages
opt.pumheight = 10        -- pop-up menu height

-- Tabs & indentation
opt.expandtab = true   -- use spaces instead of tabs
opt.shiftwidth = 4     -- size of an indent
opt.tabstop = 4        -- number of spaces a <Tab> counts for
opt.softtabstop = 4    -- see multiple spaces as tabstops
opt.autoindent = true  -- copy indent from current line when starting new one
opt.smartindent = true -- be smarter about indentation

opt.wrap = false       -- disable line wrapping

-- Search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- override ignorecase if search pattern contains uppercase letters
opt.hlsearch = true   -- highlight all matches on search
opt.incsearch = true  -- show search results incrementally as you type

-- Appearance
opt.termguicolors = true -- enable 24-bit RGB colors
opt.cursorline = true    -- highlight the current line
vim.opt.guicursor = "n-v-c:block"

opt.swapfile = false  -- don't create a swapfile
opt.backup = false    -- don't create a backup file
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
