local opts = {noremap = true, silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-q>', '<cmd>q!<cr>', opts)

-- Nvimtree
keymap('n', '<leader>e', ':NvimTreeToggle<cr>', opts)

-- Telescope
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<C-g>', '<cmd>Telescope live_grep<cr>', opts)

-- Vimux testing
keymap('n', '<leader>rb', '<cmd>wall <bar> TestFile<cr>', opts)
keymap('n', '<leader>rf', '<cmd>wall <bar> TestNearest<cr>', opts)
keymap('n', '<leader>rl', '<cmd>wall <bar> TestLast<cr>', opts)

-- Misc
keymap('n', '<leader>nh', '<cmd>nohlsearch<cr>', opts)
keymap('n', '<leader>t', '<cmd>Format<cr>', opts)
keymap('n', '<leader>be', '<cmd>BufExplorer<cr>', opts)
