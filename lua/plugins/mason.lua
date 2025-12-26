return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- başlangıçta yükle
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "pyright",
          --"cmake-language-server",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },
}

