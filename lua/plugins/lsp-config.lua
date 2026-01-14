return {
  "neovim/nvim-lspconfig",
  config = function()
    -- capabilities cho nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end

    -- =========================
    -- LSP server configurations
    -- =========================

    -- Lua
    vim.lsp.config.lua_ls = {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      },
    }

    -- Bash
    vim.lsp.config.bashls = {
      capabilities = capabilities,
    }

    -- JSON
    vim.lsp.config.jsonls = {
      capabilities = capabilities,
    }

    -- TypeScript / JavaScript (nếu có dùng)
    vim.lsp.config.ts_ls = {
      capabilities = capabilities,
    }

    -- =========================
    -- Enable LSP servers
    -- =========================
    vim.lsp.enable({
      "lua_ls",
      "bashls",
      "jsonls",
      "ts_ls",
    })
  end,
}

