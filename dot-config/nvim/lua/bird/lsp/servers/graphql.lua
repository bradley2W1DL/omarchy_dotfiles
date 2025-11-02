return {
  mason_managed = false,  -- Example of manually managed LSP
  cmd = { "graphql-lsp", "server", "-m", "stream" },
  filetypes = { "graphql", "typescriptreact", "typescript" }
}