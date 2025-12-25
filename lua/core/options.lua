local opt = vim.opt


-- Görünüm
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 0
opt.sidescrolloff = 0
opt.numberwidth=3

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true


-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false


-- Split davranışı
opt.splitbelow = true
opt.splitright = true


-- Dosya & backup
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"


-- Clipboard
opt.clipboard = "unnamedplus"


-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileformats = { "unix", "dos", "mac" }


-- Performans
opt.updatetime = 250
opt.timeoutlen = 400

--cmd line
opt.cmdheight = 1
