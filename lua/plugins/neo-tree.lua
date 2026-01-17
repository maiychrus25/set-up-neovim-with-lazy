return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					filter_rules = {
						bo = {
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			-- Simplificación de la UI
			default_component_configs = {
				indent = {
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},

			window = {
				width = 35,
				mappings = {
					["<space>"] = "none", -- Desactivar el leader dentro de neotree para evitar lag
					["l"] = "open", -- Navegación HJKL
					["h"] = "close_node",
					["S"] = "open_split",
					["s"] = "open_vsplit",
					["t"] = "open_tabnew",
					["w"] = "open_with_window_picker",
				},
			},

			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		})

		-- Toggle / Open
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "NeoTree Toggle" })

		-- Filesystem
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", { desc = "Explorer (files)" })

		-- Buffers
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "Explorer (buffers)" })

		-- Git status
		vim.keymap.set("n", "<leader>gs", ":Neotree git_status reveal float<CR>", { desc = "Git Status" })

		-- Close Neo-tree
		vim.keymap.set("n", "<leader>ec", ":Neotree close<CR>", { desc = "Close NeoTree" })
	end,
}
