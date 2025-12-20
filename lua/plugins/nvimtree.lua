
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },

  uto_close = true,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    { "<leader>o", "<cmd>NvimTreeFocus<CR>", desc = "Focus file tree" },
  },
  config = function()
    -- recommended settings
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- =========================
      -- VIEW
      -- =========================
      view = {
        width = 32,
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
      },

      -- =========================
      -- BEHAVIOR
      -- =========================
      hijack_cursor = true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      reload_on_bufenter = true,

      -- =========================
      -- FILES & FILTERS
      -- =========================
      filters = {
        dotfiles = false,
        git_ignored = false,
      },

      -- =========================
      -- GIT
      -- =========================
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
      },

      -- =========================
      -- RENDERING
      -- =========================
      renderer = {
        root_folder_label = ":~:s?$?/..?",
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },

      -- =========================
      -- ACTIONS
      -- =========================
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
          },
        },
      },

      -- =========================
      -- DIAGNOSTICS
      -- =========================
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hfloat = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    })
  end,
}

