return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,

      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },

      float = {
        padding = 2,
        max_width = 80,
        max_height = 30,
        border = "rounded",
      },

      view_options = {
        show_hidden = true,
      },

      skip_confirm_for_simple_edits = true,
    })

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    -- Open Oil
    map("-", "<Cmd>Oil<CR>", "Open Oil file explorer")

    -- Floating Oil
    map("<leader>of", oil.toggle_float, "Oil floating explorer")
  end,
}
