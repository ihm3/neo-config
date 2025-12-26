return {
  {
   "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      ------------------------------------------------------------------
      -- LSP attach olunca keymap'ler
      ------------------------------------------------------------------
      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

       ---@diagnostic disable-next-line: deprecated
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        --vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
      end

      ------------------------------------------------------------------
      -- Diagnostic ayarları
      ------------------------------------------------------------------
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      ------------------------------------------------------------------
      -- Mason: kurulu olsun
      ------------------------------------------------------------------
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "clangd",
          "lua_ls",
          "cmake-language-server",
        },
      })

      ------------------------------------------------------------------
      -- YENİ NEOVIM 0.11 LSP API
      ------------------------------------------------------------------

      -- Python
      vim.lsp.config("pyright", {
        on_attach = on_attach,
      })

      -- C / C++
      vim.lsp.config("clangd", {
        on_attach = on_attach,
      })

       vim.lsp.config("cmake-language-server", {
        on_attach = on_attach,
      })

      -- Lua
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
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

      ------------------------------------------------------------------
      -- AKTİF ET
      ------------------------------------------------------------------
      automatic_enable = true,
      vim.lsp.enable({
        "python",
        "c",
        "cpp",
        "lua",
        "cmake",
      })
    end,
  },
}

