-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- disable unused vim builtins -- decreases startup time
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"logipat",
	"matchit",
	"matchparen",
	"rrhelper",
	"tar",
	"tarPlugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 0
end

-- setup conf and lua modules
require "bird.options" -- the lua directory is implied, as well as the .lua file extension
require "bird.keymaps"
require "bird.plugins"
require "bird.colorscheme"
require "bird.completion"
require "bird.lsp" -- .lsp is a dir, so lua will search for an init.lua file in that dir
require "bird.treesitter"
require "bird.nvim_tree"
require "bird.telescope"
require "bird.autopairs"
require "bird.bufferline" -- could replace with stabline (part of staline)
require "bird.staline"
require "bird.gitblame"
