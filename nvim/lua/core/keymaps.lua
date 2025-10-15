local keymap = vim.keymap -- for conciseness

-- Clear search highlighting
keymap.set('n', '<leader><space>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlighting' })

-- Save file
-- keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Quit
-- keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })

-- Split window vertically
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })

-- Split window horizontally
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })

-- Switch between windows
keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower window' })
keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper window' })
keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- netrw explorer
-- keymap.set('n', '<leader>e', '<cmd>Vexplore<CR>', { desc = 'Open file explorer' })

-- Move selected lines up and down in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- When pasting, don't overwrite the yank buffer
-- This allows you to paste the same thing multiple times
keymap.set('x', '<leader>p', '"_dP', { desc = 'Paste without losing yank' })

-- Yank to system clipboard
keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank line to system clipboard' })

-- Disable arrow keys in normal mode to encourage using h,j,k,l
keymap.set('n', '<up>', '<nop>', { noremap = true })
keymap.set('n', '<down>', '<nop>', { noremap = true })
keymap.set('n', '<left>', '<nop>', { noremap = true })
keymap.set('n', '<right>', '<nop>', { noremap = true })
