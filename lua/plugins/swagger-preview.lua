return {
  "vinnymeller/swagger-preview.nvim",
  ft = { "yaml", "json" },
  build = "npm install -g swagger-ui-watcher",
  config = function()
    require("swagger-preview").setup({
      -- mặc định plugin đã ổn, không cần thêm option
    })

    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    map("<leader>sp", "<Cmd>SwaggerPreview<CR>", "Swagger preview")
    map("<leader>sc", "<Cmd>SwaggerPreviewStop<CR>", "Stop swagger preview")
  end,
}
