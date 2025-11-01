-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end

local mason_lspconfig = require("bird.lsp.mason-lspconfig")
local registry = require("bird.lsp.registry")
local handlers = require("bird.lsp.handlers")

handlers.setup_diagnostics()

-- Get all servers (both Mason-managed and manual)
local all_servers = registry.get_all_servers()

-- Setup Mason-managed servers
local mason_servers = mason_lspconfig.get_installed_servers()
for _, server in ipairs(mason_servers) do
  if all_servers[server] then
    local server_settings = registry.get_server_config(server, handlers)
    if server_settings then
      vim.lsp.config(server, server_settings)
      vim.lsp.enable(server)
    end
  end
end

-- Setup manually managed servers
for server_name, config in pairs(all_servers) do
  if not config.mason_managed then
    local server_settings = registry.get_server_config(server_name, handlers)
    if server_settings then
      vim.lsp.config(server_name, server_settings)
      vim.lsp.enable(server_name)
    end
  end
end
