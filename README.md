# neovimconf

My configuration for Neovim, designed to work on top of [Kickstart](https://github.com/nvim-lua/kickstart.nvim).

## NOTE on Kickstart

They recently made some changes that broke compatibility with my repo, including
[swapping out Packer for lazy.nvim](https://github.com/nvim-lua/kickstart.nvim/commit/3526fbeec9299dad5f7b14894765c34c83cf8324).

Until I get this sorted out, this repo will require a specific commit:

```shell 
git clone https://github.com/nvim-lua/kickstart.nvim.git
git checkout 32744c3
```

## How to Get Started

1. Clone https://github.com/nvim-lua/kickstart.nvim somewhere. **SEE NOTE ABOVE**
2. Clone this repo somewhere else
3. Link this repo into place: `ln -s ~/somewhere/else/neovimconf ~/.conf/nvim`
4. Link Kickstart into place: `ln -s ~/somewhere/kickstart.nvim/init.lua ~/.conf/nvim/init.lua`
5. Clear out any Neovim cache: `rm -rf ~/.local/share/nvim/`
6. Start Neovim: `nvim`
7. Install plugins (prepare yourself to ignore errors): `:PackerInstall`
8. Close and reopen Neovim
9. Enjoy!

## Hmm... What?

Read more at the Kickstart link at the top of this document.
