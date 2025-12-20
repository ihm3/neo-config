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
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- terminal
local function open_term_bottom_ratio(ratio)
  local total_height = vim.o.lines
  local cmd_height = vim.o.cmdheight
  local height = math.floor((total_height - cmd_height) * ratio)

  vim.cmd("belowright " .. height .. "split")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

keymap("n", "<leader>t", function()
  open_term_bottom_ratio(0.3)
end, { noremap = true, silent = true, desc = 'Terminal on horizontal' })

