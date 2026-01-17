return {
	"nvim-treesitter/nvim-treesitter",

	-- ❗ BẮT BUỘC: plugin này KHÔNG hỗ trợ lazy-loading
	lazy = false,

	-- ❗ BẮT BUỘC: luôn update parser
	build = ":TSUpdate",

	config = function()
		-- setup (không bắt buộc, nhưng nên có)
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- cài parser (async)
		require("nvim-treesitter").install({
			"lua",
			"vim",
			"vimdoc",
			"bash",
			"json",
			"html",
			"css",
			"javascript",
			"typescript",
			"python",
			"go",
			"rust",
		})
	end,
}
