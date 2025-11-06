return {
  mason_managed = false,
  init_options = {
    formatter = 'standardrb',
    linters = { 'standardrb' },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      }
    }
  }
}
