local autocmd = vim.api.nvim_create_autocmd


-- Filetype bazlı indent ayarları
--
autocmd("FileType", {
  pattern = { '<CMakelists.txt>' },
  callback = function()
    vim.g.set_fileype = 'cmake'
  end,
})

autocmd("FileType", {
  pattern = { '<filetype>' },
  callback = function()
    vim.treesitter.start()
  end,
})

autocmd("FileType", {
  pattern = { 'TSUpdate' },
  callback = function()
    require('nvim-treesitter.parsers').cpp.install_info.generate = true
  end,
})

autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.treesitter.start()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end,
})


autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.treesitter.start()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})


autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.treesitter.start()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})


-- Yank highlight
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- nvim-ree autoclose
autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})
