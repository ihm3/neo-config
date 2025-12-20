return{
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function ()
    vim.keymap.set("n", "<leader>sr", function() require("spectre").open() end, { desc = "Search and replace (Spectre)" })
    vim.keymap.set("n", "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, { desc = "Search current word (Spectre)" })
  end
}

