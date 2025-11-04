-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- disable unused vim builtins -- decreases startup time
-- THIS MOVED to lazy.nvim conifg
-- local disabled_built_ins = {
-- 	"2html_plugin",
-- 	"getscript",
-- 	"getscriptPlugin",
-- 	"logipat",
-- 	"matchit",
-- 	"matchparen",
-- 	"rrhelper",
-- 	"tar",
-- 	"tarPlugin",
-- 	"vimball",
-- 	"vimballPlugin",
-- 	"zip",
-- 	"zipPlugin",
-- }

-- for _, plugin in pairs(disabled_built_ins) do
--   vim.g["loaded_" .. plugin] = 0
-- end

-- setup conf and lua modules
require "config.lazy" -- replacement for plugins
require "config.options" -- the lua directory is implied, as well as the .lua file extension
require "config.keymaps"
require "config.lsp" -- .lsp is a dir, so lua will search for an init.lua file in that dir

-- require "bird.plugins"
-- require "bird.colorscheme" -- todo get the dynamic colorscheme thing working
-- presumably these configs will all move into the correct "plugin" file
-- require "config.completion"
-- require "config.treesitter"
-- require "config.nvim_tree"
-- require "config.telescope"
-- require "config.autopairs"
-- require "config.bufferline" -- could replace with stabline (part of staline)
-- require "config.staline"
-- require "config.gitblame"
