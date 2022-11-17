-- each of these are documented in `:help nvim-tree.OPTION_NAME`

vim.cmd 'nnoremap <C-n> :NvimTreeToggle<CR>'
vim.cmd 'nnoremap <leader>r :NvimTreeRefresh<CR>'
vim.cmd 'nnoremap <leader>n :NvimTreeFindFile<CR>'
-- More available functions:
-- NvimTreeOpen
-- NvimTreeClose
-- NvimTreeFocus
-- NvimTreeFindFileToggle
-- NvimTreeResize
-- NvimTreeCollapse
-- NvimTreeCollapseKeepBuffers

vim.cmd [[set termguicolors]] -- this variable must be enabled for colors to be applied properly

-- a list of groups can be found at `:help nvim_tree_highlight`
vim.cmd [[highlight NvimTreeFolderIcon guibg=blue]]

-- END TEMPORARY HACK

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then return end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {'startify', 'dashboard', 'alpha'},
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {enable = true, icons = {hint = '', info = '', warning = '', error = ''}},
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    git = {enable = true, ignore = true, timeout = 500},
    view = {
        adaptive_size = true,
        hide_root_folder = false,
        side = 'left',
        mappings = {
            custom_only = false,
            list = {
                {key = {'l', '<CR>', 'o'}, cb = tree_cb 'edit'},
                {key = 'h', cb = tree_cb 'close_node'},
                {key = 'v', cb = tree_cb 'vsplit'},
                {key = 's', cb = tree_cb 'split'},
            },
        },
        number = false,
        relativenumber = false,
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = 'icon',
        root_folder_modifier = ':~', -- This is the default. See :help filename-modifiers for more options
        add_trailing = true, -- append a trailing slash to folder names
        group_empty = true, -- compact folders that only contain a single folder into one node in the file tree
        icons = {
            padding = " ", -- used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
            symlink_arrow = ' >> ', -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
            show = {
                -- WARN: This is some comments stolen from older configs, might not be all accurate anymore!
                --
                -- If false, do not show the icons for one of 'git' 'folder' and 'files'
                -- true by default, notice that if 'files' is true, it will only display
                -- if nvim-web-devicons is installed and on your runtimepath.
                -- if folder is true, you can also tell folder_arrows true to show
                -- arrows next to the folder icons. but this will not work when you set
                -- renderer.indent_markers.enable (because of UI conflict)
                file = false,
                folder = false,
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                -- default will show icon by default if no icon is provided
                -- default shows no icon by default
                default = '',
                symlink = '',
                git = {
                    unstaged = '',
                    staged = 'S',
                    unmerged = '',
                    renamed = '➜',
                    untracked = 'U',
                    deleted = '',
                    ignored = '◌',
                },
                folder = {
                    arrow_open = '',
                    arrow_closed = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
            }
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" }, -- List of filenames that gets highlighted with NvimTreeSpecialFile
    },
    respect_buf_cwd = true, -- will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
    create_in_closed_folder = true, -- When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when false, and inside the folder when true.
    trash = {cmd = 'trash', require_confirm = true},
}
