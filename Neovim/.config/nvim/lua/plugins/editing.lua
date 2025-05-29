return {
	-- Lastplace Configuration
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
	-- Autopairs Configuration
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	-- Surrounding Configuration
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
  -- Autosave Configuration
	{
		"okuuva/auto-save.nvim",
		version = "*",
		config = function()
			require("auto-save").setup({
				noautocmd = false,
			})
		end,
	},
	-- Indentlines Configuration
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
}
