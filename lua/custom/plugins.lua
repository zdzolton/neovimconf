return function(use)
	-- Solarized theme for my eyeballs
	use"lifepillar/vim-solarized8"

	-- Also, let's try this one
	use 'Mofiqul/vscode.nvim'

	-- For running tests from Neovim in tmux splits
	use'preservim/vimux'
	use'vim-test/vim-test'

	-- Delete/change/add parentheses/quotes/XML-tags/much more with ease
	use 'tpope/vim-surround'

	-- Easily switch between buffers
	use 'jlanzarotta/bufexplorer'

	-- File browser with nice icons
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
end
