local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup {
    -- Refer to docs here: https://github.com/nvim-treesitter/nvim-treesitter#modules

    ensure_installed = { -- list of language parser names, or "all"
        'bash', 'c', 'cpp', 'css', 'dockerfile', 'go', 'html', 'java', 'javascript', 'json', 'lua', 'make', 'perl',
        'php', 'python', 'ruby', 'rust', 'toml', 'typescript', 'yaml',
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = {''}, -- List of parsers to ignore installing (for "all")
    autopairs = {enable = true},
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {''}, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {enable = true, disable = {'yaml', 'python'}},
    context_commentstring = {enable = true, enable_autocmd = false},
}
