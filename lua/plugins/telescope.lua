return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup {
        defaults = {
          border = false,
          borderchars = {
            "─", "│", "─", "│",
            "╭", "╮", "╯", "╰",
          },
          winblend = 10,

          prompt_prefix = "   ",
          selection_caret = "❯ ",
          entry_prefix = "  ",

          layout_strategy = "horizontal",
          sorting_strategy = "ascending",

          layout_config = {
            prompt_position = "top",
            width = 0.8,
            height = 0.7,
            preview_width = 0.6,
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          },
        }
      }
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  }
}
