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
				ensure_installed = { "lua_ls", "bashls", "basedpyright", "ruff" },
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
				ensure_installed = { "shfmt", "mdformat", "prettier", "stylua", "ruff" },
			})
		end,
	},
	-- Nvim LSP Configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.basedpyright.setup({
			-- 	capabilities = capabilities,
			-- })
			lspconfig.ruff.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>bh", vim.lsp.buf.hover, { desc = "Show snippet of the object defintion" })
			vim.keymap.set("n", "<leader>bd", vim.lsp.buf.definition, { desc = "Go to where the object is defined" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
		end,
	},
	-- none - ls Configuration
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.ruff,
					null_ls.builtins.formatting.mdformat,
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
					python = { "ruff" },
				},
				format_on_save = {
					time_ms = 500,
					lsp_format = "fallback",
				},
			})
		end,
	},
}
