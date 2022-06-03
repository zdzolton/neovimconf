local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end

-- Have packer use a popup window
packer.init {display = {open_fn = function() return require('packer.util').float {border = 'rounded'} end}}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
    use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
    use 'numToStr/Comment.nvim' -- Easily comment stuff
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'tpope/vim-surround' -- Delete/change/add parentheses/quotes/XML-tags/much more with ease
    use 'jeetsukumaran/vim-indentwise' -- Indent-based movement
    use 'jlanzarotta/bufexplorer' -- Easily switch between buffers

    -- Vimux and testing support
    use 'preservim/vimux' -- vim-tmux integration, for things like running tests
    use 'vim-test/vim-test'

    -- Colorschemes
    use 'lunarvim/colorschemes' -- A bunch of colorschemes you can try out
    use 'lunarvim/darkplus.nvim'
    use 'lifepillar/vim-solarized8'
    use 'NLKNguyen/papercolor-theme'
    use 'owickstrom/vim-colors-paramount'
    use 'preservim/vim-colors-pencil'
    use {'sonph/onehalf', rtp = 'vim/'}

    -- -- cmp plugins
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    -- use "hrsh7th/cmp-buffer" -- buffer completions
    -- use "hrsh7th/cmp-path" -- path completions
    -- use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp'

    -- snippets
    -- use "L3MON4D3/LuaSnip" --snippet engine
    -- use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require('packer').sync() end
end)
