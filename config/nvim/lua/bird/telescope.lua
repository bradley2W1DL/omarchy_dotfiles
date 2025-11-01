local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local lga_actions = require "telescope-live-grep-args.actions"

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<esc>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- Ctrl-q interferes with Zellij
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- Ctrl-q is dangerous...
        ["<M-a>"] = actions.send_to_qflist + actions.open_qflist, -- open all in quickfix
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["J"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["K"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.delete_buffer,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
  },
  extensions = {
    fzf = {
      -- these are all the default settings...so not a strictly necessary config
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      -- additional config: https://github.com/nvim-telescope/telescope-live-grep-args.nvim#configuration
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-f>"] = lga_actions.quote_prompt(), -- "quotes" current prompt
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }), -- file path
          ["<C-u>"] = lga_actions.quote_prompt({ postfix = " --type " }), -- filetype, e.g. --type ruby
          ["<C-r>"] = lga_actions.quote_prompt({ prefix = "--pcre2 -e " }), -- regex with lookahead / lookbehind
        }
      },
    },
  },
}

telescope.load_extension("fzf")
