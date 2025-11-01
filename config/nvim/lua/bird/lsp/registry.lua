local M = {}

-- Load server configuration from individual files
local function load_server_config(server_name)
  local ok, config = pcall(require, "bird.lsp.servers." .. server_name)
  if not ok then
    return nil
  end
  return config
end

-- Get all available server configurations
function M.get_all_servers()
  local servers = {}
  local server_files = vim.fn.glob(vim.fn.stdpath('config') .. '/lua/bird/lsp/servers/*.lua', false, true)

  for _, file in ipairs(server_files) do
    local server_name = vim.fn.fnamemodify(file, ':t:r')
    local config = load_server_config(server_name)
    if config then
      servers[server_name] = config
    end
  end

  return servers
end

-- Get only Mason-managed servers for mason-lspconfig
function M.get_mason_servers()
  local all_servers = M.get_all_servers()
  local mason_servers = {}

  for name, config in pairs(all_servers) do
    if config.mason_managed then
      table.insert(mason_servers, name)
    end
  end

  return mason_servers
end

-- Get server configuration with defaults
function M.get_server_config(server_name, handlers)
  local config = load_server_config(server_name)
  if not config then
    return nil
  end

  local server_settings = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    flags = handlers.lsp_flags,
  }

  -- Apply server-specific configurations
  for key, value in pairs(config) do
    if key ~= "mason_managed" then
      if key == "capabilities" and type(value) == "function" then
        server_settings.capabilities = value(server_settings.capabilities)
      else
        server_settings[key] = value
      end
    end
  end

  return server_settings
end

return M
