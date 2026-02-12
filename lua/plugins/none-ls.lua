return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- Format cho JS/TS/React/HTML/CSS/JSON/Yaml
        formatting.prettier.with({
           -- Chỉ chạy nếu project có file config prettier (tùy chọn)
           -- condition = function(utils)
           --   return utils.root_has_file({ ".prettierrc", ".prettierrc.json", "prettier.config.js" })
           -- end,
        }),
        formatting.stylua, -- Lua
      },
    })

    -- Keymap format
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
  end,
}
