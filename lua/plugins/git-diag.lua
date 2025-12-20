return {
  --good for blame
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
      })
    end,
  },

  --command mode git handlers
  {
    "tpope/vim-fugitive",
  },

  --ui for diff
  {
    "sindrets/diffview.nvim",
  },
}
