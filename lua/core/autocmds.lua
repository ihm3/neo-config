local autocmd = vim.api.nvim_create_autocmd


-- Filetype bazlı indent ayarları


autocmd("FileType", {
pattern = { "lua" },
callback = function()
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
end,
})


autocmd("FileType", {
pattern = { "c", "cpp", "h", "hpp" },
callback = function()
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
end,
})


autocmd("FileType", {
pattern = { "python" },
callback = function()
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


-- Trailing whitespace temizleme
autocmd("BufWritePre", {
pattern = "*",
command = "%s/\\s\\+$//e",
})
