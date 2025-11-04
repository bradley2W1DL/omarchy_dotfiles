return {
  {
    "akinsho/bufferline.nvim",
    tag = "v4.*", -- TODO is this tag necessary
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = {
      options = {
        numbers = "buffer_id", -- or "ordinal"
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = " NvimTree",
            text_align = "left",
            separator = true,
          },
        },
        show_buffer_icons = true,
        buffer_close_icon = "󰅖",
        always_show_bufferline = false,
      }
    }
  }
}
