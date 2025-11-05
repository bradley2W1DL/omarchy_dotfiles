return {
  {"williamboman/mason.nvim"},
  {
    "williamboman/mason-lspconfig.nvim",
    config = function(_, opts)
      local registry = require("config.lsp.registry")
      local mason_servers = registry.get_mason_servers()

      opts.ensure_installed = mason_servers

      require("mason-lspconfig").setup(opts)
    end,
    opts = {
      automatic_enable = {
        exclude = { "lua_ls" }
      }
    }
  },
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "ripgrep", -- I think this package name is incorrect
  --     }
  --   }
  -- }
}
