return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local none_ls = require("null-ls")

    none_ls.setup({
      sources = {
        -- Lua
        none_ls.builtins.formatting.stylua,

        -- JS / TS / JSON / HTML / CSS
        -- none_ls.builtins.formatting.prettier,

        -- Ruby
        none_ls.builtins.diagnostics.rubocop,
        none_ls.builtins.formatting.rubocop,

        -- ERB
        none_ls.builtins.diagnostics.erb_lint,
      },

      -- Format on save (an toàn)
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("NoneLsFormat", { clear = false })

          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                timeout_ms = 2000,
                filter = function(client)
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })

    -- Format thủ công
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ 
        async = true,
        filter = function(client)
          return client.name == "null-ls"
        end,
      })
    end, { desc = "Format file" })
  end,
}
