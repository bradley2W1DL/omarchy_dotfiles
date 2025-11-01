local registry = require("bird.lsp.registry")

-- initialize mason / mason-lspconfig
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup()

-- Get Mason-managed servers from registry
local mason_servers = registry.get_mason_servers()

mason_lspconfig.setup {
  ensure_installed = mason_servers,
  automatic_enable = {
    exclude = { "lua_ls" }
  }
}

return mason_lspconfig

