# set ENV vars to be used by nvim to set default color scheme

function go-light
  set -xg NVIM_BG light

  # do anything else to get iterm / zellij to be in light mode
  set-profile 'github_light'
end
