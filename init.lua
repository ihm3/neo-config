-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("core.options")
require("core.autocmds")

vim.opt.termguicolors = true

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.api.nvim_set_hl(0, "@keyword",  { link = "Keyword" })
vim.api.nvim_set_hl(0, "@type",     { link = "Type" })
vim.api.nvim_set_hl(0, "@function", { link = "Function" })
vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })

require("lazy").setup("plugins")
require("core.keymaps")
vim.cmd.colorscheme("monokai-pro")
