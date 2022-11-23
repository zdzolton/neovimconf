local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup {
    -- Refer to docs here: https://github.com/nvim-treesitter/nvim-treesitter#modules

    ensure_installed = { -- list of language parser names, or "all"
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'make',
        'perl',
        'php',
        'python',
        'ruby',
        'rust',
        'toml',
        'typescript',
        'yaml',
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { '' }, -- List of parsers to ignore installing (for "all")
    autopairs = { enable = true },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { '' }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { 'yaml', 'python' } },
    context_commentstring = { enable = true, enable_autocmd = false },

    -- Stolen from: https://github.com/nvim-lua/kickstart.nvim/blob/e80aa6667166334119d567567e7d1e1eed3ae2fb/init.lua#L244
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>A'] = '@parameter.inner',
            },
        },
    },

}
