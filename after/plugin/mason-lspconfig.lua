-- Available language servers: https://github.com/williamboman/nvim-lsp-installer#available-lsps
local desired_language_servers = {
    'bashls', -- Bash
    'intelephense', -- PHP
    'jdtls', -- Java
    'jsonls', -- JSON
    'pyright', -- Python
    'sumneko_lua', -- Lua
    'tsserver', -- TypeScript and JavaScript
    'yamlls', -- YAML
}

require('mason-lspconfig').setup {
    ensure_installed = desired_language_servers,
}
