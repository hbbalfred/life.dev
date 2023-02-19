vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Disable yank with x
vim.keymap.set('n', 'x', '"_x')

-- Increment / Decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Quick leaving insert
vim.keymap.set('i', 'jk', '<ESC>')

-- Quick disable highlight
vim.keymap.set('n', '<leader>nh', ':nohl<CR>')

-- Split window
vim.keymap.set('n', 'ss', ':sp<CR>', { silent = true })
vim.keymap.set('n', 'sv', ':vsp<CR>', { silent = true })
vim.keymap.set('n', 'sq', ':close<CR>', { silent = true })
-- Move window
vim.keymap.set('n', 'sn', '<C-w>w')
vim.keymap.set('n', 'sb', '<C-w><S-w>')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 's<Left>', '<C-w>h')
vim.keymap.set('n', 's<Down>', '<C-w>j')
vim.keymap.set('n', 's<Up>', '<C-w>k')
vim.keymap.set('n', 's<Right>', '<C-w>l')
-- Resize window
vim.keymap.set('n', 'se', '<C-w>=')
vim.keymap.set('n', 'so', '<C-w>_')

-- Tabs
vim.keymap.set('n', 'tt', ':tabedit<CR>', { silent = true })
vim.keymap.set('n', 'tq', ':tabclose<CR>', { silent = true })
vim.keymap.set('n', 'tn', ':tabn<CR>', { silent = true })
vim.keymap.set('n', 'tb', ':tabp<CR>', { silent = true })

-- PLUGIN KEYMAPS --

-- nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true})

-- telescope
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<leader>sf', '<cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<leader>sg', '<cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>ss', '<cmd>Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>sh', '<cmd>Telescope help_tags<CR>')
vim.keymap.set('n', '<leader>sd', '<cmd>Telescope diagnostics<CR>')

