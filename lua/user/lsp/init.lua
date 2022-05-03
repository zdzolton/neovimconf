local installer_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not installer_status_ok then
	return
end
lsp_installer.setup {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local lsps = {
    "jsonls", -- JSON
    "sumneko_lua", -- Lua
    "jedi_language_server", -- Python
    "intelephense", -- PHP
}

-- Using this list of desired language servers, set them up with capabilites
-- and, if we have a LSP-specific settings file then include that too
for _, name in ipairs(lsps)
do
    local lsp_settings_found, lsp_settings = pcall(require, "user.lsp.settings." .. name)
    local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
    }
    if lsp_settings_found then
	 	opts = vim.tbl_deep_extend("force", lsp_settings, opts)
    end
    lspconfig[name].setup(opts)
end

require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
