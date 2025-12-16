return {
 {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- C / C++
      vim.lsp.config("clangd", {
        cmd = {"clangd"},
        filetypes = { "c", "cpp", "objc", "objcpp" },
      })

      -- Python
      vim.lsp.config("pyright", {
        filetypes = { "python" },
      })

      -- Lua
      vim.lsp.config("lua_ls",{
        cmd = {"clangd"},
        filetypes = { "lua" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.enable({
        "clangd",
        "pyright",
        "lua_ls",
      })
    end,
  },
}

