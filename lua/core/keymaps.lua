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

-- ============================================================================
-- Buffer keymaps
-- ============================================================================

local opts = { noremap = true, silent = true }

-- ----------------------------------------------------------------------------
-- Buffer navigation
-- ----------------------------------------------------------------------------

keymap("n", "<Tab>", ":bnext<CR>", vim.tbl_extend("force", opts, {
  desc = "Go to next buffer",
}))

keymap("n", "<S-Tab>", ":bprevious<CR>", vim.tbl_extend("force", opts, {
  desc = "Go to previous buffer",
}))

keymap("n", "<leader>bb", "<C-^>", vim.tbl_extend("force", opts, {
  desc = "Switch to last buffer",
}))

-- ----------------------------------------------------------------------------
-- Buffer close
-- ----------------------------------------------------------------------------

-- Close current buffer (safe)
keymap("n", "<leader>bd", function()
  vim.cmd("bprevious")
  vim.cmd("bdelete #")
end, vim.tbl_extend("force", opts, {
  desc = "Close current buffer (safe)",
}))

-- Force close current buffer
keymap("n", "<leader>bD", ":bdelete!<CR>", vim.tbl_extend("force", opts, {
  desc = "Force close current buffer",
}))

-- ----------------------------------------------------------------------------
-- Bulk buffer actions
-- ----------------------------------------------------------------------------

-- Close all buffers
keymap("n", "<leader>ba", ":bufdo bdelete<CR>", vim.tbl_extend("force", opts, {
  desc = "Close all buffers",
}))

-- Close all buffers except current
keymap("n", "<leader>bo", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = false })
    end
  end
end, vim.tbl_extend("force", opts, {
  desc = "Close all buffers except current",
}))

-- ----------------------------------------------------------------------------
-- Buffer list
-- ----------------------------------------------------------------------------

keymap("n", "<leader>bl", ":ls<CR>", vim.tbl_extend("force", opts, {
  desc = "List all buffers",
}))

-- =========================================================
-- Git Keymaps (Gitsigns + Fugitive + Diffview)
-- Prefix: <leader>v  (Version Control)
-- =========================================================

local opts = { noremap = true, silent = true }

--========================
-- GITSIGNS (line / hunk)
-- ========================

keymap("n", "<leader>vs", require("gitsigns").stage_hunk,
  { desc = "Git: Stage hunk" })

keymap("n", "<leader>vr", require("gitsigns").reset_hunk,
  { desc = "Git: Reset hunk" })

keymap("n", "<leader>vp", require("gitsigns").preview_hunk,
  { desc = "Git: Preview hunk" })

keymap("n", "<leader>vb", require("gitsigns").blame_line,
  { desc = "Git: Blame line" })

keymap("n", "<leader>vB", require("gitsigns").toggle_current_line_blame,
  { desc = "Git: Toggle line blame" })

keymap("n", "<leader>vd", require("gitsigns").diffthis,
  { desc = "Git: Diff current file" })

-- ========================
-- FUGITIVE (git commands)
-- ========================

keymap("n", "<leader>vS", ":Git<CR>",
  { desc = "Git: Status" })

keymap("n", "<leader>vC", ":Git commit<CR>",
  { desc = "Git: Commit" })

keymap("n", "<leader>vP", ":Git push<CR>",
  { desc = "Git: Push" })

keymap("n", "<leader>vL", ":Git pull<CR>",
  { desc = "Git: Pull" })

keymap("n", "<leader>vA", ":Git add .<CR>",
  { desc = "Git: Add all" })

keymap("n", "<leader>vD", ":Git diff<CR>",
  { desc = "Git: Diff (index vs working tree)" })

-- ========================
-- DIFFVIEW (history / tree)
-- ========================

keymap("n", "<leader>vo", ":DiffviewOpen<CR>",
  { desc = "Git: Open Diffview" })

keymap("n", "<leader>vc", ":DiffviewClose<CR>",
  { desc = "Git: Close Diffview" })

keymap("n", "<leader>vh", ":DiffviewFileHistory<CR>",
  { desc = "Git: File history" })

keymap("n", "<leader>vH", ":DiffviewFileHistory %<CR>",
  { desc = "Git: Current file history" })
