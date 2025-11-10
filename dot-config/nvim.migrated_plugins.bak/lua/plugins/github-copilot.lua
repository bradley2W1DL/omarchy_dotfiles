-- Github Copilot 🤖 -- not using the official copilot.vim plugin
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    -- disabling these to prevent interference with copilot_cmp
    suggestion = { enabled = false },
    panel = { enabled = false },
    -- must be version > 22.0 of node
    copilot_node_command = vim.fn.expand("$HOME").."/.local/share/mise/installs/node/23.11.0/bin/node"
  },
  dependencies = { "zbirenbaum/copilot-cmp" },
}
