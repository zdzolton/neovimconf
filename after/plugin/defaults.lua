-- Remap space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set up my desired color theme
vim.cmd [[
	colorscheme solarized8_high
	set background=light
]]

-- Key bindings
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Get rid of search highlights
keymap('n', '<leader>nh', '<cmd>nohlsearch<cr>', opts)

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts) -- TODO: Sort out conflict with LSP "Signature Documentation" bind
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-q>', '<cmd>q!<cr>', opts)

-- Vimux testing
keymap('n', '<leader>rb', '<cmd>wall <bar> TestFile<cr>', opts)
keymap('n', '<leader>rf', '<cmd>wall <bar> TestNearest<cr>', opts)
keymap('n', '<leader>rl', '<cmd>wall <bar> TestLast<cr>', opts)

local options = {
	backup = false,         -- creates a backup file
	clipboard = '',         -- DO NOT access system clipboard!!
	conceallevel = 0,       -- so that `` is visible in markdown files
	fileencoding = 'utf-8', -- the encoding written to a file
	hlsearch = true,        -- highlight all matches on previous search pattern
	ignorecase = true,      -- IGNORE case in search patterns
	mouse = '',             -- DISALLOW the mouse to be used in neovim
	showtabline = 2,        -- always show tabs
	smartcase = true,       -- smart case
	smartindent = true,     -- make indenting smarter again
	splitbelow = true,      -- force all horizontal splits to go below current window
	splitright = true,      -- force all vertical splits to go to the right of current window
	swapfile = false,       -- creates a swapfile
	writebackup = false,    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true,       -- convert tabs to spaces
	shiftwidth = 4,         -- the number of spaces inserted for each indentation
	tabstop = 4,            -- insert 4 spaces for a tab
	number = true,          -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4,        -- set number column width to 4
	signcolumn = 'yes',     -- always show the sign column, otherwise it would shift the text each time
	wrap = true,            -- wrap long lines
	colorcolumn = { '120' }, -- Show vertical ruler on column 120
	textwidth = 120,        -- Used for wrapping during text formatting
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do vim.opt[k] = v end

-- Default searches to use "very magic" mode
vim.cmd [[
      nnoremap / /\v
      vnoremap / /\v
]]

-- Recognize specific file names as having a certain language's syntax
vim.cmd [[
	autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy
]]

-- Don't show diagnostics inline
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)

-- Show diagnostics for line under the cursor
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Make diagnostics hints more readable with Solarized theme
vim.cmd 'hi DiagnosticHint guifg=Gray'

-- Let's use a different keybind for searching buffers than Kickstart
-- (Sometimes I hold down the spacebar for too long and trigger this by accident)
vim.keymap.del('n', '<leader><space>')
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- Use some fun characters when displaying invisibles
vim.opt.listchars = {
	eol = '↲',
	space = '⋅',
	trail = '•',
	tab = '⇄ ',
}
