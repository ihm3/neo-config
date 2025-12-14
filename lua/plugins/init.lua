require("lazy").setup({
  spec = {
    -- Şimdilik BOŞ
    { import = "plugins.treesitter" },
    { import = "plugins.mason" },
    { import = "plugins.lsp" },
  },
  defaults = {
    lazy = true,
  },
  install = {
    colorscheme = { "habamax" },
  },
  checker = {
    enabled = false,
  },
})

