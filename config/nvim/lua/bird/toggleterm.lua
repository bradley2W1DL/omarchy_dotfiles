local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  persist_mode = false, -- previous terminal mode will be remembered
  close_on_exit = true, -- close terminal window when process exits
  hide_numbers = true,
  direction = 'float',
  shading_factor = 2,
  float_opts = {
    border = 'curved',
    winblend = 0, -- blur background through to term window
    width = 200,
  }
}
