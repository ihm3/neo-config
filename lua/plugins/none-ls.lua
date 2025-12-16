return {
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      ------------------------------------------------------------
      -- Mason: formatter / linter'ları otomatik kur
      ------------------------------------------------------------
      require("mason-null-ls").setup({
        ensure_installed = {
          -- Python
          "black",
          "ruff",

          -- C / C++
          "clang-format",

          -- Lua
          "stylua",
        },
        automatic_installation = true,
      })

      ------------------------------------------------------------
      -- none-ls setup
      ------------------------------------------------------------
      null_ls.setup({
        sources = {
          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.ruff,

          -- C / C++
          null_ls.builtins.formatting.clang_format,

          -- Lua
          null_ls.builtins.formatting.stylua,
        },

        ----------------------------------------------------------
        -- Attach olunca
        ----------------------------------------------------------
        on_attach = function(client, bufnr)
          --------------------------------------------------------
          -- <leader>gf : manuel format (SADECE none-ls)
          --------------------------------------------------------
          vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({
              bufnr = bufnr,
              filter = function(c)
                return c.name == "none-ls"
              end,
            })
          end, { buffer = bufnr, desc = "Format with none-ls" })

          --------------------------------------------------------
          -- Format on save
          --------------------------------------------------------
          if client.supports_method("textDocument/formatting") then
            local augroup =
              vim.api.nvim_create_augroup("LspFormat", { clear = false })

            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = bufnr,
                  filter = function(c)
                    return c.name == "none-ls"
                  end,
                })
              end,
            })
          end
        end,
      })
    end,
  },
}

