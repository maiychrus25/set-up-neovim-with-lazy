return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- Load plugin khi mở file
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Định nghĩa formatter cho từng loại file
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" }, -- Dùng stylua cho file config Neovim
				-- Lưu ý về PUG bên dưới (*)
				pug = { "prettier" },
			},

			-- Tự động Format khi lưu file (Format on Save)
			format_on_save = {
				lsp_fallback = true, -- Nếu không có prettier thì dùng LSP mặc định
				async = false, -- Chạy đồng bộ (chờ format xong mới lưu)
				timeout_ms = 500, -- Thời gian chờ tối đa
			},
		})

		-- Phím tắt để Format thủ công: <Leader> + f
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 3000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
