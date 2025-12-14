return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "pyright",
        "lua_ls",
      },
    },
  },
}

