return {
	-- Treesitter Configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	-- Render Markdown Configuration
	{
		"MeanderingProgrammer/render-markdown.nvim",
		main = "render-markdown",
		name = "render-markdown",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		config = function()
			require("render-markdown").setup({
				render_modes = true,
				win_options = {
					concealcursor = { rendered = "nvc" },
				},
				anti_conceal = {
					enabled = true,
					ignore = {
						code_background = true,
						code_border = true,
						code_language = true,
						head_icon = true,
						head_background = true,
						head_border = true,
						sign = true,
						dash = true,
						bullet = true,
					},
				},
				code = {
					style = "full",
					language_name = true,
					border = "thick",
				},
			})
		end,
	},
}
