return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- NVChad tarzı
        auto_install = true,

        ensure_installed = {
          "c",
          "lua",
          "python",
          "vim",
          "regex",
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = { "vim", "regex" },
        },

        indent = {
          enable = true,
        },
      })
    end,
  },
}

