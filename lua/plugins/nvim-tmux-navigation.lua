return {
  "alexghergh/nvim-tmux-navigation",
  event = "VeryLazy",
  config = function()
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true, -- không chuyển pane khi tmux zoom
    })

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    map("<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", "Tmux navigate left")
    map("<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", "Tmux navigate down")
    map("<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", "Tmux navigate up")
    map("<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", "Tmux navigate right")
  end,
}
