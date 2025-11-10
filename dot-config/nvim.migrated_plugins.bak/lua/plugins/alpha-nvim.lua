-- TODO, I think this could be simplified to use a more default layout provided by alpha and only tweaking it.
--
local function alphaConfig(_, opts)
  -- init config to be called after package is installed
  local dashboard = require "alpha.themes.dashboard"
  math.randomseed(os.time()) -- what does this do?

  local logo2 = {
    [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
    [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
    [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
    [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  }

  dashboard.section.header.val = logo2
  dashboard.section.header.opts.hl = "AlphaHeader"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = "AlphaButton"
    b.opts.hl_shortcut = "AlphaButton"
    return b
  end

  dashboard.section.buttons.val = {
    button("<leader>e", "󰙅  File Explorer", ":NvimTreeToggle<cr>"),
    button("<leader>ff", "  Find Files", ":Telescope find_files<cr>"),
    button("<leader>fg", "  Live Grep", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
    button("<leader>fkm", "  Find Keymaps", "Telescope keymaps<cr>"),
    button("<leader>tt", "  Open Terminal", ":ToggleTerm<cr>"),
    button("q", "󰩈  Quit", ":qa<cr>")
  }

  local function footer()
    local total_plugins = require("lazy").stats().loaded

    return "Loaded " .. total_plugins .. " plugins 󰏗"
  end

  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "AlphaFooter"
  opts = opts or {}
  opts.layout = vim.tbl_deep_extend("force",
    opts.layout or {},
    {
      {type = "padding", val = 8},
      dashboard.section.header,
      {type = "padding", val = 3},
      {type = "padding", val = 2},
      dashboard.section.buttons,
      {type = "padding", val = 1},
      dashboard.section.footer,
    }
  )
  opts.opts = vim.tbl_deep_extend("force", opts.opts or {}, { margin = 5 })

  -- Call setup function
  require("alpha").setup(opts)

  -- define autocmds
  vim.cmd([[ autocmd FileType alpha setlocal nofoldenable]])
  vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = "alpha_tabline",
    pattern = "alpha",
    command = "set showtabline=0 laststatus=0 noruler",
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = "alpha_tabline",
    pattern = "alpha",
    callback = function()
      vim.api.nvim_create_autocmd("BufUnload", {
        group = "alpha_tabline",
        buffer = 0,
        command = "set showtabline=2 ruler laststatus=3",
      })
    end,
  })

  ---@author kikito -- function to open alpha page if all buffers are closed
  ---@see https://codereview.stackexchange.com/questions/268130/get-list-of-buffers-from-current-neovim-instance
  local function get_listed_buffers()
    local buffers = {}
    local len = 0
    for buffer = 1, vim.fn.bufnr('$') do
      if vim.fn.buflisted(buffer) == 1 then
        len = len + 1
        buffers[len] = buffer
      end
    end

    return buffers
  end

  vim.api.nvim_create_augroup('alpha_on_empty', { clear = true })
  vim.api.nvim_create_autocmd('User', {
    pattern = 'BDeletePre',
    group = 'alpha_on_empty',
    callback = function(event)
      local found_non_empty_buffer = false
      local buffers = get_listed_buffers()

      for _, bufnr in ipairs(buffers) do
        if not found_non_empty_buffer then
          local name = vim.api.nvim_buf_get_name(bufnr)
          local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

          if bufnr ~= event.buf and name ~= '' and ft ~= 'Alpha' then
            found_non_empty_buffer = true
          end
        end
      end

      if not found_non_empty_buffer then
        require 'neo-tree'.close_all()
        vim.cmd [[:Alpha]]
      end
    end,
  })
end

return {
  "goolord/alpha-nvim",
  config = alphaConfig,
  cmd = { "Alpha", "AlphaRedraw" },
  event="BufWinEnter",
}
