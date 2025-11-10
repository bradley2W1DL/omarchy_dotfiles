-- auto-close (),[],{},'',""

return {
  "windwp/nvim-autopairs",
  config = function(_, opts)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

    require("nvim-autopairs").setup(opts)
  end,
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = {
    -- ts == treesitter
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
    },
    disable_filetype = { "TelescopePrompt", "NvimTree" },
    fast_wrap = {
      map = "<M-w>", -- Option-w while in insert mode
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_keys = "$",
      keys = "qwertyasdf",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  },
}
