return {
  -- Git commands (:Git, :G, :Blame, ...)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "Gbrowse" },
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gitsigns = require("gitsigns")

      gitsigns.setup({
        signs = {
          add          = { text = "│" },
          change       = { text = "│" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },

        current_line_blame = false,
        current_line_blame_opts = {
          delay = 300,
          virt_text_pos = "eol",
        },

        preview_config = {
          border = "rounded",
          style = "minimal",
        },

        on_attach = function(bufnr)
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
              buffer = bufnr,
              desc = desc,
            })
          end

          -- Hunk navigation
          map("n", "]h", gitsigns.next_hunk, "Next Git hunk")
          map("n", "[h", gitsigns.prev_hunk, "Previous Git hunk")

          -- Hunk actions
          map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
          map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
          map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")

          map("v", "<leader>gs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Stage selected hunk")

          map("v", "<leader>gr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, "Reset selected hunk")

          -- Buffer actions
          map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
          map("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer")

          -- Blame / diff
          map("n", "<leader>gb", gitsigns.toggle_current_line_blame, "Toggle line blame")
          map("n", "<leader>gd", gitsigns.diffthis, "Diff this")
          map("n", "<leader>gD", function()
            gitsigns.diffthis("~")
          end, "Diff against last commit")
        end,
      })
    end,
  },
}
