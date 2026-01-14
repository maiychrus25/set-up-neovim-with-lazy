return {
  "vim-test/vim-test",
  event = "VeryLazy",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    -- Dùng tmux pane để chạy test
    vim.g["test#strategy"] = "vimux"

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    -- Test keymaps
    map("<leader>tn", "<Cmd>TestNearest<CR>", "Test nearest")
    map("<leader>tf", "<Cmd>TestFile<CR>", "Test file")
    map("<leader>ts", "<Cmd>TestSuite<CR>", "Test suite")
    map("<leader>tl", "<Cmd>TestLast<CR>", "Test last")
    map("<leader>tv", "<Cmd>TestVisit<CR>", "Visit test")

    -- Optional: clear test output
    map("<leader>tc", "<Cmd>VimuxClearRunnerHistory<CR>", "Clear test output")
  end,
}
