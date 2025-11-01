local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
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
