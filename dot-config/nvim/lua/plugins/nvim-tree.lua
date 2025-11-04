return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    respect_buf_cwd = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
      ignore_list = {},
    },
    view = {
      adaptive_size = true, -- resize tree window to fix filename
    },
    git = {
      enable = true,
      ignore = false,
    },
    renderer = {
      icons = {
        show = {
          git = false,
        },
        glyphs = {
          git = {
            staged = "",
            unstaged = "",
            deleted = "",
          }
        },
      }
    }
  },
  init = function()
    -- disable devault nvim netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Ensure nvim_tree is closed before quiting nvim
    local closeTreeGrp = vim.api.nvim_create_augroup("close_tree_before_quit", { clear = true })
    vim.api.nvim_create_autocmd("QuitPre", {
      command = "NvimTreeClose",
      group = closeTreeGrp,
    })
  end,
  dependencies = {
    {
      "nvim-tree/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").set_icon{
          rb = {
            icon = "",
            color = "#e06e6e",
            name = "Rb",
          },
          rake = {
            icon = "",
            color = "#e06e6e",
            name = "Rake",
          },
          rakefile = {
            icon = "",
            color = "#e06e6e",
            name = "Rakefile",
          },
          Brewfile = {
            icon = "",
            color = "#e06e6e",
            name = "Brewfile",
          },
          ["config.ru"] = {
            icon = "",
            color = "#e06e6e",
            name = "ConfigRu",
          },
          ["Gemfile$"] = {
            icon = "",
            color = "#e06e6e",
            name = "Gemfile",
          },
          erb = {
            icon = "",
            color = "#e06e6e",
            name = "Erb",
          },
          gemspec = {
            icon = "",
            color = "#e06e6e",
            name = "Gemspec",
          },
          Dockerfile = {
            icon = "󰡨",
            color = "#0db7ed",
            name = "Dockerfile",
          },
        }
      end,
    }, -- Fetch file type icons
  }
}
