return {
  mason_managed = true,
  root_dir = vim.lsp.config.util.root_pattern({ "package.json", "tsconfig.json" }),
  single_file_support = false
}
