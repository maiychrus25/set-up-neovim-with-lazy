return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- Cần thiết để auto-completion hoạt động
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup({
				-- Danh sách các server cần cài đặt tự động
				ensure_installed = {
					"lua_ls",
					"ts_ls", -- TypeScript/JavaScript (tên mới của tsserver)
					"html",
					"cssls",
					"tailwindcss",
					"emmet_language_server", -- Hỗ trợ gõ tắt class/tag cực mạnh
					"eslint",
					"pyright",
				},
				-- HANDLERS: Cách cấu hình mới để tránh lỗi "deprecated"
				handlers = {
					-- 1. Handler mặc định: Setup cho tất cả server không có cấu hình riêng
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					-- 2. Handler riêng cho Lua (cấu hình biến 'vim')
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
									workspace = { library = vim.api.nvim_get_runtime_file("", true) },
								},
							},
						})
					end,

					-- 3. Handler riêng cho Emmet (Hỗ trợ nhiều loại file hơn mặc định)
					["emmet_language_server"] = function()
						require("lspconfig").emmet_language_server.setup({
							capabilities = capabilities,
							filetypes = {
								"css",
								"eruby",
								"html",
								"javascript",
								"javascriptreact",
								"less",
								"sass",
								"scss",
								"pug",
								"typescriptreact",
							},
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Cấu hình Keymap khi LSP hoạt động (LspAttach)
			local keymap = vim.keymap
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					-- Các phím tắt chuẩn cho LSP
					keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Xem doc
					keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- Đi tới định nghĩa
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					keymap.set("n", "gr", vim.lsp.buf.references, opts) -- Xem nơi sử dụng
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Đổi tên biến
					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code action

					-- THÊM DÒNG NÀY: Nhấn <Space> + d để xem lỗi chi tiết
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})

					-- THÊM DÒNG NÀY: Nhấn [d để nhảy đến lỗi trước, ]d để nhảy đến lỗi sau
					keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
					keymap.set("n", "]d", vim.diagnostic.goto_next, {})
				end,
			})
		end,
	},
}
