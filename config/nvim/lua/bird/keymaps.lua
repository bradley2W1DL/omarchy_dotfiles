local opts = { noremap = true, silent = true }
-- local cmd_opts = { cnoremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
--  the default vim <leader> key is backslash "\"
--  this remaps that to be space character
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --
------------ 
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- open up Nvim-Tree (file explorer)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

keymap('n', '<space>d', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<space>q', vim.diagnostic.setloclist, opts)

-- quickly clear search highlighting
keymap("n", "<leader>n", ":noh<cr>", opts)

-- prevent x,X,<Delete> from yanking to clipboard register
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)
keymap("n", "<Del>", '"_x', opts)

-- Resize windows with +/- keys
keymap("n", "_", ":resize -2<cr>", opts)
keymap("n", "+", ":resize +2<cr>", opts)
keymap("n", "<C-_>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-=>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
--  move forward and backwards between buffers with "shift-l" and "shift-h"
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Telescope keymaps
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- replacing above with live_grep_args extension
keymap("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fs", ":Telescope spell_suggest<CR>", opts)
keymap("n", "<leader>fkm", ":Telescope keymaps<CR>", opts)

-- Git Blame keymaps
keymap("n", "<leader>gb", ":GitBlameToggle<CR>", opts)
keymap("n", "<leader>gy", ":GitBlameCopySHA<cr>", opts)

-- -- ToggleTerm keymaps -- (removed the ToggleTerm plugin for now)
-- keymap("n", "<leader>tt", ":ToggleTerm<CR>", opts)
-- --  *these apply when in the terminal window
-- function _G.set_terminal_keymaps()
--   local term_opt = { buffer = 0 }
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], term_opt)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], term_opt)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], term_opt)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], term_opt)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], term_opt)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], term_opt)
-- end
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Insert --
------------ 
-- enable "fast-exit" of insert mode with "jk" combo 
-- be forwarned, you will start typing "jk" at the end of all your sentences in ALL text editors
keymap("i", "jk", "<ESC>", opts)

-- Visual --
------------
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down
keymap("v", "<A-k>", ":m .-2<cr>==", opts)
keymap("v", "∆", ":m .+1<CR>==", opts)
-- retains yanked line in register when pasting over selected text
keymap("v", "p", '"_dP', opts)


-- Visual Block --
------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- todo, "alt" key remapping not really working
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- todo, "alt" key remapping not really working

-- Terminal --
--------------
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

