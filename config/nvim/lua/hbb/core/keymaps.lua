vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Move block in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor position
vim.keymap.set("n", "J", "mzJ`z") -- Fixed cursor when pressed 'J'
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Replace in fast
vim.keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Disable yank with x
vim.keymap.set("n", "x", '"_x')

-- Increment / Decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Quick leaving insert
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "<C-c>", "<ESC>")

-- Quick disable highlight
vim.keymap.set("n", ",", ":nohl<CR>")

-- Split window
vim.keymap.set("n", "<leader>ss", ":sp<CR>", { silent = true })
vim.keymap.set("n", "<leader>sv", ":vsp<CR>", { silent = true })
vim.keymap.set("n", "<leader>sq", ":close<CR>", { silent = true })
-- Move window
--vim.keymap.set('n', '<leader>s-', '<C-w>=')
--vim.keymap.set('n', '<leader>so', '<C-w>_<C-w>|')
vim.keymap.set("n", "<leader>so", ":TZFocus<CR>")
vim.keymap.set("n", "<leader>s0", "<C-w>o")

-- Tabs
vim.keymap.set("n", "<leader>tb", ":tabedit<CR>", { silent = true })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>th", ":tabn<CR>", { silent = true })
vim.keymap.set("n", "<leader>tl", ":tabp<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<leader><space>", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>gg", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>ga", ":Telescope find_files hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "<leader>gs", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>gS", ":Telescope grep_string<CR>")
-- vim.keymap.set('n', '<leader>f1', ':Telescope help_tags<CR>')
