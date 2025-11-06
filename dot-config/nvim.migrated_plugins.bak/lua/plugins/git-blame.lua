return {
  "f-person/git-blame.nvim",
  opts = { enabled = false },
  init = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_message_template = " <author> • <date> • <sha>"
  end
}
