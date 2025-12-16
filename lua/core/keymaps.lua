local keymap = vim.keymap.set


-- Temel
keymap("n", "<leader>w", ":w<CR>", { silent = true })
keymap("n", "<leader>q", ":q<CR>", { silent = true })


-- Split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")


-- Visual mode indent fix
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>')
