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

--fiesystem
--vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
