return {
	-- Mason Configuration
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "bashls", "basedpyright", "harper_ls" },
			})
		end,
	},
	-- Mason Null LS Configuration
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "shfmt", "mdformat", "prettier", "stylua", "black" },
			})
		end,
	},
	-- Nvim LSP Configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.basedpyright.setup({})
			lspconfig.harper_ls.setup({})

			vim.keymap.set("n", "<leader>bh", vim.lsp.buf.hover, { desc = "Show snippet of the object defintion" })
			vim.keymap.set("n", "<leader>bd", vim.lsp.buf.definition, { desc = "Go to where the object is defined" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
			vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
			vim.keymap.set("n", "<leader>d[", function()
				vim.diagnostic.jump({ count = -vim.v.count1 })
			end, { desc = "Jump to previous diagnostic" })
			vim.keymap.set("n", "<leader>d]", function()
				vim.diagnostic.jump({ count = vim.v.count1 })
			end, { desc = "Jump to next diagnostic" })
		end,
	},
	-- none - ls Configuration
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua.with({
						filetypes = {
							"lua",
						},
					}),
					null_ls.builtins.formatting.shfmt.with({
						filetypes = {
							"bash",
							"sh",
						},
					}),
					null_ls.builtins.formatting.black.with({
						filetypes = {
							"python",
						},
					}),
					null_ls.builtins.formatting.mdformat.with({
						filetypes = {
							"markdown",
							"md",
						},
					}),
					null_ls.builtins.formatting.prettier.with({
						filetypes = {
							"toml",
							"javascript",
							"typescript",
							"css",
							"scss",
							"html",
							"json",
							"yaml",
							"graphql",
							"txt",
						},
					}),
				},
			})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},
	-- Conform Configuration
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					sh = { "shfmt" },
					markdown = { "mdformat" },
					json = { "prettier" },
					css = { "prettier" },
					python = { "black" },
				},
				format_on_save = {
					time_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
