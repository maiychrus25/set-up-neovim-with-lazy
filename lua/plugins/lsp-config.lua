return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				-- core
				"lua_ls",

				-- backend / frontend JS
				"ts_ls",
				"eslint",
				"tailwindcss",

				-- python
				"pyright",

				-- infra / config
				"yamlls",
				"bashls",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- Lua (Neovim)
			vim.lsp.config["lua_ls"] = {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			}
			vim.lsp.enable("lua_ls")

			-- ESLint
			vim.lsp.config["eslint"] = {
				capabilities = capabilities,
				settings = {
					run = "onSave",
					format = true,
				},
			}

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "eslint"
						end,
					})
				end,
			})

			-- TypeScript / JavaScript
			vim.lsp.config["ts_ls"] = {
				capabilities = capabilities,
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
			}

			-- TailwindCSS
			vim.lsp.config["tailwindcss"] = {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"astro",
				},
			}

			-- Python
			vim.lsp.config["pyright"] = {
				capabilities = capabilities,
			}

			-- YAML
			vim.lsp.config["yamlls"] = {
				capabilities = capabilities,
			}

			-- Bash
			vim.lsp.config["bashls"] = {
				capabilities = capabilities,
			}

			-- Enable LSPs
			vim.lsp.enable({
				"ts_ls",
				"eslint",
				"tailwindcss",
				"pyright",
				"yamlls",
				"bashls",
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

			-- List symbols (JS / TS / Python / Lua)
			vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					javascript = "function",
					typescript = "function",
					javascriptreact = "function",
					typescriptreact = "function",
					python = "function",
					lua = "function",
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end)
		end,
	},
}
