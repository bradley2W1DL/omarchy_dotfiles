local status_ok, gitblame = pcall(require, "gitblame")
if not status_ok then
  return
end

-- default behavior is for gitblame to be on by default
gitblame.setup {
  enabled = false
}
