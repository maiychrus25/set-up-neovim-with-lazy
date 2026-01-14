return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Toggle / Open
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "NeoTree Toggle" })

    -- Filesystem
    vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { desc = "Explorer (files)" })

    -- Buffers
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Explorer (buffers)" })

    -- Git status
    vim.keymap.set("n", "<leader>gs", ":Neotree git_status reveal float<CR>", { desc = "Git Status" })

    -- Close Neo-tree
    vim.keymap.set("n", "<leader>ec", ":Neotree close<CR>", { desc = "Close NeoTree" })
  end,
}

